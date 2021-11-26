class InterviewMailer < ApplicationMailer
  def interview_email
    @interview = params[:interview]
    mail(to: "#{@interview.candidate.email}, #{@interview.recruiter.email}", subject: 'Interview confirmed')
  end
end
