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

class UrlMapping < ApplicationRecord
  belongs_to :user
  has_many :url_mapping_clicks

  def shorten_url
    "#{ENV.fetch("HOST_NAME")}/#{self.hashed_path}"
  end

end
