---
layout: post
title:  "JavaScript Protocol Buffers"
date:   2013-08-19 15:13
categories: updates code
---

I have noticed a distinct lack of JavaScript libraries that easily decode and
encode messages based on [Google's Protocol Buffers][protobuf]. I find this a
little odd, but not greatly so; even if JavaScript applications were using
protocol buffers to send and receive messages it is more likely to be within a
node.js application than a browser script. Since I'm attempting to use protocol
buffers over web sockets for my browser-based game client I decided to embark on
a side-quest momentarily. To that end I've created a JavaScript library that can
run from the browser to both encode and decode messages: I call it
[jsbuf][jsbuf].

## Finding a Solution

I did notice a few solutions to this problem, but they were either incomplete,
[outdated][protojs], or [incompatible][protonode] with the solution I needed. I
needed something that was pure JavaScript and could run in any browser. To that
end I had to [make my own][jsbuf] solution. It was influenced heavily by
[eprotoc][eprotoc], which makes encoding and decoding protobuf messages look
ridiculously simple. I'm going to chalk it up to equal parts well-written code
and great programming language choice.

My current solution works with strings, as there is no native binary data type
or byte stream available to JavaScript. Using `String.fromCharCode` allows you
to "pack" a byte of data into a string. It is also possible to read a single
byte of data from a string using `"".charCodeAt`. In JavaScript, a string's
length is equal to the number of bytes it stores, so a length of 3 means you
have a data stream containing 3 bytes. It's not pretty, but it works.

Right now the project is at a point where you can both encode and decode simple
messages: fields with numbers and strings. No repeated fields or embedded
messages yet, but those missing components will make it in eventually.

## Measuring Performance

I have no idea how to accurately measure performance in a JavaScript
application. I'll need to look that up. I've heard working with strings in this
way, though, is not efficient and takes a significant amount of processing time,
so I may end up trashing the protobuf solution and just go for either
[BERT][bert] or JSON messages. I'm personally hoping the performance isn't
significantly less than BERT or JSON handling, but even if it is this project
will at least have taught me a few new things. And at the end of the day, it's
about learning new things and loving what you do, right?

## Contribute

Want to contribute to my project? Please, [feel free][jsbuf].

[protobuf]: https://developers.google.com/protocol-buffers/
[jsbuf]: https://github.com/kolorahl/jsbuf
[protojs]: https://code.google.com/p/protobuf-js/
[protonode]: https://code.google.com/p/protobuf-for-node/
[eprotoc]: https://github.com/jeremyong/eprotoc
[bert]: http://bert-rpc.org/
