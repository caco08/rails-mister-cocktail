class Drink < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name_and_ingredientes,
    against: [ :name, :ingredientes ],
    using: {
      tsearch: { prefix: true }
    }
end
