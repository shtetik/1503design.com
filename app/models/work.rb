# == Schema Information
#
# Table name: works
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  caption         :string           not null
#  text            :text             not null
#  link            :string
#  year            :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  slug            :string           default(""), not null
#  image_positions :json             not null
#
# Indexes
#
#  index_works_on_name  (name) UNIQUE
#  index_works_on_slug  (slug) UNIQUE
#

class Work < ApplicationRecord
  include Friendliable

  acts_as_list

  validates :caption, :text, :year, :tags, presence: true
  validates :link, url: { allow_blank: true }

  validate :cover_required

  has_and_belongs_to_many :tags
  has_many :works, -> { distinct }, through: :tags

  has_many :images, dependent: :destroy, inverse_of: :work

  has_one :cover_image, -> { where(kind: :cover) }, class_name: 'Image'
  has_one :cover_hover_image, -> { where(kind: :cover_hover) }, class_name: 'Image'

  accepts_nested_attributes_for :images, reject_if: -> (a) { a[:id].blank? && a[:img].blank? }, allow_destroy: true

  after_save :only_one_cover

  scope :without_ids, -> (ids) { where.not(id: ids) }
  scope :have_pages, -> (ids) { where(has_page: true) }

  def positionable_sample_images
    image_positions = JSON.parse self.image_positions
    image_ids = image_positions.sort_by{|_k, v| v}.to_h.keys
    images.only_sample.order_as_specified(id: image_ids)
  end

  def related_works
    works.without_ids(id).sample(3)
  end

  private

  def cover_required
    if images.select{ |i| i.cover? }.blank?
      errors.add(:cover_image, "can't be blank")
    end
  end

  def only_one_cover
    covers = images.only_cover
    cover_hovers = images.only_cover_hover

    covers.first.destroy if covers.count > 1
    cover_hovers.first.destroy if cover_hovers.count > 1
  end
end
