class CreateShortenedLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :shortened_links do |t|
      t.string :name, null: false
      t.string :shortened_path, null: false
      t.string :original_url, null: false
      t.integer :views_count, null: false, default: 0

      t.timestamps
    end
  end
end
