class ArticlesController < ApplicationController
	include ArticlesHelper

	def index
	@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def show
		@article = Article.find(params[:id])
	end

	def create
		#method 1 of creating (The best way)
		@article = Article.create(article_params)
		if @article.save
			flash.notice = "Article '#{@article.title}' Created!"
		redirect_to @article
		else
		render 'new'
		end
	 
	  #Method two of creating
		#@article = Article.new
		#@article.title = params[:article][:title]
		#@article.body = params[:article][:body]
		#@article.save

	  # method three of creating
		#@article = Article.new(
		#title: params[:article][:title],
		#body: params[:article][:body])
		#@article.save
		#redirect_to @article

	   # my fourth method (different syntax)
		#@article = Article.new(
		#:title => params[:article][:title],
		#:body => params[:article][:body])
		#@article.save
		#redirect_to @article
	end

	
	def update
	  @article = Article.find(params[:id])
	  @article.update(article_params)
	  flash.notice = "Article '#{@article.title}' Updated!"
	  redirect_to article_path(@article)
	end
	

	def edit
		@article = Article.find(params[:id])
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash.notice = "The article #{@article.title} has been destroyed"
		redirect_to articles_path
	end
end
