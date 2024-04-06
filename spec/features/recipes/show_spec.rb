require "rails_helper"

RSpec.describe "Recipes Show", type: :feature do

  before(:each) do
    @flour = Ingredient.create(name: "Flour", cost: 2)
    @sugar = Ingredient.create(name: "Sugar", cost: 3)
    @salt = Ingredient.create(name: "Salt", cost: 1)
    @chocolate_cake = Recipe.create(name: "Chocolate Cake", complexity: 3, genre: "Dessert")
    @spaghetti_carbonara = Recipe.create(name: "Spaghetti Carbonara", complexity: 2, genre: "Italian")
    @chicken_curry = Recipe.create(name: "Chicken Curry", complexity: 4, genre: "Indian")
    RecipeIngredient.create(recipe_id: 1, ingredient_id: 1)
    RecipeIngredient.create(recipe_id: 1, ingredient_id: 2)
    RecipeIngredient.create(recipe_id: 2, ingredient_id: 1)
    RecipeIngredient.create(recipe_id: 2, ingredient_id: 3)
    RecipeIngredient.create(recipe_id: 3, ingredient_id: 3)
  end

  describe "when I visit '/recipes/:id'" do
    it "then I see the recipe's name, complexity and genre" do
      visit "/recipes/#{@chocolate_cake.id}"

      expect(page).to have_content(@chocolate_cake.name)
      expect(page).to have_content(@chocolate_cake.complexity)
      expect(page).to have_content(@chocolate_cake.genre)
    end
  end

  it "and I see a list of the names of the ingredients for the recipe" do
    visit "/recipes/#{@chocolate_cake.id}"

    expect(page).to have_content(@flour.name)
    expect(page).to have_content(@sugar.name)
  end
end
