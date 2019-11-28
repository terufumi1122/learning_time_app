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

FactoryBot.define do
  factory :record do
    user_id { 1 }
    start_time { "2019-11-27 22:32:19" }
    stop_time { "2019-11-27 22:32:19" }
    lap_time { 1 }
    emotion { 1 }
    description { "MyString" }
  end
end
