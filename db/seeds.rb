# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Ticket.delete_all
TicketStatus.delete_all
Comment.delete_all
TicketStatus.create(:name => "Waiting for Staff Response", :is_default => true)
TicketStatus.create(:name => "Waiting for Customer")
TicketStatus.create(:name => "On Hold", :is_on_hold => true)
TicketStatus.create(:name => "Cancelled", :is_closed => true)
TicketStatus.create(:name => "Completed", :is_closed => true)

