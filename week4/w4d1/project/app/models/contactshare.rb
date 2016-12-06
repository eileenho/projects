class ContactShare < ActiveRecord::Base
  validates :contact, :user, presence: true
  validtes :contact_id, uniqueness: { scope: :user_id }

  belongs_to :user
  belongs_to :contact
end
