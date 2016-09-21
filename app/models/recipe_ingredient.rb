class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  #validates :name, presence: true, length: { minimum: 2, maximum: 25 }
end
