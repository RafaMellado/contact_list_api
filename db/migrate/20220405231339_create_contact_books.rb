class CreateContactBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :contact_books do |t|
      t.string :name
      t.belongs_to :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
