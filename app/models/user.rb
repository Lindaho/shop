class User < ApplicationRecord
  include Mongoid::Document
  include Mongoid::Timestamps
  field :first_name, type: String
  field :last_name, type: String
  field :gender, type: String
  field :age, type: Integer
  field :address, type: Hash

  embeds_one :shop

  before_validation { self.gender.downcase! }

  validates :first_name, :last_name, presence: true
  validates :gender, inclusion: { in: %w(male female other), message: "%{value} is not valid." }

  # validates :age, greater_than: 0, only_integer: true
  validate :age_validator

############################################################################
  private
  def age_validator
    unless (age > 0) && (age.is_a? Integer)
      errors[:age] << 'age must be postive integer.'
    end
  end
############################################################################	
end
