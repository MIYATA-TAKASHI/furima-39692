class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  validates :genre_id, numericality: { other_than: 1 }
end