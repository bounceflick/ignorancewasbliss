require_relative '../config'

class CreateInspections > ActiveRecord::Migration
	def change
		create_table   :inspections do |t|
			t.integer  :restaurant_id
			t.integer  :score
			t.date     :inspection_date
			
			t.timestamps
		end
	end
end