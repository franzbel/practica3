class CommentsController < ApplicationController

	def create
    	@article = Article.find(params[:article_id])
    	@comment = @article.comments.create(comment_params)
   	 	redirect_to article_path(@article)
	end

	def destroy
    	@article = Article.find(params[:article_id])
    	@comment = @article.comments.find(params[:id])
    	@comment.destroy
    	redirect_to article_path(@article)
  	end


	private
	def load_article
		@article = Article.find(params[:article_id])
	end
	def comment_params
		params.require(:comment).permit(:name, :email, :body)
	end
end