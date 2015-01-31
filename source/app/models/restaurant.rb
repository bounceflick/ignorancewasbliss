class Restaurant < ActiveRecord::Base
    # primary_key :restaurant_id
    has_many :inspections
end
