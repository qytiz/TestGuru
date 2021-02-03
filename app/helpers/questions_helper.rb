# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    if question.persisted?
      "Edit #{question.title} Question"
    else
      "Create New #{question.title} Question"
    end
  end
end
