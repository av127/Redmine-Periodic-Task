desc <<-END_DESC
Check for and assign periodic tasks

Example:
  rake redmine:check_periodictasks RAILS_ENV="production"
END_DESC

Rails.configuration.active_job.queue_adapter = :inline if Rails.configuration.respond_to?(:active_job)

require File.expand_path(File.dirname(__FILE__) + "/../../../../config/environment")

namespace :redmine do
    task :check_periodictasks => :environment do
      ScheduledTasksChecker.checktasks!
    end
end
