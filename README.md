# Slack Status Updater

This simple API updates my Slack status when given a Slack email address and
workspace, like this:

```sh
$> curl -w '\n%{http_code}' -X POST https://slack.api.carlosnunez.me/v1/status -d '{\
  "secret_token": "sample_test_token",\
  "slack_email_address": "carlos@test.email",\
  "slack_workspace": "Workspace",\
  "new_status": "This is a test status"\
}'

{
  "old_status": "My original status.",
  "new_status": "This is a test status.",
  "workspace_affected": "Workspace"
}
200
```

# How to run this locally

1. Use Docker-Compose: `docker-compose up -d`
2. Query against `localhost`

# How to test

1. Use Docker Compose to bring up the stack: `docker-compose up -d`
2. Run tests: `docker-compose run tests`
