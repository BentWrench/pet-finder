require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new
scheduler.every("24h") do
   Pet.timed_destroy
end
