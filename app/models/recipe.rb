class Recipe < ApplicationRecord
    validates_presence_of :name, :complexity, :genre
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    def total_cost
      all_ingredients = []
      ingredients.each do |ingredient|
        all_ingredients << ingredient.cost
      end
      all_ingredients.sum
    end
end
