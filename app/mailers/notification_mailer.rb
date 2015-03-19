class NotificationMailer < ApplicationMailer

    def comment_added
      mail(to: "jeremycar@yahoo.com",
           subject: "A comment was added to your place.")
    end

end
