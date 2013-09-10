---
layout: post
title:  "Angular vs Backbone"
date:   2013-08-01 11:37:00
categories: code
uid: 428697420
---

Alright, I've had some time to mess around with both [Angular.js][ng-home] and
[Backbone.js][bb-home], and I have come away with pros and cons for each. For
anyone interested in my final decision, I will be using Backbone.js along with
it's one dependecy, [Underscore.js][us-home]. The final decision came down to
how they each handled data binding.

## Requirements

To reiterate from a previous post, I am building a game using Erlang on the
server and WebSockets as the means to communicate between the browser and my
Erlang code. This means I could receive updates to my data without any client
interaction happening, since WebSockets technology is a bi-directional stream
with either side able to send data when they need to. Whichever framework I
chose needed to handle server-originated updates to models, and then trigger UI
updates based on changes to the model.

## Data Binding

The main component I needed was a solid and easy-to-implement system for binding
my models to my view. If the server sends a model update then I need to be able
to (1) update the model and (2) have related UI elements update to reflect the
changes. Both Angular and Backbone had ways to bind UI elements to data, but
Angular was far more difficult to understand how to appropriately "watch" a
model for changes and have UI updates trigger automatically. For Backbone, it
was simple:

    var Foo = Backbone.Model.extend({ ... });
    window.foo = new Foo;
    _.each(["name", "email"], function(attr) {
        foo.on("change:" + attr, function(model, value) {
            $("#foo-" + attr).text(value);
        });
    });
    foo.set({name: "My Name", email: "yes@no.com"});

Here we create a `Foo` model and bind the "change" event for the attributes
"name" and "email" to a function that updates the text value of some DOM
element. Then when `foo.set` is called, the previous value is checked against
the incoming new value. If the new value is different, the value is set and the
corresponding event is triggered. So if "name" did not change but "email" did,
only an event for "change:email" would trigger. We could also go more generic
and subscribe to the "any change" event: `foo.on("change", function(model) {
... })`.

## Conclusion

While Angular seemed very easy to set up for client-interactive apps, it was
less easy to get set up for server-interactive apps. There are ways of getting
around it in Angular, but the methods available become more contrived the
further outside of the Angular logic you get. With Backbone, there is no concept
of an "app" that hides you views and models from you; everything is an object,
created and stored however you want, accessible from pretty much anywhere. Any
custom code you have to handle incoming server messages can easily be set up to
interact with your Backbone models and views, whereas in Angular there's a lot
of additional work required.

Of course, if anyone knows of an easy way to do this sort of thing from Angular,
please [let me know][ng-help]. I really do like Angular and I think their
view/template system is awesome; the way they hide a lot of boilerplate code
from the developer is great. It's just the one important thing I need to do is
not easy to get done in Angular.

[ng-home]: http://angularjs.org/
[bb-home]: http://backbonejs.org/
[us-home]: http://underscorejs.org/
[ng-help]: mailto:kolorahl@gmail.com?subject=angular.js:help
