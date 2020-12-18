class Test < ApplicationRecord
  def self.tests_with_category(category)
    Test.joins('JOIN categories ON test.category_id = categories_id')
        .where('categories.title': category)
        .order(title: :ASC)
        .pluck(:title)
  end
end
