# == Schema Information
#
# Table name: url_mapping_clicks
#
#  id             :bigint           not null, primary key
#  url_mapping_id :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe UrlMappingClick, type: :model do

  describe "#FactoryBot" do
    it "can have factory" do
      url_mapping_click = FactoryBot.create(:url_mapping_click)
      expect(url_mapping_click).to be_a UrlMappingClick
      expect(url_mapping_click.id).to be_truthy
    end
  end

  describe "#create" do
    it "should can get related user" do
      url_mapping = FactoryBot.create(:url_mapping)
      url_mapping_click = FactoryBot.create(
        :url_mapping_click,
        url_mapping: url_mapping,
      )
      expect(url_mapping_click.url_mapping).to eq url_mapping
    end
  end

end
