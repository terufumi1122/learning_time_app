# == Schema Information
#
# Table name: records
#
#  id          :bigint           not null, primary key
#  description :string(255)
#  emotion     :integer
#  lap_time    :integer
#  start_time  :datetime         not null
#  stop_time   :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_records_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Record, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
