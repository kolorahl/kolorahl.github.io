---
layout: post
title:  "JavaScript Client Testing"
date:   2013-07-16 14:20:07
categories: code testing
uid: 427324807
---

As I mentioned in my [previous]({{page.previous.url}}) post, I'm targeting
desktop browsers for my game client. This poses an interesting problem I've not
had to think about before: how do I test client JavaScript code? I can't just
boot up my server, open up a browser, and tediously test every possible action in
my game until I'm satisfied everything works. Surely there must be solutions out
there to testing client JavaScript, right? Indeed there are; quite a number of
them, and far more than I was expecting. I've decided to investigate the
top-named ones, which as far as I can tell are the following:

- [Zombie.js](http://zombie.labnotes.org/): Claims to be a lightweight testing
  framework. Does not require a browser for testing.
- [jsdom](https://github.com/tmpvar/jsdom): What Zombie.js is built on. It's a
  JavaScript implementation of the DOM (no browser), meant primarily for node.js
  code development and testing.
- [QUnit](http://qunitjs.com/): Claims to be a powerful and easy-to-use
  JavaScript unit testing framework. Used by jQuery and their family of
  products.
- [Mocha](http://visionmedia.github.io/mocha/): Claims to be a feature-rich test
  framework running on node.js and the browser.
- [Testling](https://ci.testling.com/) (Supplemental): A continuous-integration
  (CI) tool that runs your browser tests against all browsers. Meant to be tied
  to a system like GitHub where it can track your pushes and automatically run
  tests (that's where the "continuous" part comes from). This would require
  something like _QUnit_ or _Mocha_, since _jsdom_ and _Zombie.js_ are
  browser-less and thus getting cross-browser testing wouldn't mean much. At
  least, it ideally should have no impact on them. Only JavaScript testing
  frameworks running on the browser would be able to take full advantage of
  this.

I have not yet had time to properly investigate these tools, but I will try to
find time this week. I've already got
[eunit](http://www.erlang.org/doc/apps/eunit/chapter.html) I plan on using for
server-side testing, so all I need now is to pick a good client-side testing
tool. I'll make another post once I've been able to take a look at these tools a
bit more in-depth and can weigh in on them more authoratatively. If anyone has
used any of these before, feel free to
[email](mailto:kolorahl@gmail.com?subject=JavaScript+Testing) me with your own
thoughts and opinions on them, or any outstanding alternatives you've come
across. Remember: this is for client-side JavaScript testing and **not** node.js
testing.
