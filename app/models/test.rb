class Test < ApplicationRecord
  def self.tests_with_category(category)
    joins('JOIN categories ON test.category_id = categories_id')
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :category
 
  has_many :questions, dependent: :destroy
  has_many :test_passeges, dependent: :destroy
  has_many :passing_users, through: :test_passeges, source: :user
end
