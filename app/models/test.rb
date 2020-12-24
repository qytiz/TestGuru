# frozen_string_literal: true

class Test < ApplicationRecord
  def self.tests_with_category(category)
    joins('JOIN categories ON test.category_id = categories_id')
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
