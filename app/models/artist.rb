class Artist < ApplicationRecord
    has_many :artist_plays
    has_many :instruments, through: :artist_plays

    validates :name, :title, :age, presence: true
    validates :title, uniqueness: true
    validates :age, numericality: true
end
