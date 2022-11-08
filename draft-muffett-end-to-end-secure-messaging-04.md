%%%
title = "A 'Duck Test' for End-to-End Secure, Encrypted Messenger Software"
abbrev = "e2esm"
category = "info"
docName = "apparently this tool demands specification of a doc name but does not use it"
ipr ="trust200902"
area = "Internet"
workgroup = "CFRG"
keyword = ["messaging", "end to end", "end to end encryption", "end to end secure", "end to end security", "encryption", "security"]

[seriesInfo]
status = "informational"
name = "Internet-Draft"
value = "draft-muffett-end-to-end-secure-messaging-04"
stream = "IETF"

[[author]]
initials="A."
surname="Muffett"
fullname="Alec Muffett"
organization = "Security Researcher"
  [author.address]
  email = "alec.muffett@gmail.com"
%%%

.# Abstract

This internet-draft
describes a test
which **MAY** be used,
either singly
or in association
with further tests,
to establish whether
end-to-end secure,
encrypted messenger software
correctly exhibits behaviours
that are commonly
associated with those
and related descriptions
of messenger software.

{mainmatter}

# Introduction

## Work in Progress

This document is a complete rewrite from the ground up; if you are
interested in seeing contextual previous work, see the
`draft-muffett-end-to-end-secure-messaging-04-abandoned` series.

## Why CFRG?

The [IRTF CFRG charter](https://datatracker.ietf.org/doc/charter-irtf-cfrg/01/)
says:

> The CFRG serves as a bridge between theory and practice, bringing
> new cryptographic techniques to the Internet community and promoting
> an understanding of the use and applicability of these mechanisms
> via Informational RFCs ... Our goal is to provide a forum for
> discussing and analyzing general cryptographic aspects of security
> protocols, and to offer guidance on the use of emerging mechanisms
> and new uses of existing mechanisms.

This internet-draft proposes an informational RFC which assists
understanding of the use and applicability of end-to-end secure,
encrypted messenger software.  This is achieved via discussion and
analysis of general cryptographic aspects of the security which such
software commonly offers, thereby providing the reader with guidance
regarding the use - especially fitness and choice - of such software.

Hence this internet-draft is submitted to CFRG.

## Why a 'Duck Test'?

There are efforts afoot to help a user determine whether some software
'looks' like end-to-end secure, encrypted messenger software.  Such
determinations may require considerable information, discussion of
nuance, and application of considerable judgement.

By contrast, this internet-draft specifies a simple 'falsifiability'
test using which a person may establish whether some software does not
'quack' in the way that end-to-end secure, encrypted messenger
software is commonly expected.

The described test is not intended to be complete; additional tests,
checks and obligations may be brought to bear by people who wish to
determine whether some software also offers other characteristics such
as 'anonymity', or broader forms of 'metadata privacy'.

If some software fails to satisfy the duck test, it will be deemed
only to have failed the duck test, and nothing more excepting that by
failing the duck test we can clearly state that the software fails to
exhibit some commonly expected characteristics of end-to-end secure,
encrypted messenger software.

## Why only 'Messenger Software'?

This internet-draft is written for the test to be applied to
end-to-end secure, encrypted messenger software.

It may be that the concepts describe could be more broadly applied -
for instance to other encrypted transport protocols - but the scale of
adoption, invention, and discussion of messenger software demands a
focused document which deals exclusively with the particular use-case,
common features and foibles of end-to-end secure, encrypted messenger
software.

Future documents may explore the aspects of this duck test which are
well-suited for other purposes.

# The 'Field Model'

Several key sources on encryption and privacy (TK, TK, TK) observe
using similar terms that in pre-industrial-revolution societies:

> All that was once necessary for two or more people to have a private
> conversation was for them to walk into a field - away from
> eavesdroppers - where they could simply talk...

We refer to this as the 'field model' of secure communication, and
observe several characteristics from which we derive the duck test:

* There is a 'speaker', who will be the 'first party', named 'Alice'
  ('A')

* There are 'listeners', who will be 'second parties', named 'Bob'
  ('B'), 'Carol' ('C'), 'Dave' ('D'), etc...

* The speaker, and the listeners which are visible to the speaker as
  standing 'within earshot' alongside her in the field, comprise the
  'participants' for a given message as uttered by the speaker

* Each message may have different 'participation', as Bob, Carol, and
  Dave variously arrive and depart, all being seen by Alice

* There is a 'field' or 'platform' ('P') for the conversation, acting
  as a 'third party', analogous to 'WhatsApp' or 'Signal' or other
  end-to-end secure, encrypted messenger software; the third party is
  inert ground and is incapable of comprehension of the conversation

* All other entities outside of these three sets, are 'fourth parties'

## The 'Duck Test'

From the above we may define the duck test:

> Subject to a fixed set of conditions and exceptions: for any given
> message, if **any** entity that was not a 'participant' for that
> message **may** use partial or complete knowledge of the platform -
> including logs of past-sent and future-sent messages - to learn
> **some** information regarding that message's content, then the
> platform fails to satisfy the duck test

## 'Learn Some Information'?

The duck test pivots upon an entity which was not first- or
second-party to a message, "learning some information" about that
message.  How much is "some information"?

> For the duck test we define "learning about a single bit of message
> content to greater than 50% certainty" as being sufficient
> information to have learned so as to cause failure of the test

This condition extends beyond message content into some aspects of
sensitive metadata - for instance zero (or very short) message lengths
can leak single bits of message content to greater than 50% certainty,
and therefore must be mitigated.

## 'Conditions and Exceptions'

...
