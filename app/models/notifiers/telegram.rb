require "telegram/bot"

module Notifiers
  class Telegram
    def initialize(message)
      token = ENV["TG_TOKEN"]

      ::Telegram::Bot::Client.run(token) do |bot|
        bot.api.send_message(chat_id: ENV["TG_USER"], text: message)
      end
    end
  end
end
