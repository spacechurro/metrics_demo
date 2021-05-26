# Slides
https://docs.google.com/presentation/d/1ly9Dd9OjfrAYVPftFa0qZWe8EmU6t2YOj13hZa7KbuA/edit?usp=sharing

# Demo app
https://metrics-demo.herokuapp.com

# New Relic graphs
## Login Funnel
https://chart-embed.service.newrelic.com/herald/83f0403d-e53e-4693-a999-efc8135ce657?height=400px&timepicker=true
```
from Transaction SELECT funnel(device_id, where name = 'Controller/sessions/create' as 'Password Attempts',where name = 'Controller/two_factor_auths/create' as '2FA Attempts',where name = 'Controller/accounts/index' as 'Successful Logins' )
```

## Authentication Validation Errors
https://chart-embed.service.newrelic.com/herald/68462b11-9a6e-4777-8006-d33f120adb6a?height=400px&timepicker=true
```
SELECT count(*) FROM AuthenticateUser TIMESERIES FACET `status` SINCE 1 day ago EXTRAPOLATE
```

## Recent Login Attempts
https://chart-embed.service.newrelic.com/herald/39e4d537-11be-4a24-b4f2-523a28bd0aa8?height=400px&timepicker=true
```
SELECT timestamp, device_id, request_id, remote_ip, status from AuthenticateUser since 1 day ago
```
