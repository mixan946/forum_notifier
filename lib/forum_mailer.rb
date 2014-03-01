class ForumMailer < Mailer

  def message_posted_for_users(message, notify_info)
    redmine_headers 'Project' => message.project.identifier,
                    'Topic-Id' => (message.parent_id || message.id)
    @author = message.author
    message_id message
    references message.root
    recipients = message.recipients

    if notify_info
      recipients |= User.where(:id => notify_info[:users]).pluck(:mail)
    end
    
    cc = ((message.root.watcher_recipients + message.board.watcher_recipients).uniq - recipients)
    @message = message
    @message_url = url_for(message.event_url)
    mail :to => recipients,
      :cc => cc,
      :subject => "[#{message.board.project.name} - #{message.board.name} - msg#{message.root.id}] #{message.subject}" do |format|
        format.html{render "mailer/message_posted"}
      end
  end

end
