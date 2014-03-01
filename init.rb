require 'forum_notifier_listener_hook'
require 'messages_controller_listener_hook'
require 'message'
require 'forum_mailer'

Redmine::Plugin.register :forum_notifier do
  name 'Forum Notifier plugin'
  author 'Mikhail Pospelov'
  description 'Sending forum notification'
  version '0.1.0'
end
