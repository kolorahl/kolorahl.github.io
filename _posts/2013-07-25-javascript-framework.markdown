---
layout: post
title:  "JavaScript Framework"
date:   2013-07-25 00:47:00
categories: code frameworks
uid: 428053620
---

So I said I was going to use HTML 5, JavaScript, and Web socket for my client
tech stack. The only part I forgot to investigate was a JavaScript framework
that I could use to quickly and easily craft the client experience. Writing
"massive" JavaScript files by hand using only jQuery and one or two other small
libraries is not an effective way to do this. I mentioned [Elm][elm-lang]
previously, saying that once it matured a bit more I would try it out in
earnest. Well, I essentially want something as close to this as possible,
something where I don't have to write and rewrite tons of raw HTML, JavaScript,
and CSS from scratch.

Looking around the wonderful Internet I found two big ones that popped out at
me: [Angular.js][ngjs] and [Backbone.js][bbjs]. Both seem to use the MVC,
Model-View-Controller, pattern: you create templates that are your views, define
objects and collections that are your models, and methods for interacting with
the server that are to help craft your controllers. Aside from the sheer size of
the two solutions, with Angular.js being larger as a whole than Backbone.js,
there are two major concerns I'm taking into consideration for my comparison:

## RESTful JSON Communication

Both frameworks use RESTful calls to send and receive JSON payloads when
communicating with the server. I definitely want to use web sockets, so if either
framework has easy support for it or existing third-party solutions I will look
more favorably upon that framework. So far this looks to be Backbone.js: I can
overwrite the `Backbone.sync` function to use Web Socket communication since all
server calls funnel through that one method. Angular.js does not seem to be as
intuitively obvious or as easy to digest as its competitor.

## jQuery vs Templates

The main draw of Angular.js is the template system which exposes a very rich
system for creating views tied to models. Backbone.js views are simply objects
with a `render` function that is called when the view needs to be updated. I'm
not thrilled about this, as it pretty much means just using jQuery to grab DOM
elements and mess around with them at a low level versus the very nice and clean
template system used by Angular.js.

## Reactive Programming

Angular.js has data-binding, which they describe as "an automatic way of
updating the view whenever the model changes." This means that I may not need to
hook into the default method of client-server communication that Angular.js
uses, as I could simply create models and update them inside custom JavaScript
code. Then I would continue to get the benefits of the view and model
system. However, Backbone.js mentions that "whenever a UI action causes an
attribute of a model to change" it will fire an event such that all views using
that model data will be notified and rendered with the changes. I don't know if
this means only UI actions or if it means any action that changes the model
data; if it's the latter then it's pretty much the same thing as what Angular.js
is talking about.

## Postponing Testing

Until I can try out these frameworks and decide which I'm going to move forward
with I have to put the JavaScript testing stuff on hold. I will say, though,
that I've seen a number of other JavaScript projects using QUnit or Mocha, so
those will be the first ones I try out.

[elm-lang]: http://elm-lang.org
[ngjs]: http://angularjs.org
[bbjs]: http://backbonejs.org
