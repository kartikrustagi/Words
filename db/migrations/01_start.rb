require 'sequel'

Sequel.migration do
	change do
		create_table(:words) do
			Integer :id, :primary_key => true, :null => false
			DateTime :added_at
			Integer :next
			Integer :prev
			String :word, :null => false
			String :definition
			String :example
		end
	end
end
