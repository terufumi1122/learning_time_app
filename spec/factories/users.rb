# == Schema Information
#
# Table name: users
#
#  id                             :bigint           not null, primary key
#  email                          :string(255)      not null
#  encrypted_line_notify_token    :string(255)
#  encrypted_line_notify_token_iv :string(255)
#  name                           :string(32)       not null
#  password_digest                :string(255)      not null
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#

FactoryBot.define do
  factory :user do
    name { "MyString" }
    email { "MyString@sample.com" }
    password { "MyString" }
    password_confirmation { "MyString" }
    line_notify_token { "a"*43 }
  end
end
