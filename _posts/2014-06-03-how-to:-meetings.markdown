---
layout: post
uid: 455151260
title: "How To: Meetings"
date: 2014-06-03 15:54:20 -0700
permalink: /posts/455151260
---

Having worked for a variety of companies, I have experienced many different ways
of setting up and performing meetings. Almost every single one of them poorly
done. Along with the rise of "agile" development has come a new brand of
meeting, the completely useless **stand-up**. I presume it is called this
because the amount of time you are supposed to spend in this meeting is short
enough to warrant everyone just standing around in a circle. I'm going to look
at why the stand-up meeting is broken and not worth your time, followed by the
right way to initiate and conduct meetings.

## Stand-Ups: It's a Trap!

I find that companies and individuals claiming to be "agile" often don't know
about the [Agile Manifesto](http://www.agilemanifesto.org/) or the
[12 Principles](http://www.agilemanifesto.org/principles.html) of agile
development. To them, it is just a buzz word that means "we do stuff fast and
get s#!t done". As part of this movement there have been many that now herald the
[Stand-Up Meeting](http://en.wikipedia.org/wiki/Stand-up_meeting). For those not
intimate with this kind of meeting, I will go over it now.

A stand-up meeting takes 15 minutes at most to complete. Usually each person
takes 1 to 2 minutes and then the meeting conductor moves on to the next
person. Each person answers three questions:

1. What did I do yesterday?
2. What am I doing today?
3. What blockers are preventing progress?

At first glance, seems harmless enough. And if the conductor is keeping everyone
to their time limit, then the meeting should be short and people will need to
focus on only the most important bits of their work. Except there is one major
flaw with each of these questions.

1. Nobody except your project manager cares. And if it was important enough to
   warrant other people knowing about it, you should be sending out an
   end-of-day email to the appropriate people to let them know what has been
   done. If it's that important and you don't send such an email, chances are
   you are a blocking element in another person's work.
2. Same as (1). And, realistically, if you are doing these meetings in the
   morning - which most people do - then you only _think_ you know what you are
   doing today and don't actually know until the day plays out. Servers could
   crash, buildings could catch fire, or any other number of scenarios which
   could drastically change your plans.
3. This is the point everyone believes is most important in a stand-up, but is
   actually the worst one. If I encounter a blocker - something or someone that
   is preventing me from completing any of my work - then I alert the
   appropriate individuals **immediately**. I don't wait until a stand-up
   meeting, and if you do wait then you are really just your own blocker. If you
   even suspect that you are about to run into a blocker, immediately contact
   the relevant people and let them know. By the time the stand-up starts you
   should already have every necessary individual made aware of your blockers.

So that is the base reasoning behind why stand-up meetings are bad. You don't
need them because they don't answer questions and they don't improve
productivity. As far as I can tell, all they do is increased _perceived_
productivity. Most people already feel, without any logical basis, that meetings
make things more productive. But with the new generation coming into power in
the workplace people are finding traditional meetings are too long and too dry,
so the stand-up is now the new method for being productive without spending too
much time doing so.

## When to Hold a Meeting

This is something many people don't know. When is it appropriate to hold a
meeting? Another important question that is coupled strongly with this: who
would be necessary in the meeting? Meeting are great for the following
situations:

- Discussing opinions to reach a decision.

That's it. There is no other reason to hold a formal meeting. This doesn't mean
two or three people can't get together and talk about stuff, but that's not a
meeting, that's just a discussion. A meeting is, in the context of a business, a
discussion between individuals in order to reach a decision. If you are hosting
a meeting for any other reason, you are doing it wrong. Even announcement
meetings are bad; send out an email or have leads/managers hold informal
meetings with their teams to deliver the announcement.

Also notice that I said _opinions_. This is because if you are discussing purely
based on facts, and one is a better choice than another, there's no need for
further discussion. If someone said to me, "We are looking to optimize and can
either go with option (A) which takes two weeks to implement and gives 2x
improvement or option (B) which takes three weeks to implement and gives 4x
improvement", the facts here say option (B). In that scenario, every week of
work done in option (B) gives 33% better improvement rate than option
(A). However, if there is a solid deadline of, say, two weeks, that is another
fact to take into account; that means we can only go with option (A) since the
alternative takes too long.

The only time discussion becomes necessary is when the facts don't decide a
clear course of action and therefore require further discussion. This means that
a number of people should be present: project manager, quality assurance
manager, designer, developer. This is the minimum, I would say, for a full-sized
software development company. The designer needs to be present to ensure that
the options being discussed are compatible with the desired product/feature
goal. The project manager needs to know how this will affect the project and if
any changes in resources need to be made to accommodate for the new
direction. The quality assurance manager needs to know how this will affect
their test plans and timelines. The developer is there to give expert opinion on
the feasibility, time estimate, and complexity of each option.

I would say that a smaller meeting is acceptable for people prototyping or
performing research of a product. While a designer should still be present, the
only additional people necessary will be the developer(s). Generally research
and prototyping is far more chaotic than development and maintenance of a live
product.

Now we know under what circumstance a meeting is acceptable and who should be
involved. We move on to the dreaded scheduling of meetings.

## When to Meet

This is extremely important. More important than some people may realize. You
definitely don't want to force people to work through their eating schedule, so
don't make it too early, too late, and definitely don't schedule meetings
between 11:30 and 13:30. Those two hours in the middle of the day are, I find, a
common time that many people enjoy to get lunch.

It is also important to realize that meetings are important, and therefore
shouldn't be rushed unnecessarily. You certainly don't want to wait a week
before holding the meeting, but I would say that you should expect to host the
meeting 24 to 72 hours after sending out invites. Notice how the minimum time in
that range is 24 hours; never expect people to accept same-day meeting
invitations. People already have their day planned and if you try to force them
to interrupt their plans for your meeting, chances are they won't be very useful
to you.

This leads into a final point regarding time: send out a meeting invite for your
preferred time, and then include additional alternate times. I actually like to
use [Doodle](http://doodle.com) for my scheduling needs because it handles
showing people when I'm unavailable, using aggregate data from all my calendars,
and allows me to send out meeting requests with multiple times. Invitees may
then vote on which times work best for them, selecting all times that apply.

## Be a Conductor

If you initiated the meeting, you must become the conductor. Your role is very
clear: you must ensure the discussion is not side-tracked, that everyone gets an
opportunity to speak, and that the meeting starts and ends on time. That last
bit is very important; even if you have not reached a decision by the end of the
meeting time, **you must end the meeting anyway**. People have other things to
do, other meetings to attend, and you must not interfere with that by allowing
your meeting to run late. It is also quite rude to allow a meeting to start
late, so do what you can to get it going on time.

If possible, also have someone taking notes on the meeting. This is especially
helpful if you think you may run over the scheduled time. This way the note
taker may send out the "meeting minutes" to everyone while you schedule a
follow-up meeting. These notes will help be a guide for which topics need
further discussion and which may need more research. This way you and the other
attendees may prepare yourselves adequately for Round Two. If you haven't come
up with an answer by the end of the second meeting, however, you are doing
something wrong. In the end, someone has to make a decision. Ensure that there
is someone in the group who can - and will - have the final word if discussion
isn't leading to a decision.

## Final Words

Don't do stand-up meetings. Seriously. They are 15 minutes of wasted time. Use
email to communicate more often on things not immediately important. Use
instant-messaging applications, like Skype or Hangouts, to communicate on more
urgent issues. Use a phone to initiate a discussion on extremely urgent
matters. When discussing solutions, put forth as many facts as possible and make
your decision based on that; if a decision still can't be made, host a
meeting. Start and stop your meetings on time. Don't schedule meetings during
eating hours.
