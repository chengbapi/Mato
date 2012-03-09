class ArticlesController < ApplicationController
  before_filter :require_user!
  # GET /articles
  # GET /articles.json
  def index
    @user = User.find( params[:user_id] )
    @articles = @user.articles

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @user = current_user
    @article = current_user.articles.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @user = User.find(params[:user_id])
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @user = User.find(params[:user_id]) 
    @article = @user.articles.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to [@user,@article], notice: 'Article was successfully created.' }
        format.json { render json:[@user,@article], status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @user = User.find(params[:user_id]) 
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to [@user,@article] , notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to user_articles_url }
      format.json { head :no_content }
    end
  end
end
