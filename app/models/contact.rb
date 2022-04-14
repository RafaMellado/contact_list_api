# == Schema Information
#
# Table name: contacts
#
#  id              :bigint           not null, primary key
#  email           :string
#  givenname       :string
#  phone           :string
#  surname         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  contact_book_id :bigint           not null
#
# Indexes
#
#  index_contacts_on_contact_book_id  (contact_book_id)
#
class Contact < ApplicationRecord
  validates :givenname, length: { minimum: 2, maximum: 24 }
  validates :surname, length: { minimum: 2, maximum: 24 }
  validates :email, presence: true, uniqueness: { scope: :contact_book_id }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true, uniqueness: { scope: :contact_book_id }, numericality: true, length: { maximum: 12 }

  has_many :contact_histories, dependent: :destroy

  belongs_to :contact_book

  after_update :create_history, if: :saved_changes?

  filter_by :contact_book_id

  filter_by :fullname, (lambda do |value|
    where("CONCAT(givenname, ' ', surname) ILIKE ?", "%#{value}%")
  end)

  def owner_user_id
    contact_book&.user_id
  end

  private

  def create_history
    contact_histories.create(
      surname: surname_previously_was,
      givenname: givenname_previously_was,
      email: email_previously_was,
      phone: phone_previously_was
    )
  end
end
