class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors.add attribute, (options[:message] || "#{value} is not an email")
    end
  end
end
class User < ApplicationRecord
  before_save {
    self.email = email.downcase
  }
  
  has_many :articles, dependent: :destroy
  validates :username, presence: true, 
            uniqueness:{ case_sensitive: false },
            length:{minimum:3,maximum:25}
  validates :email, presence: true, 
            uniqueness:{ case_sensitive: false },
            email: true,
            length:{maximum:110}
  has_secure_password
end