# == Schema Information
#
# Table name: stocks
#
#  id           :bigint           not null, primary key
#  company_name :string
#  logo         :string
#  price        :integer
#  quantity     :integer
#  symbol       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Stock, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
