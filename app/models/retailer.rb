class Retailer < ActiveRecord::Base
  belongs_to :user
  validates :name, :boxes, presence: true 
end