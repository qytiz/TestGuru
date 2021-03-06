# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :title, presence: true
  validate :num_of_answers

  scope :correct_only, -> { where(correct: true) }
  scope :correct, -> { where(correct: true) }

  private

  def num_of_answers
    errors.add(:question) if question.answers.count >= 4
  end
end
