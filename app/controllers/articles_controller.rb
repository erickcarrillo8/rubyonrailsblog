class ArticlesController  < ApplicationController
    #get /articles
    def index
        @articles = Article.all
    end 
    #GET /articles/:id
    def show
        @articles = Article.find(params[:id])
    end 
end 
