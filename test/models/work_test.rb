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

require 'test_helper'

class WorkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
