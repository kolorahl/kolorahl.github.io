---
layout: post
title: Up and Running
date: 2013-07-10 09:04:17 -0700
categories: updates
uid: 426812657
permalink: /posts/426812657
---

I've finally switched over to using GitHub Pages for my personal blog. I've even
got a domain for myself, which I was delightfully surprised to find wasn't being
held by anyone else. So if you go to [http://kolorahl.com][home] you will be
redirected to my GitHub site.

To kick off this first post, a quick announcement: I'm starting work on a small
browser-based game. The future may hold native mobile apps as well, but for
right now I'm focusing on HTML 5 targeting a desktop browser. Although I don't
want to get into the game details yet, I figured I'd post the technology I'm
looking at using. Although I am trying to pick technology that definitely works
for what I want to build, some of the tech choice also comes down to what new
things I want to learn right now.

### Erlang (Server)

[Erlang][erlang] was selected because it's a fascinating functional language
specifically designed for concurrent, distributed applications. Although this
game won't be highly concurrent, at least in the initial version, I do plan on
being able to easily scale my servers with demand. The inherent distributed
functionality in the language makes it easy to spread data, called _Actors_ in
Erlang, across a network and have them talk without implementing custom
code. Considering how popular "distributed" programming is becoming, I'm
surprised that a mature and stable language like Erlang isn't considered more
frequently for new projects.

### Riak (Database)

It was between MySQL, Redis, or Riak and the leading choice is
[Riak][riak]. Although I love all three of them, I haven't used Riak
significantly and I'm hoping to get to know it better. Also, Riak is designed to
be a "fast" solution with a focus on availability and eventual
consistency. Erlang will persist Actor state data in-memory throughout the
lifetime of the Actor, and these Actors can natively talk to each other over a
network because of the distributed functionality found in the core Erlang
language. Why is this important? It means that I don't need to read from the
database very often, but when I do need to read from it I want high availability
so that my users aren't waiting long to get into the action.

To illustrate this a bit better, the database interaction will look like:

1. User login: READ from database.
2. User performs any action that modifies their state: WRITE to database.
3. User performs interaction with another user: Erlang Actors talk to each other
   via [message passing][erl-mp]. If state data was modified: WRITE to database.
4. User disconnects for any reason: WRITE to database.

So we see that because Erlang Actors can directly communicate over a network, we
don't need to reload user data on a different server to get at its
information. This allows us to only require one READ operation: when a user
first "enters" the application. This means the "eventual" part of "eventual
consistency" isn't a big issue for this application. Basho, the makers of Riak,
have a great [video](http://basho.com/how-eventual-is-eventual-consistency/) on
eventual consistency if anyone is interested in what it is, what it means for a
user, and how to properly consider the impact of it in your application.

### HTML 5 Canvas (Client)

Originally I was planning on trying out [Elm][elm] for this project, but then
decided against it because it is (a) a little confusing to learn and (b) still
very new and in development. Once it matures a bit more I'd love to revisit the
language and take it for a proper test drive. For now, I'll just be using
JavaScript and the HTML 5 Canvas tag to draw simple 2D graphics and capture user
interaction within it.

### Web sockets (Client-Server)

Choosing the browser gave me really only two choices for client-server
communication: polling or web sockets. Since actions can, and will, impact a user
without them interacting with the game it is important that the client can be
kept up-to-date by the server. Web sockets seem to be maturing well and, aside
from simply wanting to try it out, I wanted to avoid request polling if
possible. Not saying that request polling is bad for a game (it is bad, don't do
it), but it's just not an optimal use of client or server resources; web sockets
seem to be the more optimal solution for the browser right now. I'm also hoping
that, should I build native mobile apps down the road, that I can change little
on the server to accommodate native socket implementations on mobile clients.

Well, that's all the news for now. I'm pretty excited for this project and
hopefully will get to a point where I can reveal more details soon.

[home]: http://kolorahl.com
[erlang]: http://learnyousomeerlang.com/
[erl-mp]: http://www.erlang.org/doc/getting_started/conc_prog.html
[riak]: http://basho.com/riak/
[elm]: http://elm-lang.org
