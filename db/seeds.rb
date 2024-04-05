# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
flour = Ingredient.create(name: "Flour", cost: 2)
sugar = Ingredient.create(name: "Sugar", cost: 3)
salt = Ingredient.create(name: "Salt", cost: 1)
chocolate_cake = Recipe.create(name: "Chocolate Cake", complexity: 3, genre: "Dessert")
spaghetti_carbonara = Recipe.create(name: "Spaghetti Carbonara", complexity: 2, genre: "Italian")
chicken_curry = Recipe.create(name: "Chicken Curry", complexity: 4, genre: "Indian")
RecipeIngredient.create(recipe_id: 1, ingredient_id: 1)
RecipeIngredient.create(recipe_id: 1, ingredient_id: 2)
RecipeIngredient.create(recipe_id: 2, ingredient_id: 1)
RecipeIngredient.create(recipe_id: 2, ingredient_id: 3)
RecipeIngredient.create(recipe_id: 3, ingredient_id: 3)
