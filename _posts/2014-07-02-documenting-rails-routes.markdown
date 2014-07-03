---
layout: post
uid: 457667087
title: Documenting Rails Routes
date: 2014-07-02 18:44:47 -0700
permalink: /posts/457667087
---

I feel like every Rails project I work on, I encounter a recurring issue:
generating documentation for public routes that are suitable for client
developers. Usually I have to create these documents by hand, and it's usually a
real pain; tedious and boring to the extreme. So I finally said, "Why the heck
am I still doing this by hand? I should make a way to automate this." And so I
did: I introduce to you [droutes](https://github.com/kolorahl/droutes). It's
pronounced like "drought" with an "s" on the end.

This tool was written very quickly, less than a day of effort, but I think even
the initial results are pretty impressive. That is, impressive in the sense that
it does what I expect of it and generates documentation that can be easily
consumed by a client developer. Of course, the tool relies mostly on good source
code documentation, so if you aren't documenting your code, this tool won't do
much for you.

I like using YARD to generate my documentation, so I chose to use YARD as the
backbone for parsing and generating documentation blurbs. I use the Rails
Routing modules to get at the application's routes and match them to the
appropriate parsed documentation. From there I create a single web page per
controller. Each page then contains every route present in `config/routes.rb`;
if you haven't matched the controller action in your routing file, it won't show
up in the documents. I wanted it this way because client developers only need to
know about the endpoints they have access to, and server developers can use YARD
normally to generate a more full-featured set of documentation for their own
use.

So that's it, just wanted to announce the new project. This one will probably
get a little bit of love of the course of the next month or so - more if the
community likes it and starts giving me suggestions, pull requests, and bug
submissions.
