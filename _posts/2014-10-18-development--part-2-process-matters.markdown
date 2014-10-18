---
layout: post
uid: 466974836
title: "Development - Part 2: Process Matters"
date: 2014-10-18 12:13:56 -0700
permalink: /posts/466974836
---

Many companies claim to be "lean" or "agile", when they are really anything
but. Part of the problem is that they hear buzz words but don't understand what
they mean or where they originated from. Many seem to have bought books on these
"new age" development practices and processes, but then only read the chapter
titles and none of the actual content. One of the most important parts of
development that people tend to get wrong as a start-up: no formal process. As a
larger company: overly strict processes. So where is the happy medium?

## The Agile Manifesto

If you haven't read it, the [Agile Manifesto](http://agilemanifesto.org/) is
specifically for software development and is probably nothing like what you
think if all your agile development knowledge comes from blog sites, books, and
second-hand conversations. I'm going to copy/paste the core manifesto here:

> We are uncovering better ways of developing
> software by doing it and helping others do it.
> Through this work we have come to value:
>
> Individuals and interactions over processes and tools
>
> Working software over comprehensive documentation
>
> Customer collaboration over contract negotiation
>
> Responding to change over following a plan

The first line of values - "individuals and interactions over processes and
tools" - is what I'm focusing on in this post. Many people seem to think this
line actually reads "have individuals interact with each other and don't worry
about processes or tools". Not only does the manifesto **not** say that, there
is this amazing sentence at the end of the manifesto that everyone seems to
ignore:

> That is, while there is value in the items on
> the right, we value the items on the left more.

"There is value in the items on the right". That's a powerful statement. It
means that processes and tools have value, and therefore should not be
forgotten. What the manifesto tries to say is "don't let processes and tools
take precedence over individuals and interactions".

## Processes Are Necessary

Many people believe they know how to get work done. And maybe they do. The
problem is, what happens when that person has to interface with others to get
work done? What if they are passing work between other teams? Between different
people on the same team? And since the agile manifesto was specifically
targeting software development, why do we try to apply it to every other facet
of development?

In the end, you need a process, even in an agile environment. It can be simple,
as long as it is a formally recognized process and everyone it applies to
adheres to it. For example, maybe the programmers need to have a 30-minute code
review before merging new code into an existing branch. Or maybe you want one
deploy, at most, of your product every week; pick a day that isn't Friday. These
are simple processes, but they need to be formal ones and people need to be held
responsible when they don't follow them. If a PM comes in and says, "we need to
deploy XYZ" at 20:00 on a Friday night, the deploy better include a fix to a
critical bug that is on production, otherwise someone needs to remind them of
the process and calmly tell them to GTFO.

## Processes Should Be Fluid

"But Tyler," I can here people saying. "We don't like those processes! They slow
us down and we work better without them!" That's perfectly acceptable. The agile
manifesto is essentially telling us that if a process or tool inhibits our
ability to interact or complete our work, we need to favor individuals and
interactions over the established process or tool. But instead of just tossing
out a process, modify or replace it. Don't just get rid of it and think flying
by the seat of your pants will get things done on time and to whatever level of
quality you are hoping to achieve - unless that level of quality is "crap",
because without processes you can easily hit that target. Processes should be
fluid in the sense that you can change them quickly and easily when necessary.

Great example: git development branching. Git can be difficult to work with if
you haven't before, and even people with years of experience probably aren't
using the tool in the most effective manner. Because of this, people tend to
just commit code and push it up. For teams of one or two developers this mostly
works. Once you hit three it becomes far easier to have bugs and merge errors
crop up if everyone is doing their own thing without a formal process. You will
most definitely spend more time and effort fixing small mistakes than pushing
out new code if you do not formalize your git development flow. Thankfully there
are some
[great branching models](http://nvie.com/posts/a-successful-git-branching-model/)
readily available on the Internet which people can read up on and
implement. But most models are extremely formal and contain many potentially
unnecessary parts, depending on team size and the scope of a project. So keep it
fluid: you should definitely cut out parts you don't like or need and modify the
model of your choice to suit your team's needs.
