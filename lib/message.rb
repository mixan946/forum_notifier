require_dependency 'message'
class Message < ActiveRecord::Base

  def send_notification_with_changes
    false
  end

  def send_notification_to_users(attributes)
    if Setting.notified_events.include?('message_posted')
      ForumMailer.message_posted_for_users(self, attributes).deliver
    end
  end

  alias_method_chain :send_notification, :changes
end

