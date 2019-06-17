FactoryBot.define do
  factory :invoice do
    amount { "1000.99" }
    company { "Dummy company" }
    contragent { "Dummy Contragent" }
    currency { "$" }
    date { Date.tomorrow }
    association :user
  end
end
