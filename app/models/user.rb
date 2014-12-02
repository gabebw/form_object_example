class User < ActiveRecord::Base
  has_one :company

  accepts_nested_attributes_for :company
end
