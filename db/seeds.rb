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
users = User.create!([
  {name: '1User'}
  {name: '2User'}
  ])
tests = Test.create!([
<<<<<<< HEAD
  {level: 1, title: 'RUBY-TEST', category: categories.first, user: users.first}
  {level:0,title:'HTML-TEST',category:categories.last,user:users.last
=======

  {level: 1, title: 'RUBY-TEST', category_id: categories.first.id, user_id: users.first.id}
  {level:0,title:'HTML-TEST',category_id:categories.last.id,user_id:users.last.id}
>>>>>>> 81ac5a8c3c714cd0cdb061f6fcff0ff9c5924141
  ])
questions = Question.create!([
  {title: 'Вопрос 1', test: tests.first}
  {title: 'Вопрос 2', test: tests.last}
  ])
answers = Answer.create!([
<<<<<<< HEAD
  {title: 'Ответ', correct: true, question: questions.first
  {title: 'НЕ Ответ', correct: false, question: questions.first}
  {title: 'НЕ Ответ', correct: false, question: questions.first}
  {title: 'НЕ Ответ', correct: false, question: questions.last}
  {title: 'Ответ', correct: true, question: questions.last}
  {title: 'НЕ Ответ', correct: false, question: questions.last}
=======
  {title: 'Ответ', correct: true, question_id: questions.first.id}
  {title: 'НЕ Ответ', correct: false, question_id: questions.first.id}
  {title: 'НЕ Ответ', correct: false, question_id: questions.first.id}
  {title: 'НЕ Ответ', correct: false, question_id: questions.last.id}
  {title: 'Ответ', correct: true, question_id: questions.last.id}
  {title: 'НЕ Ответ', correct: false, question_id: questions.last.id}

 
>>>>>>> 81ac5a8c3c714cd0cdb061f6fcff0ff9c5924141
  ])
