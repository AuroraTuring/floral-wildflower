require "rails_helper"

RSpec.describe Recipe, type: :model do
  before(:each) do
    @tacos = Recipe.create!(name: "Tacos", complexity: 4, genre: "Mexican")

    @tomato = Ingredient.create!(name: "Tomato", cost: 2)
    @onion = Ingredient.create!(name: "Onion", cost: 1.5)
    @garlic = Ingredient.create!(name: "Garlic", cost: 1)

    RecipeIngredient.create!(recipe: @tacos, ingredient: @tomato)
    RecipeIngredient.create!(recipe: @tacos, ingredient: @onion)
    RecipeIngredient.create!(recipe: @tacos, ingredient: @garlic)
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe "relationships" do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  it "sees the total cost of all of the ingredients in the recipe" do
    expect(@tacos.total_cost).to eq(4.5)
  end
end
