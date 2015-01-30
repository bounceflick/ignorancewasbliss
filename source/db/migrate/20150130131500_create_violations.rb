require_relative '../config'

class CreateViolations > ActiveRecord::Migration
	def change
		create_table   :violations do |t|
			t.integer  :restaurant_id
			t.date     :inspection_date
			t.string   :description
			
			t.timestamps
		end
	end
end