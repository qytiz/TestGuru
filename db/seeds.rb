# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

return if Category.exists?

categories = Category.create!([
                                { title: 'RUBY' },
                                { title: 'HTML' }
                              ])
users = User.create!([
                       { name: '1User' },
                       { name: '2User' }
                     ])
tests = Test.create!([
                       { level: 1, title: 'RUBY-TEST', category_id: categories.first.id, user_id: users.first.id },
                       { level: 2, title: 'HTML-TEST', category_id: categories.last.id, user_id: users.last.id }
                     ])
questions = Question.create!([
                               { title: 'Вопрос 1', test_id: tests.first.id },
                               { title: 'Вопрос 2', test_id: tests.last.id }
                             ])
answers = Answer.create!([
                           { title: 'Ответ', correct: true, question_id: questions.first.id },
                           { title: 'НЕ Ответ', correct: false, question_id: questions.first.id },
                           { title: 'НЕ Ответ', correct: false, question_id: questions.first.id },
                           { title: 'НЕ Ответ', correct: false, question_id: questions.last.id },
                           { title: 'Ответ', correct: true, question_id: questions.last.id },
                           { title: 'НЕ Ответ', correct: false, question_id: questions.last.id }
                         ])
