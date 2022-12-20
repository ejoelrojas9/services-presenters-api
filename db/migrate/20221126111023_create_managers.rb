class CreateManagers < ActiveRecord::Migration[7.0]
  def change
    create_table :managers do |t|
      t.string :email
      t.string :username
      t.string :phone
      t.references :customer, foreing_key: true

      t.timestamps
    end
  end
end
