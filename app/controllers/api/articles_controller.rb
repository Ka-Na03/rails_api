class Api::ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  def create
    @article = Article.new(article_params)
    if @article.save
      render json: { article: article_response }, status: :created
    else
      render json: { errors: @article.errors }, status: :unprocessable_entity
    end
  end

  def show
    render json: { article: article_response }
  end

  def update
    if @article.update(article_params)
      render json: { article: article_response }
    else
      render json: { errors: @article.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    head :no_content
  end

  private

  def set_article
    @article = Article.find_by(slug: params[:slug] || params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, :body)
  end

  def article_response
    {
      slug: @article.slug,
      title: @article.title,
      description: @article.description,
      body: @article.body,
      createdAt: @article.created_at,
      updatedAt: @article.updated_at
    }
  end
end
