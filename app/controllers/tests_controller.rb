class TestsController < ApplicationController

  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end
  
  def new
    @test = Test.new
    @categories=Category.all
    @users=User.all #TODO После создания авторизации переделать на авто выбор 
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end
  
  def edit
    @test=Test.find(params[:id])
    @categories=Category.all
  end

  def update
    @test=Test.find(params[:id])
    if @test.update(test_params)
      redirect_to @test
    else 
      render :edit
    end
  end
  
  def destroy
    @test=Test.find(params[:id])

    @test.destroy
    redirect_to tests_path
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :user_id)
  end
end