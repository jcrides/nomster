class NotificationMailer < ApplicationMailer

    def comment_added
      mail(to: "jcarey@emailbistro.com",
           subject: "A comment was added to your place.")
    end

end
