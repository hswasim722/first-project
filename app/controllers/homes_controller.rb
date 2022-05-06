class HomesController < ApplicationController
 

  include Pagy::Backend
  include Pagy::Frontend  
  layout "application"
    def homepage
      
     # @post_home=Post.order("created_at DESC")
     @post_home=Post.all
      if params[:query].present?
        
        @pagy, @post = pagy(Post.where("title LIKE ?", "%" + params[:query] + "%"),items: 3)
     
      else
        @pagy, @post = pagy(Post.all, page: params[:page],items: 3)
      end
    end
    def show
        @post = Post.find(params[:id])
    end 
    def new
        @post = Post.new
    end
    
    def create
      
        @post = Post.new(post_params)
    
        if @post.save
          redirect_to "/show/#{@post.id}"
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit
      @post = Post.find(params[:id])
    end
    def delete_post
      
      @post = Post.find(params[:id])
      @post.destroy

    redirect_to root_path, status: :see_other
    end
    def update
      @post = Post.find(params[:id])
  
      if @post.update(post_params)
        redirect_to "/show/#{@post.id}"
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    private
    def post_params
      params.require(:post).permit(:title, :description,:image)
    end
    
end

