require 'dotenv/load'
require 'byebug'
require 'sinatra'

use SlackAuthorizer

require 'sinatra/base'

class HerokuSlack < Sinatra::Base

  post '/slack/command' do
    convert_text_to_train_line(params["text"])
  end

end


