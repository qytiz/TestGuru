# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test , dependent: :destroy
  has_many :answers
end
