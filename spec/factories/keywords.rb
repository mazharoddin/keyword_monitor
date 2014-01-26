# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :keyword do
    sequence(:name) { |n| "keyword #{n}" }
    project
    positions [
      ['2014-3-21 10:30'.to_time, 12],
      ['2014-3-22 12:30'.to_time, 10],
      ['2014-3-22 22:50'.to_time, 7]
    ]
  end
end
