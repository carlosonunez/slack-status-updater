Feature: The Slack Status Updater sets statuses.

  Well, Slack is finally doing its part to deprecate Legacy API tokens in favor
  of OAuth. This means that using the API directly to do things like set statuses
  or get user information is no longer tenable without an OAuth token. Which means
  I have to write something that can do the OAuth flow. Which is annoying.

  Because I'm an engineer, I built an API that can do these things proper.

  Scenario: It updates statuses
    Given an address to a Slack-updating API
    When I give it a status
    Then it updates my status
