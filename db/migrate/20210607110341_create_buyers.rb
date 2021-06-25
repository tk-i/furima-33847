class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string     :postal,  null: false
      t.string     :area_id, null: false
      t.string     :city,    null: false
      t.string     :address, null: false
      t.string     :address2
      t.string     :phone,   null: false
      t.references :log,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
