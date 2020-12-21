# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
return if Category.exists?

categories = Category.create!([
  {title: 'RUBY'}
  {title: 'HTML'}
  ])
user = User.create!([
  {name: '1User'}
  {name: '2User'}
  ])
test = Test.create!([
  {level: 1, title: 'RUBY-TEST', categories_id: 1, users_id: 1}
  {level:0,title:'HTML-TEST',categories_id:2,user_id:2}
  ])
question = Question.create!([
  {title: 'Вопрос 1', tests_id: 1}
  {title: 'Вопрос 2', tests_id:2}
  ])
answer = Answer.create!([
  {title: 'Ответ', correct: true, questions_id: 1}
  {title: 'НЕ Ответ', correct: false, questions_id: 1}
  {title: 'НЕ Ответ', correct: false, questions_id: 1}
  {title: 'НЕ Ответ', correct: false, questions_id: 2}
  {title: 'Ответ', correct: true, questions_id: 2}
  {title: 'НЕ Ответ', correct: false, questions_id: 2}
  ])
