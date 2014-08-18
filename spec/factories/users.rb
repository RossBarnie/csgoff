# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :user do
    uid Faker::Number.number(17)
    nickname Faker::Name.first_name
    image Faker::Avatar::image
  end
end
