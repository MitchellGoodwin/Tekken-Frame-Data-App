class ReportMailer < ApplicationMailer
    def new_report_email
        @report = params[:report]
    
        mail(to: ENV["ADMIN_EMAIL"], subject: "NEW BAN REQUEST")
      end
end
