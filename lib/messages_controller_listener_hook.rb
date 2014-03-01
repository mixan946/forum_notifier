require_dependency 'messages_controller'
class MessagesControllerListener < Redmine::Hook::ViewListener
  def controller_messages_new_after_save(attrs)
    message = attrs[:message]
    message.send_notification_to_users(attrs[:params]["forum_notifier"])
  end
end

# call_hook(:controller_messages_new_after_save, { :params => params, :message => @message})

