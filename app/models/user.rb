# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validate :validate_email_format

  private

  def validate_email_format
    errors.add(:email, 'メールアドレスに@を含めて下さい') unless email.include?('@')
    errors.add(:email, '@に続く文字列に@を含めることはできません') if email.count('@') > 1
  end
end
