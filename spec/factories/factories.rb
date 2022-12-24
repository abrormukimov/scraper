FactoryBot.define do
  factory :article do
    headline { Faker::Name.unique.name }
  end
end
