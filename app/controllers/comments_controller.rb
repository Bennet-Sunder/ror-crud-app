class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comments_params)
        redirect_to @article
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to article_path(article)
    end

    def comments_params
        params.require(:comment).permit(:commenter, :body)
    end 
end
