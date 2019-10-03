---
title: Systems and Processes that Aren’t in Code are Terrifying
published: true
date: 2019-10-03 12:47:18 UTC
tags: devops,go,Programming,Tutorial
canonical_url: https://qvault.io/2019/10/03/systems-and-processes-that-arent-in-code-are-terrifying/
image: "https://qvault.io/wp-content/uploads/2019/10/photo-1509248961158-e54f6934749c-1024x710.jpg"
---

The dreaded:

```
15 6 2 1 * /home/lane/backup.sh
```

You may recognize this as a unix cronjob, a job that is scheduled to run on a server periodically.

You may be thinking,

> “Why is that scary? We use cronjobs all the time!”

If the code that manages the crontab is source controlled and exists within the organization’s central repositories, then I actually have very little to complain about. My beef is when an engineer hops into the server and starts up a cron job without that configuration existing anywhere in code.

You may say,

> Well, the cron schedule may not exist in code, but the script/program it runs does!

**I don’t care.**

![](https://qvault.io/wp-content/uploads/2019/10/26ipc1.jpg)

I want to be able to look at the code base and know if the program is long-running, should be run manually, or if it runs on a specific schedule. If it is going to be run using crontab that’s fine, just make sure that the CI/CD config file (or something similar that is source controlled) specifies how that is triggered.

Or even better, program in Go so that spinning up side processes within your app is simpler than using the crontab ![😉](https://s.w.org/images/core/emoji/12.0.0-1/72x72/1f609.png)

## Other Angst-y Things

Crontabs are just a common example of hard to discover processes. Others may include:

- Database processes that were added manually, instead of by the app that owns the DB
- .bash\_profile or .bashrc files that kick off server startup jobs
- Third party apps that were installed on the server to take care of special tasks (I don’t know, defragging the disk maybe). Those processes should be documented in code, probably config files that your organization typically uses to start its apps.

## Thanks

Internal documentation sucks, so document your processes in code instead. A config file that specifies how a process is started is much better than a PDF, because the config file can’t become outdated (if it does, things break).

Good luck out there.

By Lane Wagner [@wagslane](https://twitter.com/wagslane)

Download Qvault: [https://qvault.io](https://qvault.io/)

Star our Github: [https://github.com/q-vault/qvault](https://github.com/q-vault/qvault)

The post [Systems and Processes that Aren’t in Code are Terrifying](https://qvault.io/2019/10/03/systems-and-processes-that-arent-in-code-are-terrifying/) appeared first on [Qvault](https://qvault.io).

