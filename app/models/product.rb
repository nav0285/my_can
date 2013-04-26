class Product < ActiveRecord::Base

  belongs_to :user

  attr_accessible :title, :description, :price, :user_id

  validates_presence_of :title, :description, :price

  validates_uniqueness_of :title

  validates_length_of :title, :in=>4..10

  validates_length_of :description, :minimum=>10

  validates_numericality_of :price
end
