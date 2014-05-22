require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new
scheduler.every("12h") do
   Pet.timed_destroy
end
