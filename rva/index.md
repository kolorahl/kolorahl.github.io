---
layout: default
title: rva
---

<div class="page-header">
  <h1>Ruby View Abstractor</h1>
</div>

This is my attempt at making the Ruby (and Rails) approach to model and view
generation more pragmatic. Currently Rails uses database tables as the source
for model attributes, which I don't personally agree with. You also have to
hand-maintain related files like the model source code, `routes.rb`, and any
controllers/views that you associate with it. To me, this seems like a lot of
unnecessary work, one that breaks the DRY principle in an insidious manner: you
aren't repeating code fragments verbatim but rather following the same algorithm
with different model input, and executing this algorithm by hand most likely.

By abstracting a data schema for a project it should allow a pre-processing tool
(like this one) to create or modify the appropriate related files. This way if
you change your data, you simply run one command and everything is updated for
you. And if you need to customize your output, you can do that: `rva` aims to be
modular and customizable.

See more at the [GitHub repo][repo].

[repo]: https://github.com/kolorahl/ruby-view-abstractor
