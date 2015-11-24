# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :list do
    sequence(:name) { |n| "List #{n}" }
  end
end
