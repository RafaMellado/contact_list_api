# == Schema Information
#
# Table name: contact_histories
#
#  id         :bigint           not null, primary key
#  email      :string
#  givenname  :string
#  phone      :string
#  surname    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  contact_id :bigint           not null
#
# Indexes
#
#  index_contact_histories_on_contact_id  (contact_id)
#
# Foreign Keys
#
#  fk_rails_...  (contact_id => contacts.id)
#
class ContactHistory < ApplicationRecord
  belongs_to :contact
end
