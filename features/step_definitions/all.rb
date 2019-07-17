require 'json'

Given("an address to a Slack-updating API") do
  @url = "http://api/v1/status"
end

When("I give it a status") do
  post @url, {
    :secret_token => "test_token",
    :slack_email_address => "dev@null.io",
    :slack_workspace => "Test Workspace",
    :new_status => "This is a test status."
  }.to_json
end

Then("it updates my status") do
  last_response.status.should eq(200)
  last_response.body.should eq({
    :old_status => "My old status",
    :new_status => "This is a test status.",
    :workspace_affected => "Test Workspace"
  }.to_json)
end

