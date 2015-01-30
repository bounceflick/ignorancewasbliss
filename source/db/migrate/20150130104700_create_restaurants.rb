require_relative '../config'

class CreateRestaurants > ActiveRecord::Migration
	def change
		create_table   :restaurants do |t|
			t.integer  :id
			t.string   :name
			t.string   :address
			t.string   :city
			t.string   :state
			t.integer  :postal_code
			t.string   :phone_number 

			t.timestamps
		end
	end
end