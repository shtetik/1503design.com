# == Schema Information
#
# Table name: works
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  caption    :string           not null
#  text       :text             not null
#  link       :string
#  year       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string           default(""), not null
#
# Indexes
#
#  index_works_on_name  (name) UNIQUE
#  index_works_on_slug  (slug) UNIQUE
#

class Work < ApplicationRecord
  extend FriendlyId

  friendly_id :name

  validates :caption, :text, :year, presence: true
  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }

  has_and_belongs_to_many :tags
end
