---
layout: post
uid: 432776256
title: Website vs Web App
date: 2013-09-17 16:37:36 -0700
categories: web
permalink: /posts/432776256
---

A quick "word of the wise" type of advice for start-ups and budding developers:
do not keep your website and you web app in the same project. Split them into
two projects, an app and a site. This will save you tons of headache in the
future, especially if you use distributed app services like [EngineYard][ey] or
[Heroku][heroku] or [AWS][aws]. First, I should explain the difference between a
_web app_ and a _website_.

## Website

A _website_ is a collection of user-facing web pages. Notice I say
"user-facing". I do not necessarily consider an employee-only administrative web
panel to be part of the website. To me, a website is a place your customers or
users can go to learn more about your company, product, or services. It's a
place with some level of user-interaction, even if that interaction is limited
to people reading news posts on your front page.

## Web App

A _web app_ is a collection of code modules that provide a service without a
front-end experience. Some people have the opinion that "web app" should mean
"it's a browser-based client talking to a server" but I like to think that
anything using web protocols on the back-end is a web app. This means that you
could have a web app with no browser client; generally this happens when someone
creates a RESTful server and connects their iPhone or Android app to it.

So, a _website_ is a collection of user-facing web pages. This may or may not
include a browser-based client. In fact, I would recommend separating the
browser client from the website. A _web app_ is a collection of code modules
that provide a service, or services, over a web protocol.

## Why Combining Them Fails

I feel like most start-ups or young web projects assume that the website
portion will be small and have limited user interaction. And that may be true
for a while. But this kind of thinking leads to a slippery slope. Imagine you
want your website to store images, audio clips, a ton of customized stylesheets,
or even a full browser-based client (not recommended). Suddenly your < 500 KB
website folder is over 5 MB (that's over 5,000 KB!) and far outweighs all of
your other source files combined.

That figure may not seem large, but it becomes a big deal when you use version
control software, like [git][git] or [subversion][svn], which any half-decent
developer should be using for projects they plan on releasing to a public
audience. You see, version control software keeps a reference to all files that
get committed to the repository. Even if you delete it in the future, a copy is
always retained in some form in the source history. This means that trying to
correct your mistake in the future only half-helps you, in the sense that your
latest code is "clean" but you still have a copy in the history that will always
be there to plague you.

I still haven't outright said why this is a failure, but I'm hoping that people
who have worked with version control software know where I am going with
this. Whenever you pull the project from the source repository, you copy over
_the entire history_. This means that if you use a distributed app service like
the ones mentioned earlier, you will likely spend time booting up and shutting
down instances, growing and shrinking your application cluster as demand grows
and shrinks. Whenever you grow your cluster you generally need to clone the
repository which means you are downloading that huge history of files even
though a majority of the files are deleted in the latest version.

By separating your website and your web app, you can ensure that your web app
only copies over the actual server application code history. A website is
generally more static in than an app, so it's unlikely you will need to grow and
shrink the website instances often, if ever. With web page caching, static-serve
asset hosts, and a variety of other utilities to speed up website performance,
it's much easier to keep to a small, strict set of instances to run your website
effectively.

## Modularity Where Possible

The essence of what I'm saying is that software isn't the only thing that should
be modular: each piece of a project, software or otherwise, should be kept as
modular as possible. The server, the website, the client apps, the static
assets... every component should be set up and stored somewhere with modularity
in mind. For example, you don't necessarily want your Rails app to be serving
static images and other assets; that's better done by a static-serve web host
like [Amazon S3][awss3]. Keeping each piece separated and modular has the added
benefit of making it easier to change technologies in the future. If you have a
code module that provides an interface for serving static files from Amazon S3
and then you change your static asset provider in the future, just change the
code module to use the other provider. The rest of your code remains the same
because the API hasn't changed, only the internal method for retrieving static
assets.

[ey]: http://www.engineyard.com/
[heroku]: http://www.heroku.com/
[aws]: http://aws.amazon.com/
[awss3]: http://aws.amazon.com/s3/
[git]: http://git-scm.com/
[svn]: http://subversion.apache.org/
