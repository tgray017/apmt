# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
STATUSES = [
  {:name => "Inputs", :description => "Tickets in this status need additional information in order to be executed."},
  {:name => "Inputs Complete", :description => "Tickets in this status are ready to be picked up."},
  {:name => "Execution", :description => "Tickets in this status are currently being executed."},
  {:name => "Ready for QA", :description => "Tickets in this status are ready for another participant to QA."},
  {:name => "In QA", :description => "Tickets in this status are currently being QA'd."},
  {:name => "Deploy", :description => "Tickets in this status are ready to be deployed."},
  {:name => "Complete", :description => "Tickets in this status are complete."}
]

STATUSES.each do |s|
  Status.create(:name => s[:name], :description => s[:description])
end

tom = User.create(:name => "Tom", :email => "tgray017@gmail.com", :password => "password", :is_admin => true)
victoria = User.create(:name => "Victoria", :email => "victoria@ilovewilson.com", :password => "password")
wilson = User.create(:name => "Wilson", :email => "wilson@iamawesome.com", :password => "password")
ticket = Ticket.new(:title => "Tom's Ticket to Assign to Victoria", :due_date => "2019-10-15", :description => "Lorem ipsum dolor amet fam swag echo park brooklyn cronut raclette. Ugh kale chips jean shorts, try-hard whatever sriracha ennui viral echo park mustache. Food truck tousled trust fund beard seitan hashtag kombucha asymmetrical cold-pressed tacos semiotics single-origin coffee fanny pack austin. You probably haven't heard of them portland banjo, cliche poke tacos shaman.

Tousled flexitarian kickstarter kombucha chicharrones, sriracha fingerstache tacos slow-carb adaptogen vaporware direct trade brooklyn chartreuse. Craft beer tbh chambray, kombucha 90's affogato selvage jianbing. Shabby chic freegan adaptogen mustache truffaut man braid dreamcatcher taxidermy swag try-hard bushwick raw denim lo-fi readymade. Authentic wayfarers fixie, microdosing literally banjo flannel. Godard tote bag kitsch 3 wolf moon aesthetic, street art iceland. Tofu glossier la croix flannel.")
ticket.creator = tom
ticket.assignee = victoria
ticket.status = Status.find_by(:name => "Inputs")
comment = Comment.new(:content => "I'm a dog!")
comment.ticket = ticket
comment.user = wilson
comment.save
reply = Reply.new(:content => "I know!")
reply.user = victoria
reply.comment = comment
reply.save
r = Reply.new(:content => "Get back to work you two!")
r.user = tom
r.comment = comment
r.save
