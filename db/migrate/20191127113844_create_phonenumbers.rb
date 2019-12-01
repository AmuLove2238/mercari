class CreatePhonenumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :phonenumbers do |t|
      t.string :phone_number, null: false, unique: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
