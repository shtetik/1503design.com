# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  slug       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tags_on_name  (name) UNIQUE
#  index_tags_on_slug  (slug) UNIQUE
#

class Tag < ApplicationRecord
  extend FriendlyId

  friendly_id :name

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }

  has_and_belongs_to_many :works
end
