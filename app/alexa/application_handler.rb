class ApplicationHandler
  include ActionView::Helpers::DateHelper

  attr_reader :params

  def initialize(params)
    @params = params
  end

  def plain_text(message)
    {
      version: "1.0",
      sessionAttributes: {},
      response: {
        shouldEndSession: false,
        outputSpeech: {
          type: "PlainText",
          text: message
        }
      }
    }
  end

  def ssml(message)
    {
      version: "1.0",
      sessionAttributes: {},
      response: {
        shouldEndSession: false,
        outputSpeech: {
          type: "SSML",
          ssml: message
        }
      }
    }
  end

  def user
    @user ||= User.where(alexa_id: alexa_user_id).first_or_create!
  end

  def alexa_user_id
    params.dig(:session, :user, :userId)
  end

  def speak(message)
    "<speak>#{message}</speak>"
  end
end
