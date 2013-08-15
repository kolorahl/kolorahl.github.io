---
layout: post
title:  "Interviewing Done Wrong"
date:   2013-08-15 13:58:00
categories: updates
---

I have always been a proponent for interviewing a person by targeting their
thought process and behavior, getting to know more about who they are and how
they work, rather than jumping into a bunch of technical questions. At least,
this is how I feel about engineering interviews. But most people seem to love
throwing out heavy technical interviews, asking candidates to provide code in
a particular language of the interviewers choice, and then grading them based
on how well they could program a solution. Here are the reasons why that
is a terrible practice that is killing companies. I'm also going namedrop some
companies like Google, Facebook, and Scopely, so keep an eye for them.

## Programming Languages

### The Problem

This is perhaps the biggest flaw most companies exhibit during their interview
process. But what does solving a programming question in a specific language prove?
Only that you know how to program in that particular language. There are many
kinds of developers out there who stick to one or two languages, like Java or
Ruby, and that's it. They don't want to learn anything else because they believe
it's not worth it or that it's unnecessary.

Google was perhaps the worst offender of this, as they had a very small pool of
acceptable languages you could choose to answer technical questions in, and
pseudocoding was not a universally accepted substitute among the interviewers.

### The Solution

A company called [Basho][basho-main] has a great [article][basho-article] they
posted in which they speak about how being an Erlang company has not detracted
them from a significant talent pool. How can this be? There are fewer Erlang
programmers than, say, Java programmers, so how come Basho doesn't have any
trouble finding talented individuals to hire? It's because Basho doesn't look
for people that know Erlang specifically; in their article they say that they
look for people with the other skills they want, who have a personality and a
thought process that fits with the Basho culture, and anyone they hire after
that easily learns Erlang and can start producing code. As they say in their
article:

> By not just looking for "X Engineers" (where X is Java, Erlang, or anything
> else), we make a statement both about our own technology decision-making
> process and the expected levels of interesting work at Basho. To help me work
> on my house, I'd rather have someone who self-identifies as an "expert
> carpenter" or "expert plumber" not "expert hammer wielder" even in the cases
> where most of the job might involve that tool.

## Algorithms

### The Problem

There are a lot of people who will ask you how an algorithm works or what the
[Big-O notation][bigo] is. This isn't inherently a problem, but becomes one
when you are asked to program the algorithm or even just a piece of it. If you
are asked to code a breadth-first search for a tree structure, what will that
prove? That you've seen the code for breadth-first search before. It doesn't
mean you understand _when_ or _why_ you would use it in any practical situation.

Facebook was a horrible offender of this; although they didn't care about coding
the solution in any particular language, a significant amount of time they spent
with me had to do with re-implementing existing algorithms and determining their
Big-O notation. I would rather have a candidate understand when to use an
algorithm than the fine details of how an algorithm works.

But don't mistake this for me saying that understanding how something works
isn't important; it is, one hundred percent. But as an interviewer, I want to
know that they can apply the algorithms rather than explain them.

### The Solution

If you **must** have an algorithms question, ask how to use the algorithm. Ask
what the pros and cons are versus some similar algorithm or implementation. It's
more important, as I said above, to know that someone can properly apply an
algorithm rather than explain the inner workings of it. Asking about Big-O
notation isn't too horrible, but I would give a candidate a print-out with some
code on it and ask them to solve the Big-O for it, rather than having them write
it out themselves on a board and then solve it.

## Feedback

### The Problem

This is an interesting problem I've been encountering more. Google, Facebook,
Scopely, and other companies have denied my progression in their interviewing
process because feedback from one or more of my interviewers was negative enough
to end it. This problem here is that none of them will give me details as to
_why_ my feedback was negative. Below is a paraphrased conversation I've had
with three people: two from Google and one from Facebook.

    Recruiter/HR: Hi, we're sorry but we can't continue with your interviewing as
    feedback was a little more negative than we can allow.

    Me: Ok, I understand. One question: what was it, exactly, that I received
    negative feedback on? I would like to know so I can get a better idea of
    what I need to improve on and become a better engineer.

    Recruiter/HR Response 1: You know, I'm not actually sure. Our feedback
    doesn't say that and I can't ask our engineers, sorry.

    Recruiter/HR Response 2: The interview feedback is actually confidential. I
    personally wouldn't mind telling you, but we're not allowed to discuss the
    specifics, sorry.

In either case the company appears to be hiding poor feedback quality behind a
veil of confidentiality.

### The Solution

I personally believe that the engineering community needs to be more
collaborative and open with each other. Only by sharing what we know and learn
can we enrich the entire community and grow as a profession.

If I were interviewing someone and there were aspects I felt made them a bad fit
for the position, I would detail them out and let the candidate know. For
example: I would tell them that we are looking for someone who can better fit
the company culture and I didn't believe they held the same values and passions
that the rest of us did, then I would list off some example values and
passions. Or that the candidate did not perform very well in regards to problem
solving and I believed they had a narrow-minded approach compared to what we
want to see at our company.

## Conclusion

Interviewing practices are, for the most part, really bad. I had a discussion
many months ago with my friend [Jeremy][jong], who I hope doesn't mind being
name-dropped here. We were discussing interviewing perspectives while I was
working at a place now called Quark Games. His view was to give a difficult
technical question, one which he didn't expect to be solved in the allotted
time, but to use the question to get an in-depth view of how the candidate
solves a problem. I told him I hated technical interview questions and thought
behavioral questioning would be more effective; anything to get a better
understanding of how the candidate thinks and feels. At the time we had agreed
to disagree.

Fast forward to the present. Jeremy and I are talking and he brings up a
particular bad hire they had made. Apparently he did well during the interview
but was terrible at taking initiative or being proactive, and even worse at
learning and using a new programming language. He then mentioned that he was
beginning to rethink how he should perform interviews, and although he wasn't
one hundred percent on my side, he was very close to it.

Jeremy is a very smart person, whom I deeply respect, and to see him recognize a
flaw in the current method of interviewing gives me hope that more people will
begin to see their flawed ways and convert. Maybe not the big companies like
Google and Facebook, but hopefully the smaller and newer companies, like Basho,
will start paving a new path.

[basho-main]: http://basho.com/
[basho-article]: http://basho.com/erlang-at-basho-five-years-later/
[bigo]: http://en.wikipedia.org/wiki/Big_O_notation
[jong]: http://www.jeremyong.com/

