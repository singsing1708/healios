class CreateUrlMappingClicks < ActiveRecord::Migration[6.0]
  def change
    create_table :url_mapping_clicks do |t|
      t.references :url_mapping, index: true, foreign_key: true
      t.timestamps
    end
  end
end
