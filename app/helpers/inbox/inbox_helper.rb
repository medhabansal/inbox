module Inbox
  module InboxHelper

  def show_inbox (e)
   
   e.receivers.where(:receiver_email=>current_user.email).first.is_read

  end
	

  def show_time(e)

       #helper to show date if mail older than five days
       ((Time.now - e.created_at)/5.day) > 1
  end

  def show_mess(e,length=10)

    #helper to trim message if longer than length

    if e.message.blank?
      "..."

    elsif e.message.length > length
      e.message.first(length) + "..."

    else
      e.message

    end

  end

  end
end
