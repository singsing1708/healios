FactoryBot.define do
  factory :url_mapping do
    association :user
    original_url { Faker::Internet.url }
    hashed_path { SecureRandom.alphanumeric(7) }
  end
end
