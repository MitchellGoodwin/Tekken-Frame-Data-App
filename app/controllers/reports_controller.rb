class ReportsController < ApplicationController
    
    def new
        @report = Report.new
    end

    def create
        @report = Report.new(params.require(:report).permit(:notes))
        @report.post = Post.find(params[:post_id])
        @report.save
        flash[:success] = "USER REPORTED!"
        flash[:post_id] = @report.post.id
        ReportMailer.with(report: @report).new_report_email.deliver_later
        redirect_to forum_path(@report.post.forum)
    end

    def destroy
        @report = Report.find(params[:id])
        @report.delete
        redirect_to user_path(current_user)
    end

    def approve
        @report = Report.find(params[:format])
        @report.post.user.destroy
        @report.destroy
        redirect_to user_path(current_user)
    end
end
