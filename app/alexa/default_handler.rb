class DefaultHandler < ApplicationHandler
  def call
    ssml speak("Welcome to Baby Tracker")
  end
end
