FactoryBot.define do
  factory :invoice do
    amount { "9.99" }
    company { "MyString" }
    contragent { "MyString" }
    currency { "MyString" }
    date { "2019-06-16" }
    user { nil }
  end
end
