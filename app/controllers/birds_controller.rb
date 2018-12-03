class BirdsController < ApplicationController
  before_action :set_bird, only: [:show, :edit, :update, :destroy]
 
  def index
    @birds = Bird.all
  end

  def new
    if params[:back]
      @bird = Bird.new(bird_params)
    else
      @bird = Bird.new
    end
  end

  def create
    @bird = Bird.new(bird_params)
    if @bird.save
      redirect_to birds_path, notice: "ブログを作成しました！"
    else
      render 'new'
    end 
  end

  def index
    @birds = Bird.all
  end  

  def show  
  end

  def edit
  end

  def update  
    if @bird.update(bird_params)
      redirect_to birds_path, notice: "編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @bird.destroy
    redirect_to birds_path, notice:"削除しました！"
  end

  def confirm
    @bird = Bird.new(bird_params)
    render :new if @bird.invalid?
  end

private
  def bird_params
    params.require(:bird).permit(:content)
  end

  def set_bird
    @bird = Bird.find(params[:id])
  end

end
