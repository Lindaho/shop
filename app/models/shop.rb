class Shop
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :tel, type: String

  embedded_in :user
end
