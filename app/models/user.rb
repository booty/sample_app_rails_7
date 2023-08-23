# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#  index_users_on_name   (name) UNIQUE
#
class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save { email.downcase! }

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
