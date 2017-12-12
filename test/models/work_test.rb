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
#  has_page        :boolean          default(FALSE), not null
#  position        :integer
#  has_client      :boolean          default(FALSE), not null
#
# Indexes
#
#  index_works_on_name  (name) UNIQUE
#  index_works_on_slug  (slug) UNIQUE
#

require 'test_helper'

class WorkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
