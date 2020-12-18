# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
return if Category.exists?

categories = Category.new(title: 'Название категории')
user = User.new(name: 'Name')
test = Test.new(level: 1, title: 'Название теста', categories_id: 1, users_id: 1)
question = Question.new(title: 'Вопрос', tests_id: 1)
answer = Answer.new(title: 'Ответ', correct: false, questions_id: 1)
