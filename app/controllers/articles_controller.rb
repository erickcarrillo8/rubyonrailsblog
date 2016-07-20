class ArticlesController  < ApplicationController
    #get /articles
    def index
        @articles = Article.all
    end 
    #GET /articles/:id
    def show
        @articles = Article.find(params[:id])
    end 
    
    #GET /articles/:new
    def new
        @article = Article.new
    end 
    #POST /articles
    def create
        @article = Article.new(title: params[:article][:title],
                                body: params[:article][:body])
                                
        if  @article.save 
            redirect_to @article
        else
            render :new
        end
    end
    #PUT /articles/:id
    def update
        # @article.update_attributes({title: 'Nuevo Titulo'})
    end
    #DELETE /articles/:id
    def destroy
       @article = Article.find(params[:id])
       @article.destroy  #Destroy elimina el objeto de la base de datos
       redirect_to articles_path
    end
    
end 
