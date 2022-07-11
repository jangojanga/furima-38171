class CreateAdrressses < ActiveRecord::Migration[6.0]
  def change
    create_table :adrressses do |t|

      t.string     :post_code
      t.integer    :former_area_id
      t.string     :city
      t.string     :address
      t.string     :building
      t.string     :tel
      t.references :buyer
      t.timestamps
    end
  end
end
