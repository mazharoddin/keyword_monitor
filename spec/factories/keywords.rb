# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :keyword do
    sequence(:name) { |n| "keyword #{n}" }
    project
  end
end
