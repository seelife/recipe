class RecipeStyle < ApplicationRecord
  belongs_to :recipe
  belongs_to :style
  #validates :name, presence: true, length: { minimum: 2, maximum: 25 }
end
