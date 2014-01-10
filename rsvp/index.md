---
layout: default
title: rsvp
---

<div class="page-header">
  <h1>Ruby Schema Validation Project</h1>
</div>

I haven't found any schema validation gems for Ruby that I'm pleased with, so I
decided to simply create my own. One of the things I actually didn't like about
the existing tools was that they were either meant for particular source input
_strings_, like JSON or YAML strings, or they had an odd schema syntax.

What I am trying to do is create a tool that uses Ruby hashes, and other
built-in data types, as the source for validation. This means that any input you
can convert to a `Hash` can be validated using this project. The schema "nodes"
are essentially just tuples containing a Ruby data type (like `Hash` or `Array`
or `Integer`) and a set of additional rules (like `greater than zero` or `not
empty`).

See more at the [GitHub repo][repo].

[repo]: https://github.com/kolorahl/rsvp
