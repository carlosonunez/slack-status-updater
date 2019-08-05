require 'sinatra'
require 'auth'
require 'errors'
require 'slack/auth'
require 'json'

post '/update' do
  content_type :json

  api_key = params['api_key']
  api_secret_key = params['api_secret_key']
  slack_channel = params['slack_channel']

  throw_error 403, 'Please provide valid credentails' if !Auth::authenticate_user(
    api_key,
    api_secret_key
  )
  throw_error 403, 'Failed to authenticate with Slack' if !Slack::Auth.authenticate(slack_channel)
  throw_error 500, 'Failed to update Slack status.' if !Slack::Status.update(request.body)

  JSON.puts({
    :slack_channel => slack_channel,
    :old_status => Slack::Status.get_previous_status(),
    :new_status => Slack::Status.get_current_status(),
  })
end
