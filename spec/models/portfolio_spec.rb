# == Schema Information
#
# Table name: portfolios
#
#  id         :bigint           not null, primary key
#  balance    :decimal(15, 2)   default(0.0)
#  first_name :string
#  last_name  :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Portfolio, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
