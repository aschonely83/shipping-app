class Retailer < ActiveRecord::Base
  belongs_to :users
  has_many :names
  has_many :boxes
 
end