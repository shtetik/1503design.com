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
#

class Work < ApplicationRecord
  validates :name, :caption, :text, :year, presence: true

  has_and_belongs_to_many :tags
end
