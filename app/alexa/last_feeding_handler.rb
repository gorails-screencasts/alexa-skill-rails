class LastFeedingHandler < ApplicationHandler
  def call
    event = user.events.where(kind: :feeding).order(created_at: :asc).last
    message = if event
                speak("Last feeding was #{time_ago_in_words(event.created_at)} ago.")
              else
                speak("No feedings have been recorded.")
              end
    ssml(message)
  end
end
