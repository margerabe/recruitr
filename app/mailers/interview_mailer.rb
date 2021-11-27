class InterviewMailer < ApplicationMailer
  def interview_email
    @interview = params[:interview]

    ical = Icalendar::Calendar.new
    e = Icalendar::Event.new

    e.dtstart = @interview.start_time
    e.dtend = @interview.end_time
    e.summary = "Interview meeting"

    ical.add_event(e)
    ical.publish
    
    attachments['event.ics'] = { mime_type: 'application/ics', content: ical.to_ical }
    
    mail(
      to: "#{@interview.candidate.email}, #{@interview.recruiter.email}", 
      subject: 'Interview confirmed'
    )
  end
end
