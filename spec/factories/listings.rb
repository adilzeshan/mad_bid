FactoryGirl.define do
  factory :listing do
    title "iPhone 5"
    description "Awesome retina display"
    starting_price "12"
    rrp "559"
    current_price "1200"
    credits_per_bid "5"
    countdown_duration 10
    starting_date Time.now
    expiring_date "2013-08-06 15:32:45"
    active false

    factory :active_listing, class: Listing do
      active true

      factory :inactive_listing, class: Listing do
        starting_date Time.now - 12
      end
    end
  end
end