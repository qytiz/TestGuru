# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :category
 
  has_many :questions, dependent: :destroy
  has_many :test_passeges, dependent: :destroy
  has_many :passing_users, through: :test_passeges, source: :user
<<<<<<< HEAD
  def self.tests_with_category(category)
    joins('JOIN categories ON test.category_id = categories_id')
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
=======
>>>>>>> 81ac5a8c3c714cd0cdb061f6fcff0ff9c5924141

end
