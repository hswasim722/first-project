class HomesController < ActionController::Base
    layout "application"
    def homepage
        @post=Post.all
    end
    def showpage
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
      params.require(:post).permit(:title, :description)
    end
    
end

