# == Schema Information
#
# Table name: url_mappings
#
#  id                       :bigint           not null, primary key
#  user_id                  :bigint
#  original_url             :string           not null
#  hashed_path              :string           not null
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  url_mapping_clicks_count :integer          default(0), not null
#

FactoryBot.define do
  factory :url_mapping do
    association :user
    original_url { Faker::Internet.url }
    hashed_path { SecureRandom.alphanumeric(7) }
  end
end
