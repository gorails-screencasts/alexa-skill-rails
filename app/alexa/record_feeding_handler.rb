class RecordFeedingHandler < ApplicationHandler
  def call
    user.events.create(kind: :feeding)
    ssml speak("Feeding recorded.")
  end
end
