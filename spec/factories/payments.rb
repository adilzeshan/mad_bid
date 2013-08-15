# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment do
    no_of_credits 1
    payment_amount 1
  end
end
