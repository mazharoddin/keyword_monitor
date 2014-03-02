# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :crawl_result do
    status   { [:missing, :blocked, :found].sample }
    position { Random.rand(1..80) }
    url      "http://example.com/page"
    keyword
  end
end
