# chkrl

does a simple, case insensitive grep on a website and notifies
via [pushover](https://pushover.net) if the pattern is not found

## installation

```bash
> docker pull rverst/chkrl:latest
> docker run --rm \
         -e URL="https://example.org" \
         -e PATTERN="example" \
         -e TOKEN="<pushover_api_token>" \
         -e USER="<pushover_user_token>" \
         rverst/chkrl:latest
```

## variables

### URL

the URL to GET

### PATTERN

the pattern to check for

### INSECURE (default: `0`)

skip certificate check, `1` or `0`

### INTERVAL (default: `5m`)

the interval the check is done in

### MAX_RETRY (default: `2`)

check must fail `MAX_RETRY` times bevore a notification is send

### TOKEN

the pushover api token

### USER

the pushover user token

### TITLE

the title of the notification

### MESSAGE

the message of the notification

### PRIO (default: `1`)

the priority of the notification

#### RETRY (default: `0`)

retry time of the notification

#### EXPIRE (default: `0`)

expire time of the notification

see https://pushover.net/api#priority for more informataion

