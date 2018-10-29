require 'dotenv/load'
require 'byebug'
require 'sinatra'


use SlackAuthorizer

require 'sinatra/base'

class HerokuSlack < Sinatra::Base

  post '/slack/command' do
    content = convert_text_to_train_line(params["text"])
    return if content.empty?
    content_type :json
    {:text => content, :response_type => "in_channel"}.to_json
    content
  end

end