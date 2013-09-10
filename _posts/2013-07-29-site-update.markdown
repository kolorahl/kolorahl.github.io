---
layout: post
title:  "Site Update"
date:   2013-07-29 15:52:00
categories: updates
uid: 428453520
---

You may notice the site looks different. Well, that's not the result of
dangerous cosmic rays doing weird things to your perception of reality: the site
has indeed been updated and looks considerably different. The main reason behind
this is the update to [Bootstrap v3.0.0-RC1][bootstrap]. Other changes include:

## New Header Styles

See that sweet header style above this text? I decided it was a bit difficult,
inside of the post content, to quickly see where an idea changes just by looking
for new headers. These new styles only affect `h1` through `h4` right now, but
those are the only "bold" headers that really require unique looks.

## New Font

I changed the default font to Arial. It's easier to read and widely
supported by most browsers/operating systems. While the previous font was nice
for a select audience, it was not necessarily for the general public. Plus
it relied on Google Fonts API, which meant it needed to load JavaScript to
work. Removing it reduces load times, by a not-insignificant-amount on mobile
devices especially, so that's awesome. And people with script blockers would
never see it anyway, so my personal testing would be skewed toward a possible
minority.

## Bootstrap Update

[Twitter Bootstrap][bootstrap] recently came out with a major update. They made
it "browser-first" meaning that everything is responsive by default now, and
that a lot of fat was trimmed to give a cleaner and simpler framework to create
web pages with. This should mean better load times and nicer-looking pages. I
personally like it, as I am one for beauty in simplicity. I don't need a bunch
of fancy colors, drop-shadows, lines, italics, and whatever else the kids think
are cool these days. I believe the new bootstrap is trying to move toward a
mantra I've recently started using: Easy to use, eays to consume. This means a
framework or API that is easy to use for developers and generates content that
is easy to consume for users.

## Using LESS For Custom CSS

The bootstrap and other projects seem to enjoy using LESS to generate their
stylesheets. I decided to give it a try, and I can definitely see why people
would prefer this over raw CSS coding. The built-in functions are simply
amazing, and the very simple ability to nest elements is incredible all by
itself. I'm using [Grunt][gruntjs] for node.js to run [Recess][recess] and turn
my `*.less` files into minified CSS files. It's eays to get started with Recess,
and using the bootstrap Gruntfile made it easy for me to quickly get Grunt set
up for my own personal use.

So I hope you enjoy the new site. If you don't for any reason,
[email me][emailme] and let me know what your problems, concerns, or questions
are. Of course, you can also email me to tell me you like what's going on and to
throw out some advice if you'd like. I can't guarantee I'll respond, but I'll
try to emails that aren't garbage. Something like, "Your website sucks, I hate
it" won't earn a response. But something like, "I don't enjoy your website
because navigating your posts is not intuitive and I think XYZ would improve it"
will almost definitely get a response.

[bootstrap]: http://getbootstrap.com/
[gruntjs]: http://gruntjs.com/
[recess]: https://github.com/twitter/recess
[emailme]: mailto:kolorahl@gmail.com?subject=Style
