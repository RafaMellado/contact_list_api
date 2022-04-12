# == Schema Information
#
# Table name: contact_books
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_contact_books_on_user_id  (user_id)
#
class ContactBook < ApplicationRecord
  validates :name, length: { minimum: 4, maximum: 20 }, uniqueness: { scope: :user_id }

  has_many :contacts, dependent: :destroy

  belongs_to :user

  filter_by :name, (lambda do |name|
    where('name LIKE ?', "%#{name}%")
  end)
end
