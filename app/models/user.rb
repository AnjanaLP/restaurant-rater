class User < ApplicationRecord
  VALID_EMAIL_REGEX = URI::MailTo::EMAIL_REGEXP

  before_save { email.downcase! }

  validates :name,  presence: true, length: { maximum: 40 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

 # rails g migration add_email_index_to_users
 #
 # def change
 #   add_column :users, :email_index, unique: true
 # end
end
