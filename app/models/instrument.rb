class Instrument < ApplicationRecord
    has_many :artist_plays
    has_many :artists, through: :artist_plays
end
