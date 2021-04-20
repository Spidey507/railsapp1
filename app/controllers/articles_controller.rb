class ArticlesController < ApplicationController
  before_action :authenticate_user!
  def index
    @IsATrap = false
    @articles = Article.all
  end
  def show
    @Article = Article.find(params[:id])
    @Article.increment!(:views)
  end
  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to @article 
    
    else
      render :new
    end
  end
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end
  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
