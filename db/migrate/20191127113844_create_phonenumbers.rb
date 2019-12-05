class CreatePhonenumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :phonenumbers do |t|
      t.references :user, foreign_key: true
      t.string :phone_number, null: false, unique: true
      t.timestamps
    end
  end
end
