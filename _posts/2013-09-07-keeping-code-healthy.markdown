---
layout: post
title: Keeping Code Healthy
date: 2013-09-07 10:08:00 -0700
categories: updates code
uid: 431914080
permalink: /posts/431914080
---

I've noticed that few people understand how to keep code, and their application,
in a healthy state. Especially true with start-ups, who generally have one or two
engineers come in and start coding with a fervor that almost always leads to a
metric shitton of mistakes; missing or inadequate testing, poor code
organization, non-existent or incorrect documentation, repeated code segments,
and more. Usually this is because junior developers and management-types of all
levels have a steadfast belief that if you aren't developing new code your
product isn't growing and you aren't going to be making money. While it is true
that you need to make something and provide updates to keep your application
relevant and useful, there's a simple way to also keep your code healthy while
doing so. And that method is what I like to call the __3-1 Development Cycle__.

## The Concept

I'm hoping everyone can agree that bad code eventually needs to be fixed. But
the longer you leave bad code alone the more time there is for new bad code to
enter the project, and the more dependencies you create to existing bad
code. Just like with bugs, the longer they stay in the code the more expensive
they become to fix later on &mdash; exponentially so. But as I conceded earlier,
we do need to develop new features and respond to user feedback and market
changes. So what are we to do? There are opinions on this but I'm only going to
talk about one, mine: the __3-1 Development Cycle__.

The idea is to do __3 months of development__ and __1 month of fixing__, rinse
and repeat. Most people expect modern-day development tasks to be done on the
order of weeks, not months, so devoting 3 months to continuous new feature
development is generous. And for those that feel taking 25% of each year out to
fix problems is too much, that would tell me two things about you: (1) you don't
understand or care how significant it is to keep code clean, up-to-date,
well-tested, and efficient. Or (2) you're looking at it as though all 3 months
of fixing stuff are done at once, which it's not. Doing it in small doses often
throughout the year is what makes it effective; doing fixes in large batches is
never efficient.

## Good Versioning Support

I like that this development cycle has the potential to support versioning
well. What do I mean by this? I mean the company can enter to a fairly standard
release cycle. Consider the following:

- Month 1: Patch version changes.
- Month 2: Minor version change and more patch version changes.
- Month 3: Minor version change and more patch version changes.
- Month 4 (Fix-it Month): Major version change.

To me this release schedule makes sense, because major versions are the only
time you should be removing deprecated features, and taking time to remove those
deprecated features and ensure everything still works would, in my opinion,
definitely fall within the "fix-it" month. Plus I would generally reserve large
underlying changes to a system for major version changes. In fact, if you want
to see an excellent write-up on versioning and how to do it well,
[read this][semver]. It's called Semantic Versioning and it's written by the
same guy that helped make GitHub.

## Factoring in Refactoring

Developers may be wondering about large-scale refactoring projects. I would say
that if the refactoring effort is sufficiently large, it is no longer a "fix-it"
type of task and deserves to be in the 3-month development part of the cycle
instead. The idea behind the 1-month period is for ensuring clean, modular, and
efficient code _from the past 3 months of development_. In this way we should
have confidence that when we enter a new 3-month development period all the code
we have to work with is "pristine", or at least very well-written and
integrated. In fact, if a 3-month period is devoted to refactoring, the whole
process should be much less painful than usual because the underlying code base
should be in such good shape, assuming the developers are spending those fix-it
months well.

## Variations

I would say that for very rapid development teams, it may also be worth
considering a 1.5-0.5 cycle, where you take one and a half months for new
development and a half-month for fixes and cleanup. I'm not sure how effective
this would actually be, but if the team is dealing with Minimal Marketable
Features and can accomplish a significant number of tasks within the 1.5 months,
it may be worth pausing for a half-month to go back and ensure the code is
clean, modular, and efficient. I would say that the more tasks that are being
completed, the more often you'll need to break for a fix-it period.

[semver]: http://semver.org/
