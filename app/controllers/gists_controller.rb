class GistsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage

  def create
    question = @test_passage.current_question
    result = GistQuestionService.new(question).call
      if result.html_url.present?
        Gist.create!(url: result.html_url, user: current_user, question: question)
        flash[:notice]=t('.success', url:result.html_url)
      else 
        flash[:alert] = t('.failure')
      end
    redirect_to @test_passage
  end
  
  private
  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
