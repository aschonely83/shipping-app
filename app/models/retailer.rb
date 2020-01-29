class Retailer < ActiveRecord::Base
  belongs_to :users
  validates :name, :boxes, presence: true 
end