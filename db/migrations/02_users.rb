require 'sequel'

Sequel.migration do
	change do
		create_table(:users) do
			primary_key :id, :auto_increment => true
			String :username, :null => false, :unique => true
			String :password, :null => false
			DateTime :created_at
		end
	end
end
