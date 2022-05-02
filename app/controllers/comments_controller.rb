class CommentsController < HomesController
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        redirect_to  "/show/#{@post.id}"
      end
    
      private
        def comment_params
          params.require(:comment).permit(:commenter, :body)
        end
end
