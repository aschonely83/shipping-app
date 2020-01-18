class Retailer < ActiveRecord::Base
  validates_presence_of :name, :boxes
  belongs_to :users
end