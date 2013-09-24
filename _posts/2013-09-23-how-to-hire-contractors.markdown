---
layout: post
uid: 433293067
title: How to Hire Contractors
date: 2013-09-23 16:11:07 -0700
permalink: /posts/433293067
---

This post has a specific audience of (a) employers who are (b) looking to hire
software developers. The advice here may apply beyond software development
contractors, but I can't say so for certain. If anyone knows how this parallels
for contractors in other positions, let me know via email or comment. So, let's
kick this off, shall we? First up is something that every employer should
consider very carefully: hourly rates versus flat rates.

## Hourly Rates vs Flat Rates

Most employers I've spoken to generally ask me about my hourly rate, and I tell
them all the same thing: I prefer to work flat fees, with each project or
milestone being assigned its own rate. Then they come back and tell me they'd
like to do it hourly anyway, and they end up blowing my mind because it's so
much less beneficial for an employer to do hourly contracts. Let me break it
down for everyone, list style.

### Hourly Rates

- Contractors get paid on a fixed schedule for hours worked, even if no
  deliverables are turned in.
- Since no deliverables are required, an employer is paying for the promise of
  work rather than the finished product. It's possible the contractor may not
  pan out and take your money without delivering anything.
- Because contractors are being paid by the hour rather than by milestone,
  there's no incentive to complete the work early. In fact, it is in the
  contractor's favor to draw out work longer to earn more money.

### Flat Rates

- Contractors get paid as soon as a milestone is completed and deliverables are
  received by the employer.
- Since you can now specify deliverables for a project, you can withhold payment
  until you receive said deliverables. Contractor doesn't get paid if they don't
  turn in everything asked of them.
- Because the same amount of money is paid out regardless of _when_ a job
  completes, there is an incentive to finish the job sooner. Contractors no
  longer have any reason to purposely draw out a contract.

I hope this makes it fairly obvious as to why you should choose flat
rates. However, there is a common reason I hear people say they want hourly rate
contractors as opposed to flat rate ones: they want a general services
contractor.

## Don't Do General Services Contracts

Whenever I hear someone say they are hiring a contractor for general services I
feel like a piece of me dies. A general services contract says "I don't know
_exactly_ what I need done right now, but I know I need stuff done." If you
don't have very specific projects and tasks that you need done in a timely
fashion, there's no reason to spend a bunch of money to have someone do grunt
work.

Here's a fun analogy: hiring a world-class chef at top-dollar to come and make
you a grilled cheese sandwich for lunch, have them stick around while you figure
out what you want for dinner, and then finally decide on hot dogs with
taters. Unless you're literally swimming in a pool of money because you are so
rich, there's no reason you would do that. And if you are rich enough to swim in
a pool of money, why are you reading this? Go waste your money already.

The moral of this story is that contractors are a lot more expensive than
regular, full-time employees are. In fact, looking at it annually, a contractor
is probably around twice as expensive. I've done contracts at $100 USD per hour,
which works out to over $200,000 USD per year. If you just want general small
tasks, maintenance, and bug fixes then don't spend that kind of money on a
contractor.

## Be Specific

Some people think the "services of work" page should be a few bullet points or a
short few lines describing the work that needs doing. This may be fine for small
tasks, but for most jobs I would guess that something more specific is
beneficial. If you're not specific enough, the contractor can deliver less than
you need and still be legally entitled to payment. What I would suggest is, at
least for software development jobs, to create a "required deliverables" section
in your contract. The next section covers deliverables in more detail.

For the work itself, you want to ensure that you're specific enough that you can
be reasonably sure you will get exactly what you are expecting, or something
very close, by the time the contractor is done. For example, saying, "bug fix
for sign-up button" is not specific enough. After all, there's no description of
the bug or the expected behavior after the fix. A better description would be,
"sign-up button should add user to database and email a verification link to the
user." Now you can have more confidence that once the task is done the bug fix
will be exactly as you expect. And if their delivered code _does not_ do exactly
that, you are legally permitted to withhold payment since they haven't done what
was specified in the contract.

In my opinion, it's much better to be _too_ specific at first and then negotiate
looser terms with the contractor. It's like bartering: you want to try and get
the best deal possible for yourself, and then you allow the other guy to haggle
you down until you both feel satisfied. Same goes for the rates.

## Deliverables

Let's define what a "deliverable" is first. Straight from Google, we have the
following definition for deliverable when used as a noun:

> a thing able to be provided, esp. as a product of a development process.

Alright, so a deliverable is some "thing" that is provided as a product of a
development process. In this case, it is a software development process. The
"thing" is usually code, but could expand beyond this. So when used in the
plural, we mean one or more "things" that are products of the development
process.

### Tests

The big thing I would say every new feature should have is new test cases. The
test case descriptions should be such that a non-technical person can understand
what the test is for. So, "does not return false" is a bad test description. A
better one would be "when not logged in, should not allow posting of comments."
And, of course, all the test cases must pass before the code can be considered
acceptable. For modification of existing logic, previously-created test cases
must continue to pass.

### Code Coverage

Something that most modern testing frameworks can do, or that most modern
languages have available through other means, is a code coverage tool. The idea
behind a code coverage tool is to analyze a run of all test code and see which
lines of code are "hit" and, in some cases, a count of total hits per line. This
helps developers ensure all possible flows for a code module are being
tested. For example, maybe you have a function which performs different in three
different cases, call them A, B, and C. Looking at the code coverage tool, you
notice that only flows A and B have been "hit" by tests, and C hasn't received
any hits. This means the test cases are flawed in that they don't test every
possible flow.

For new code, I would say require 100% code coverage. If not complete coverage,
require no less than 90%. Also keep a maximum LOC (Lines-of-Code) limit on
source files. Requiring 95% coverage on an 800-line source file is less
effective than 95% coverage on a 100-line source file. For modification of
existing source code I would definitely say 100% coverage, no excuses. Every new
line added, or existing line modified, should be hit by the existing test code.

### Change Summary

If someone has been keeping good commit messages, this is pretty much done. The
point of this is to give a simple summary of changes to other developers
currently working on other parts of the code. It's also great for the company to
use to create public patch notes. Again, if the developer has been writing good
commit messages then they can probably just merge their commit logs together
into one big summary.

### Source Code

This one is obvious: you need the final source code changes. Nothing new or
unexpected here.

## Let's Review

- Hire a contractor only when you have specific work that needs done, usually
  new features or large changes to an existing system that you don't have the
  human resources to do in-house at the time.
- Flat rates paid per project, or milestone, are more likely to get the contract
  completed early. It also gives the employer leverage to withhold payment until
  required deliverables are received.
- Having a base set of required deliverables helps control what is received at
  the end of a project or milestone; essentially what the contractor is required
  to deliver prior to getting paid.
- A well-devised set of required deliverables can help increase overall code
  quality. It also helps breed uniformity among independent developers, at least
  at the framework/architecture level.
