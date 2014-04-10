class ArticlesController < ApplicationController
  def dislike
      @article = Article.find(params[:id])
      var = @article.like
      var = var>0 ? var - 1 : 0
      @article.update_attributes(:like => var)
      redirect_to :action => 'index'      
  end

  def like
      @article = Article.find(params[:id])
      var = @article.like
      var = var +1
      @article.update_attributes(:like => var)
      redirect_to :action => 'index'      
  end
  def index
		@articles = Article.all 
	end

	def new
		@article = Article.new
	end
  	def show
  		@article = Article.find(params[:id])
  	end
  	def edit
  		@article = Article.find(params[:id])	
  	end

  	def update
  		@article =Article.find(params[:id])		
  		if @article.update_attributes(article_params)
    		redirect_to :action => 'show', :id => @article.id
  		else
    		render 'edit'
  		end
  	end

  	def destroy
  		@article = Article.find(params[:id])
  		@article.destroy
  		redirect_to :action => 'index'  		
  	end
#  un  nuevo objeto Article es creado y guardado. Si la operacion de guardar es un exito, el usuario es  redirigido a la 
#  pagina show, para mostrar los detalles del nuevo articulo. Si la operacion falla el  usuario es devuelto a la  pagina
#  anterior.
#  Los parametros pasados a este metodo indican a donde se debe redirigir el navegador. En el primer  uso de redirect_to
#  el   navegador  se  redirige a la  accion   especificada(show),  y  el  parametro  :id pasado  al  metodo redirect_to,  
#  tambien transmite a la accion show  	
	def create
		@article = Article.new(article_params)
		@article.like = 0
    @article.count_word = @article.body.split.size

    if @article.save 

			redirect_to :action => 'show', :id => @article.id
		else
			redirect_to :action=> :new
		end  
	end

	def article_params
      params.require(:article).permit(:title, :category, :body,:published_at)
    end
end