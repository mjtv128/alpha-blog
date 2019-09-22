class ArticlesController < ApplicationController
    def index 
        @articles = Article.all
    end

    def new 
        @article = Article.new
    end
    
    def edit
        @article = Article.find(params[:id])
    end

    def create 
        @article = Article.new(article_params)
        if @article.save #show path is article_path
            flash[:notice] = "Article was successfully created"
            redirect_to article_path(@article)
        else  #validations that fail so renders new template again
            render 'new'
        end 
    end

    def update 
      @article = Article.find(params[:id])
      if @article.update(article_params) 
        #reuse article_params to whitelist whatever has been submitted
        flash[:notice] = "Article was successfully updated"
        redirect_to article_path(@article)
      else 
        render :edit 
      end 
    end

    def show 
        @article = Article.find(params[:id])
    end

    def destroy 
        @article = Article.find(params[:id])
        @article.destroy 
        flash[:notice] = "Article was successfully deleted"
        redirect_to articles_path
    end

    

    private 
    def article_params
        params.require(:article).permit(:title, :description)
    end

    

    
end