class ArticlesController  < ApplicationController
    #get /articles
    def index
        @articles = Article.all
    end 
end 
