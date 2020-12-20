class AddUrlMappingClicksCountToUrlMappings < ActiveRecord::Migration[6.0]
  def self.up
    add_column :url_mappings, :url_mapping_clicks_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :url_mappings, :url_mapping_clicks_count
  end
end
