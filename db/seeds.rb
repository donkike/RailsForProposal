# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

sections = %w[Jurídica Contractual Financiera Técnica]

sections.each do |section|
  Section.find_or_create_by_name(section)
end

User.create(:username => "admin", :email => "admin@admin.com", :password => "admin", :password_confirmation => "admin", :admin => true)