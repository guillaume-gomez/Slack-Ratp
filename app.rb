require 'dotenv/load'
require 'sinatra'

require 'httparty'

require_relative 'app/slack_authorizer'
require_relative 'helpers/converter'

use SlackAuthorizer

class HerokuSlack < Sinatra::Base

  post '/slack/command' do
    content = convert_text_to_train_line(params["text"])
    response_url = params["response_url"]
    username = params["user_name"]
    return if content.empty?
    options  = {
      body: {
        "response_type": "in_channel",
        "text": content,
        "username": username,
      }.to_json,
      headers: { 'Content-Type' => 'application/json' }
    }
    HTTParty.post(response_url, options)
    ""
  end

end