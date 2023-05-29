# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

# Generar usuarios falsos
10.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password', # Establece la contraseña deseada aquí
    password_confirmation: 'password' # Si estás utilizando `has_secure_password`, asegúrate de incluir la confirmación de contraseña
  )
  user.save(validate: false) # Guardar el usuario sin validar las restricciones de validez
end

# Generar noticias falsas
10.times do
  user = User.order('RANDOM()').first
  Article.create(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph,
    user: user
  )
end

# Generar comentarios falsos
20.times do
  user = User.order('RANDOM()').first
  article = Article.order('RANDOM()').first
  Comment.create(
    content: Faker::Lorem.paragraph,
    user: user,
    article: article
  )
end
