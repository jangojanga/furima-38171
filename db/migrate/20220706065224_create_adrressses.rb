class CreateAdrressses < ActiveRecord::Migration[6.0]
  def change
    create_table :adrressses do |t|

       t.string     :post_code,        null: false
       t.integer    :former_area_id,   null: false, foreign_key: true
       t.string     :city,             null: false
       t.string     :address,          null: false
       t.string     :building      
       t.string     :tel,              null: false
       t.references  :buyer,            null: false, foreign_key: true

      t.timestamps
    end
  end
end
