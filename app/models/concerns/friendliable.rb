module Friendliable
  extend ActiveSupport::Concern

  included do
    extend FriendlyId
    friendly_id :name

    validates :name, presence: true, uniqueness: true
    validates :slug, presence: true, uniqueness: { case_sensitive: false }

    def normalize_friendly_id(name)
      name.to_slug.transliterate(:russian).normalize.to_s
    end
  end
end