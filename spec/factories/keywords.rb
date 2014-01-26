# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :keyword do
    name "MyString"
    positions "MyText"
    project nil
  end
end
