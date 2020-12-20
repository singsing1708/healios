class CreateUrlMappings < ActiveRecord::Migration[6.0]
  def change
    create_table :url_mappings do |t|
      t.references :user, index: true, foreign_key: true
      t.string :original_url, null: false
      t.string :hashed_path, null: false
      t.timestamps
    end

    add_index :url_mappings, :hashed_path, :unique => true
  end
end
