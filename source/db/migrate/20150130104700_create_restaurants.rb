require_relative '../../config/application'

class CreateRestaurants < ActiveRecord::Migration
	def change
		create_table   :restaurants, { id: false} do |t|
			t.primary_key  :id #, :null => false
			t.string   :name
			t.string   :address
			t.string   :city
			t.string   :state
			t.integer  :postal_code
			t.string   :phone_number

			t.timestamps
		end

		add_index :restaurants, :id, :unique => true
	end
end
