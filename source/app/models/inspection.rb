class Inspection < ActiveRecord::Base
  belongs_to :restaurant, {class_name: "Restaurant", foreign_key: "restaurant_id"}
  has_many :violations
end
