class Movie < ApplicationRecord
  belongs_to :director
  
  include PgSearch::Model
  multisearchable against: [:title, :synopsis]

  pg_search_scope :search,
    against: %w[title synopsis],
    associated_against: {
      director: %w[first_name last_name]
    },
    using: { tsearch: { prefix: true } }

  # pg_search_scope :search_by_director
end
