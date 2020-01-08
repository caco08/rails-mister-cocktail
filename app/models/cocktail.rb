class Cocktail < ApplicationRecord
  validates :name, uniqueness: true, presence: true, uniqueness: true
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :drinks

end

