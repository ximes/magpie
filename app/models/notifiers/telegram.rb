require "telegram/bot"

module Notifiers
  class Telegram
    def initialize(message)
      token = ENV["TG_TOKEN"]

      ::Telegram::Bot::Client.run(token) do |bot|
        ENV["TG_USERS"].split(",").each do |user_id|
          bot.api.send_message(chat_id: user_id, text: message)
        end
      end
    end
  end
end
