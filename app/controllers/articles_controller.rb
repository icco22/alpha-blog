class ArticlesController < ApplicationController
    before_action :find_article, only: [:edit, :destroy, :show, :update]

   def index
        @articles = Article.all
   end
   
   def new
       @article = Article.new
   end
   
   def create
       @article = Article.new(article_params)
       if @article.save
           flash[:success] = "Blog je kreiran!"
           redirect_to article_path(@article)
        else
            render "new"
        end
    end
    
    def edit
    end
    
    def update
        if @article.update(article_params)
            flash[:notice] = "Blog je izmjenjen!"
            redirect_to article_path(@article)
        else
            render "update"
        end
    end
    
    def show
    end
    
    def destroy
       @article.destroy
       flash[:notice] = "Artikal izbrisan!"
       redirect_to articles_path
    end

    private
    def find_article
        @article = Article.find(params[:id])
    end
    
    def article_params
        params.require(:article).permit(:title, :description)    
    end
end