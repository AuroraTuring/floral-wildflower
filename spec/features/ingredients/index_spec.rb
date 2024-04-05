require "rails_helper"

RSpec.describe "Ingredients Index", type: :feature do

  describe "when I visit '/ingredients'" do
    it "sees a list of all the ingredients including their name and cost" do
      flour = Ingredient.create(name: "Flour", cost: 2)
      sugar = Ingredient.create(name: "Sugar", cost: 3)
      salt = Ingredient.create(name: "Salt", cost: 1)

      visit "/ingredients"

      expect(page).to have_content(flour.name)
      expect(page).to have_content(flour.cost)
      expect(page).to have_content(sugar.name)
      expect(page).to have_content(sugar.cost)
      expect(page).to have_content(salt.name)
      expect(page).to have_content(salt.cost)
    end
  end

end
