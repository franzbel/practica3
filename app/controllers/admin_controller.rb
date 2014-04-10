class AdminController < ApplicationController
	def filtrar
		@categoria = params[:category]
		@articles = Article.where(:category => @categoria)
	end
	def menu
		@articles = Article.all.order("published_at DESC") 	
	end
	def search_title
		@titulo = params[:title]
		@articles = Article.where(:title => @titulo)
	end
	def search_word
		@palabra = params[:word]
		@articles = Article.where("body LIKE '%#{@palabra}%' ")
	end

	def search_date
		@fecha = params[:date]
		@articles = Article.where("created_at > '#{@fecha}' ")
		#@articles = Article.where("created_at > '2014-04-05' AND created_at < '2014-04-10'")
	end

	def search_doble_date
		@fecha_ini = params[:date_ini]
		@fecha_fin = params[:date_fin]
		@articles = Article.where("created_at > '#{@fecha_ini}' AND created_at < '#{@fecha_fin}'")
	end
end
