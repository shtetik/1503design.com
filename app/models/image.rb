# == Schema Information
#
# Table name: images
#
#  id               :integer          not null, primary key
#  work_id          :integer
#  img_file_name    :string
#  img_content_type :string
#  img_file_size    :integer
#  img_updated_at   :datetime
#  kind             :integer          default("sample"), not null
#  half             :boolean          default(FALSE), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_images_on_work_id  (work_id)
#

class Image < ApplicationRecord
  extend OrderAsSpecified

  enum kind: [:sample, :cover, :cover_hover]

  belongs_to :work

  has_attached_file :img

  validates :kind, :work, presence: true
  validates_attachment :img, presence: true, content_type: { content_type: /\Aimage\/.*\z/ }

  scope :only_sample, -> { where(kind: :sample) }
  scope :only_cover, -> { where(kind: :cover) }
  scope :only_cover_hover, -> { where(kind: :cover_hover) }
end
