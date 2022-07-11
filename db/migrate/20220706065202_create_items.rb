class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      
      t.string   :name
      t.text     :description
      t.integer  :category_id
      t.integer  :item_status_id
      t.integer  :lord_id
      t.integer  :former_area_id
      t.integer  :days_before_id
      t.integer  :price
      t.timestamps
    end
  end
end
