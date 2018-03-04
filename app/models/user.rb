class EmailValidator < ActiveModel::Validator
  def validate(record)
    domain = Rails.application.config.valid_email_domain
    unless record.email.ends_with? domain.to_s
      record.errors[:email] << "must be in the domain #{domain}."
    end
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :confirmable

  include ActiveModel::Validations
  validates_with EmailValidator

  validates :email, uniqueness: true
  validates :email, presence: true

end
