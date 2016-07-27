class ArticlesController  < ApplicationController
    before_action :authenticate_user!, except: [:show, :index]
    before_action :set_article , except: [:index,:new,:create]
    
    #get /articles
    def index
        @articles = Article.all
    end 
    #GET /articles/:id
    def show
       @article.update_visits_count
    end 
    
    #GET /articles/:new
    def new
        @article = Article.new
    end 
    def edit
        
    end
    
    #POST /articles
    def create
        @article = current_user.articles.new(article_params)
                                
        if  @article.save 
            redirect_to @article
        else
            render :new
        end
    end
    
    
    #PUT /articles/:id
    def update
        # @article.update_attributes({title: 'Nuevo Titulo'})
        
        if @article.update(article_params)
            redirect_to @article
        else
            render :edit
        end
    end
    #DELETE /articles/:id
    def destroy
       
       @article.destroy  #Destroy elimina el objeto de la base de datos
       redirect_to articles_path
    end
    
    
    private 
    
    def set_article
        @article = Article.find(params[:id])
    end
    
    
    def validate_user
        redirect_to new_user_session_path, notice:"Necesitas iniciar sesión"
    end
    
    def article_params
        params.require(:article).permit(:title,:body)
    end
    
    
end 
