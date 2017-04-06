# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron 语法帮助

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
#更新任务 whenever --update-crontab
# Learn more: http://github.com/javan/whenever

#set :environment, :development
set :chronic_options, :hours24 => true
#5个*分别代表分、时、天、月、星期  下面是每个月的1号12点执行发邮件任务
every '0 12 1 * *' do
  runner 'UserMailer.tell_me_service_info.deliver_now'
end

every '30 14 * * *' do
  runner 'UserMailer.fund_notification_msg.deliver_now'
end