class CreateSignUps < ActiveRecord::Migration
  def change
    create_table :sign_ups do |t|
      t.string :email

      t.timestamps null: false
    end
  end
end
