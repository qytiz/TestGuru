# frozen_string_literal: true

module QuestionsHelper
  def question_header(test)
    if test.persisted?
      "Edit #{test.title} Question"
    else
      "Create New #{test.title} Question"
    end
  end
end
