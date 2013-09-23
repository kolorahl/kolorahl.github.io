---
layout: post
title: Customize Backbone.sync
date: 2013-08-06 09:15:00 -0700
categories: code
uid: 429146100
permalink: /posts/429146100
---

So I finally started making reasonable modifications to `Backbone.sync`. For
those that didn't read my previous post on Angular.js vs Backbone.js, the major
reason I chose Backbone over Angular was because of the ease by which I could
hook my model and view updates to custom client-server communication &mdash;
specifically web sockets. I will post some snippets of my current code to show
just how easy it is to create custom client-server communication logic by
overriding `Backbone.sync`.

Right now I have a happy situation where I only ever need one instance of a
model. Things would get slightly more complicated if I needed collections of
models, but I'll save that problem for when I actually encounter it. Because
things are so straight forward, I simply create a global instance of each model
I need and have the following sync function. Note: `Stream` is a
[Bullet][bullet] object and has custom helper functions for streaming data
across the web socket.

    Backbone.sync = function(method, model, options) {
        var mname, msg, props;
        mname = Bert.atom(model.name);
        props = model.to_proplist();
        msg = Bert.tuple(Bert.atom(method), mname, props);
        return Stream.action("sync", msg);
    };

Since my server uses Erlang, I communicate with the help of [Bert][bertjs], but
you can mostly ignore those portions and just think of _atoms_ as special
strings, _tuples_ as special arrays, and _proplists_ as arrays of key-value
pairs. So here I send a "sync" action to the server using the sync method, model
name, and model attribute data as the message. Simple enough so far. On the
server side I handle sync messages as such:

    sync({Method, Model, Props}, State) ->
        Result = Model:sync(Method, Props),
        {Result, State}.

This calls the `sync` method on a module that has whatever the name of `Model`
is. So if we send the `character` atom as the model name the server will call
`character:sync` with the method name and proplist as the arguments. Don't worry
about that `State` argument; that's something my web socket handler needs. The
result should then look something like `{sync, ok, Msg}` where `Msg` is some
arbitrary data to send back to the client. I have my client code watching for
incoming messages and handling them using the `Backbone.Events` library.

    Stream.on("message:sync", function(msg) {
        // Update the model using the data in "msg"
    });

And that's pretty much it. The view has already been set up to trigger its
`render` function when the model is changed, so once the update finishes the
event triggers the view to render the new data. All this using relatively few
lines of code. I am very happy with how easy it has been to set up a custom
web socket back-end for Backbone. The [annotated source][bbannot] has been an
amazing resource in learning how to use Backbone, so much that I haven't had to
track down any additional resources to get this far. Well done Backbone, well
done.

[bullet]: https://github.com/extend/bullet
[bertjs]: https://github.com/rustyio/BERT-JS
[bbannot]: http://backbonejs.org/docs/backbone.html
