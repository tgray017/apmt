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
ticket = Ticket.new(:title => "Tom's Ticket to Assign to Victoria", :due_date => "2019-10-15", :description => "Leverage agile frameworks to provide a robust synopsis for high level overviews. Iterative approaches to corporate strategy foster collaborative thinking to further the overall value proposition. Organically grow the holistic world view of disruptive innovation via workplace diversity and empowerment.\r\n

Bring to the table win-win survival strategies to ensure proactive domination. At the end of the day, going forward, a new normal that has evolved from generation X is on the runway heading towards a streamlined cloud solution. User generated content in real-time will have multiple touchpoints for offshoring.\r\n

Capitalize on low hanging fruit to identify a ballpark value added activity to beta test. Override the digital divide with additional clickthroughs from DevOps. Nanotechnology immersion along the information highway will close the loop on focusing solely on the bottom line.")
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
