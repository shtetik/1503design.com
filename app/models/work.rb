class Work < ApplicationRecord
  validates :name, :caption, :text, :year, presence: true

  has_and_belongs_to_many :tags
end
