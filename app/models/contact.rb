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
# Foreign Keys
#
#  fk_rails_...  (contact_book_id => contact_books.id)
#
class Contact < ApplicationRecord
  validates :givenname, length: { minimum: 2, maximum: 24 }
  validates :surname, length: { minimum: 2, maximum: 24 }
  validates :email, presence: true, uniqueness: { scope: :contact_book }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true, numericality: true, length: { minimum: 9, maximum: 15 }

  has_many :contact_histories, dependent: :destroy

  belongs_to :contact_book

  after_update :create_history, if: :saved_changes?

  def owner_user_id
    contact_book.user_id
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
