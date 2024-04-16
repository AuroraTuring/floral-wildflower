require "rails_helper"

RSpec.describe "Recipes Show", type: :feature do

  before(:each) do
    @tacos = Recipe.create!(name: "Tacos", complexity: 4, genre: "Mexican")

    @tomato = Ingredient.create!(name: "Tomato", cost: 2)
    @onion = Ingredient.create!(name: "Onion", cost: 1.5)
    @garlic = Ingredient.create!(name: "Garlic", cost: 1)

    RecipeIngredient.create!(recipe: @tacos, ingredient: @tomato)
    RecipeIngredient.create!(recipe: @tacos, ingredient: @onion)
    RecipeIngredient.create!(recipe: @tacos, ingredient: @garlic)
  end

  describe "when I visit '/recipes/:id'" do
    it "then I see the recipe's name, complexity and genre" do
      visit "/recipes/#{@tacos.id}"

      expect(page).to have_content(@tacos.name)
      expect(page).to have_content(@tacos.complexity)
      expect(page).to have_content(@tacos.genre)
    end
  end

  it "and I see a list of the names of the ingredients for the recipe" do
    visit "/recipes/#{@tacos.id}"

    save_and_open_page

    expect(page).to have_content(@onion.name)
    expect(page).to have_content(@garlic.name)
    expect(page).to have_content(@tomato.name)
  end

  # it "sees the total cost of all of the ingredients in the recipe" do
  #   x
  # end
end
