# == Schema Information
#
# Table name: url_mapping_clicks
#
#  id             :bigint           not null, primary key
#  url_mapping_id :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class UrlMappingClick < ApplicationRecord
  belongs_to :url_mapping
  counter_culture :url_mapping
end
