# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :listing do
    title ""
    description ""
    starting_price ""
    rrp ""
    cost_per_bid ""
    countdown_duration ""
    starting_date ""
    expiring_date "2013-08-06 15:32:45"
  end
end
