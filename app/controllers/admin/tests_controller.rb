# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  before_action :set_categories, only: %i[edit]
  before_action :set_tests, only: %i[index update_inline]
  before_action :find_test, only: %i[show edit update destroy start update_inline]
  
  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
    @categories = Category.all
  end

  def create
    @test = current_user.self_tests.build(test_params)
    if @test.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end
  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end
  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private
  def set_categories
    @categories = Category.all
  end
  
  def set_tests
    @tests=Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end