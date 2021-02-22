# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_create :before_create_set_timer
  before_update :before_update_set_next_question
  scope :success, -> { where('total_score >= ?', 85) }

  def accept!(answer_ids)
    if time_over?
      self.current_question=nil
      return
    end
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.total_score=success_rate
    save!
  end

  def complited?
    time_over? || current_question.nil?
  end

  def success?
    success_rate >= 85
  end

  def success_rate
    (correct_questions.to_f / test.questions.count) * 100
  end

  def number_of_current_question
    self.test.questions.index(current_question) + 1
  end
  private

  def correct_answers
    current_question.answers.correct
  end

  def correct_answer?(answer_ids)
    if (answer_ids.present?)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
    end
  end
  
  def time_over?
    if end_at.present?
      end_at.past?
    else
      false
    end
  end

  def before_create_set_timer
    self.started_at=Time.now
    if test.timer_in_minutes.present?
      self.end_at=self.started_at+test.timer_in_minutes*60
    end
  end
  
  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_update_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
