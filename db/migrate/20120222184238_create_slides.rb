class CreateSlides < ActiveRecord::Migration
  def change
    create_table :spree_slides do |t
      t.references :store, null: false, index: true
      t.integer :position, null: false, default: 0
      t.string :text_url
      t.string :link_url
      t.text :body
      t.boolean :published, null: false, default: false
      t.string :location

      t.timestamps
    end
  end
end
