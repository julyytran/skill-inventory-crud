require 'sequel'

environment = ['test', 'development']

environment.each do |env|
  Sequel.sqlite("db/skill_inventory_#{env}.sqlite3").create_table(:tasks) do
    primary_key :id
    String :title, :size => 50
    String :description, :size => 50
  end
end
