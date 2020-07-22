class ShortenedLink < ApplicationRecord
  validates :name, :shortened_path, :original_url, presence: true
  validates :shortened_path, uniqueness: true
end
