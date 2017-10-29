class Tag < ApplicationRecord
  extend FriendlyId

  friendly_id :name

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }

  has_and_belongs_to_many :works
end
