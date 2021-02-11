# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[show edit update destroy start]

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
      redirect_to @test
    else
      render :new
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
