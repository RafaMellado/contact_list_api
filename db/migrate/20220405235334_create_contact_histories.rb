class CreateContactHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :contact_histories do |t|
      t.string :givenname
      t.string :surname
      t.string :email
      t.string :phone
      t.belongs_to :contact, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
