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

- `URL` - the URL to GET
- `PATTERN` - the pattern to check for
- `INSECURE` - skip certificate check, `1` or `0` (default: `0`)
- `INTERVAL` - the interval the check is done in (default: `5m`, see `man sleep` for possible values)
- `MAX_RETRY` - check must fail `MAX_RETRY` times before a notification is send (default: `2`)

----------

- `TOKEN` - the pushover api token
- `USER` - the pushover user token
- `TITLE` - the title of the notification
- `MESSAGE` - the message of the notification
- `PRIO` - the priority of the notification (default: `1`)
  - `RETRY` - retry time of the notification (default: `0`)
  - `EXPIRE` - - expire time of the notification (default: `0`)

see https://pushover.net/api for more informataion

