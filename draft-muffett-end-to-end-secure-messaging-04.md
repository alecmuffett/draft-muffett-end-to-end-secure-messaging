%%%
title = "A Duck Test for Security of Encrypted Messaging Apps"
abbrev = "e2esm"
category = "info"
docName = "apparently this tool demands a doc name but does not use it"
ipr ="trust200902"
area = "Internet"
workgroup = "individual submission"
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

This draft
describes a test
which **MAY** be used
to falsify claims that
a messaging
or messenger application,
platform,
solution,
or service ("messaging solution")
provides
either or both of
"end-to-end security"
or
"end-to-end encryption."
(either/both: "E2E")

Any
messaging solution,
or any
clearly defined subset
of a
larger messaging solution,
which claims to
provide E2E,
**MUST**
satisfy
this test;
however
satisfaction of
this test
is not
wholly sufficient
to determine that
the messaging solution
provides E2E.

{mainmatter}

# Introduction

"End-to-end security" and
"end-to-end encryption"
offer digital analogues
of "closed distribution lists"
for sharing content
amongst a set of participants,
where non-participants
are fully excluded
from access to content.

This draft
assumes
a specific
application of
"end-to-end security"
or
"end-to-end encryption"
towards the
specific use case
of individual and group
messaging solutions
where participants
who are later added
to a messaging group
**MUST NOT**
be able
to access
previously-sent content.

In turn,
use cases
for such
messaging solutions
include
the sending
and receiving
of any
or all of:

1. UNICODE or ASCII messages
1. images, video files or audio files
1. one-way streaming video or audio
1. two-way streaming video or audio, as in live calls

The application
of this test
does not
depend upon
whether the
messaging solution
is built upon a
centralized,
distributed,
hybrid,
or any other
network model.

## Comments

Comments are solicited
and should be addressed to
the working group's
mailing list
and/or the author(s).

## Notational Conventions

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "NOT RECOMMENDED", "MAY", and
"OPTIONAL" in this document are to be interpreted as described in BCP
14 [@RFC2119] [@RFC8174] when, and only when, they appear in all
capitals, as shown here.

# Definitions

The following terminology **SHALL** be used for this test.

## Entity

An "entity"
is that
which is
distingushed by
possessing a
[@TrustedComputingBase]

## Content

Plaintext content ("content")
is information
of 0 or more bits,
to be communicated.

## Metadata and PCASM

Plaintext content
and
sensitive metadata ("PCASM")
is the
union set of
content
and
associated
"metadata"
that describes
the content,
comprising
any or all of:

### Content Metadata

Content Metadata
is any data
that can offer
better than 50% certainty
regarding the value of
any bit
of the content.
Self-evidently,
this also includes
the value of
the content
itself.

### Size Metadata

1. For block encryption
   of content,
   "size metadata"
   is the
   unpadded size
   of the content.
1. For stream encryption
   of content,
   "size metadata"
   is currently undefined. (TODO)
1. For transport encryption
   of content,
   accurate "size metadata"
   **SHOULD NOT**
   be observable
   or inferable.

### Analytic Metadata

Analytic Metadata
is data
that analyses,
describes,
reduces,
or summarises
the content.

## Message and Intended Recipients

A "message"
is content
which has been
composed by
a sender
and which
is bound
to a fixed
and immutable
set of recipients
("intended recipients")
for that message.

## Recipient

A "recipient"
of a message
is an entity
which **MAY** ever
be able
to determine
any PCASM
for that message.
Recipients
of a message
**MAY**
exist outside
of the set
of intended recipients
for that message.

## Sender

The "sender"
of a message
is an entity
which composes
that message
to a set
of intended recipients
and sends
that message
into the
messaging solution.

## Platform

A "platform"
is an entity
which provides
a messaging solution.

## Conversation and Group Conversation

TODO

# Test Preconditions

The following
preconditions
**MUST** be met for
the test
to be satisfied.
Failure to
satisfy these
preconditions
is a failure
of the test.

## Recipients are Peers

For any message,
all means
of accessing
its PCASM
**MUST**
be equally available
to all recipients
without exception.

## Groups are closed from within

TODO, obvious

## Re-injection of old content is legitimate

TODO, obvious

## Consistent inheritance of group membership as intended recipients in centralized messaging solutions

TODO, no cheating or sneaky insert/elisions

# Test

The test fails
if,
for any message
that is sent
through the messaging solution,
the set
of recipients
for that message
exceeds
the set
of intended recipients
for that message.


# Analysis

TODO, non-PCASM, stuff out of scope, Ricochet, etc.

# OLD MATERIAL BELOW THESE LINES
## OLD MATERIAL BELOW THESE LINES
### OLD MATERIAL BELOW THESE LINES
#### OLD MATERIAL BELOW THESE LINES

# Definitions

These definitions
are drafted
in respect of
many examples
of software
commonly held
to offer
(or have offered)
end-to-end security;
these examples
include:

1. Signal Messenger
1. WhatsApp Messenger
1. Ricochet Messenger
1. PGP-Encrypted Email sent to an ad-hoc list of addressees, or to a maillist

Further context
for several of
these definitions
can also be found
in the rationales section,
below.

For the avoidance of doubt
we define a "messenger"
as a software solution
which enables communication
between two or more entities,
without offering
newly-added participants
retrospective access
to content
which was previously sent
by prior participants.

This echoes
the distinction
between
a "maillist"
versus
a "maillist archive"
or "web forum";
frequently these solutions
are integrated
but we only consider the maillist
as a "messenger" per se.

## Message and Platform

A "message"
is information
of 0 or more bits,
to be communicated.

Messages possess
both plaintext "content",
and also "metadata"
which describes the content.

A "platform"
is a specific instance of software
which exists
for the purpose
of routing
or exchanging
messages.

## Plaintext Content and Sensitive Metadata (PCASM)

The "PCASM"
of a message
is defined
as the
"plaintext content and sensitive metadata"
of that message,
comprising any or all of:

### Content PCASM

Content PCASM
is any data
that can offer
better than 50-50 certainty
regarding the value of
any bit
of the content.
See "Rationales" for more.

### Size PCASM

For block encryption of content,
Size PCASM is the unpadded size of the content.

For stream encryption of content,
Size PCASM is currently undefined.
(TODO, would benefit from broader input.)

For transport encryption of content,
exact Size PCASM
**SHOULD NOT**
be observable
or inferable.

See "Rationales" for more.

### Analytic PCASM

Analytic PCASM
is data
which analyses,
describes,
reduces,
or summarises
the "content".
See "Rationales" for more.

### Conversation Metadata (**OPTIONAL**)

Conversation Metadata
**MAY** exist "outside"
of messages
and describe
the conversation
context.

Whether
conversation metadata
constitutes PCASM,
is an
**OPTIONAL**
choice
for E2ESM software,
but that choice
**MUST**
be apparent
to participants.

## Entity

An "entity"
is a
human,
machine,
software bot,
conversation archiver,
or other,
which sends
and/or receives
messages.

Entities are
bounded
by the extent
of their
Trusted Computing Base ("TCB"),
including
all systems
that they control and/or utilise.

## Sender and Recipient

A "sender"
is an entity
which composes
and sends
messages.

A "recipient"
is an entity
which receives
messages
and **MAY**
be able
to access
the PCASM
of those messages.

For each message
there will be
one sender
and one or more
recipients.

## Participants and Non-Participants

The union set
of sender and recipients
for any given message
are the "participants"
in that message.

It follows that
for any given message,
all entities
that exist
outside of
the participant set
will be "non-participants"
in respect of that message.

## Conversation, Group, Centralised & Decentralised

A "conversation"
is a sequence
of one or more messages,
and the responses
or replies
to them,
over a period of time,
amongst a constant
or evolving
set of participants.

A given platform **MAY**
distinguish between
and support
more than one conversation
at any given time.

In "centralised" E2ESM
such as WhatsApp or Signal,
the software **MAY**
offer collective
"group" conversation contexts
that provide
prefabricated sets
of recipients
for the client
to utilise
when a message
is composed or sent.

In "decentralised" E2ESM
such as PGP-Encrypted Email
or Ricochet
the recipients of each message
are individually determined
by each sender
at the point of composition;
however "group" metadata
may also exist,
in terms of
(e.g.) email addressees
or subject lines.

## Backdoor

A "backdoor"
is any
intentional or unintentional mechanism,
in respect of a given message
and that message's participants,
where some PCASM
of that message
**MAY** become available
to a non-participant
without the intentional action of a participant.

# Principles

For a series of
one or more "messages"
each which are composed
of "plaintext content and sensitive metadata" (PCASM)
and which constitute
a "conversation"
amongst a set of "participants",
to provide E2ESM
will require:

## Transparency of Participation

In the nature
of "closed distribution lists",
the participants
in a message
**MUST** be
frozen into
an immutable set
at the moment
when the message
is composed or sent.

The complete set
of all recipients
**MUST** be visible
to the sender
at the moment
of message composition or sending.

The complete set
of participants
in a message
**MUST** be visible
to all other participants.

## Integrity of Participation

Excusing the
"retransmission exception",
PCASM
of any given message
**MUST** only be available
to the fixed set
of conversation participants
from whom,
to whom,
and at the time when
it was sent.

### Retransmission Exception

If a participant
that can access
an "original" message
intentionally "retransmits"
(e.g. quotes, forwards)
that message
to create
a new message
within the E2ESM software,
then
the original message's PCASM
**MAY**
become available
to a new,
additional,
and
possibly different
set of
conversation participants,
via that new message.

## Equality of Participation

All participants
**MUST** be peers,
i.e. they
**MUST** have equal access
to the PCASM
of any message;
see also
"Integrity of Participation".

## Closure of Conversation

The set of participants
in a conversation
**SHALL NOT** be increased
except by the intentional action
of one or more
existing participants.

Per "Transparency of Participation"
that action
(introducing a new participant)
**MUST**
be visible to
all other participants

### Public Conversations and Self-Subscription

Existing participants **MAY**
publicly share
links to the conversation,
identifying data
to assist discovery of the conversation,
or other mechanisms
to enable
non-participant entities
to subscribe themselves
as conversation participants.
This **MAY** be
considered
legitimate
"intentional action"
to increase the set of participants
in the group.

## Management of Participant Clients and Devices

Where there
exists
centralised
E2ESM software
that hosts
participants:

1. The E2ESM software
**MUST** provide
each participant entity
with means
to review or revoke access for
that participant's
clients or devices
that can access
future PCASM.

2. The E2ESM software
**MUST** provide
each participant entity
with notifications
and/or complete logs
of changes
to the set of
clients or devices
that can or could access
message PCASM.

# Rationales

This explanatory section
regarding the principles
has been broken out
for clarity and argumentation purposes.

## Why: Content PCASM

Content PCASM
**MUST** be protected
as it comprises
that which is
"closed" from general distribution.

The test
for measuring this
is (intended to be) modeled upon
ciphertext indistinguishability [@CipherInd]

## Why: Size PCASM

Exact size PCASM
**MUST** be protected
as it **MAY**
offer insight into
Content PCASM.

The test
for measuring this
is (intended) to address
risk of content
becoming evident
via plaintext length.

## Why: Analytic PCASM

Analytic PCASM
**MUST** be protected
as it **MAY**
offer insight into
Content PCASM,
for instance
that the content
shares features
with other,
specimen,
or known plaintext content.

## Why: Conversation Metadata as **OPTIONAL** PCASM

Conversational Metadata **MAY**
offer insight into
Content PCASM,
however the abstractions
of transport mechanism,
group management,
or platform choice,
**MAY** render this moot.

For example
an PGP-Encrypted email distribution list
named "blockchain-fans@example.com"
would leak
its implicit topic
and participant identities
to capable observers.

## Why: Entity and Participant

The term "participant"
in this document
exists to supersede
the more vague notion of "end"
in the phrase "end-to-end".

Entities,
and thus participants,
are defined
in terms of their [@TrustedComputingBase]
to acknowledge
that an entity
**MAY** legitimately
store, forward, or access messages
by means
that are outside of
the E2ESM software.

It is important to note
that the concept of "entity"
as defined by their TCB,
is the foundation
for all other trust in E2ESM.
This develops from
the basic definitions of
a [@TrustedComputingBase]
and from the concepts of
"trust-to-trust" discussed in [@RoleOfTrust].
Failure of a participant
to maintain integrity or control
over their TCB
should not be considered
a failure of an E2ESM
that connects it to other participants.

For example:
if a participant
accesses their E2ESM software
via remote desktop software,
and their RDP session is hijacked by a third party;
of if they back-up their messages
in cleartext
to cloud storage
leading somehow to data exfiltration,
neither of these
would be a failure of E2ESM.
This would instead
be a failure
of the participant's
[@TrustedComputingBase].

Further:
it would be
obviously possible
to burden
an E2ESM
with surfacing
potential integrity issues
of any given participant
to other participants,
e.g. "patch compliance".
But to require such
in this standard
would risk harming
the privacy
of the participant entity.
See also: "Mutual Identity Verification"
in "**OPTIONAL** Features of E2ESM"

## Why: Backdoor

In software engineering
there is a perpetual tension
between the concepts of
"feature" versus "bug" -
and occasionally
"misfeature" versus "misbug".
These tensions
arise from
the problem of [@DualUse] -
that it is
not feasible
to firmly
and completely
ascribe "intention"
to any hardware or software mechanism.

The information security community
has experienced
a historical spectrum
of mechanisms
which have assisted
non-participant access to PCASM.
These have
variously been named as
"export-grade key restrictions" ([@ExportControl], then [@Logjam]),
"side channel attacks" ([@Spectre] and [@Meltdown]),
"law enforcement access fields" [@Clipper], and
"key escrow" [@CryptoWars].

All of
these terms
combine
an "access facilitation mechanism"
with an "intention or opportunity" -
and for all of them
an access facilitation mechanism
is first **REQUIRED**.

An access facilitation mechanism
is a "door",
and is inherently [@DualUse].
Because the goal
of E2ESM
is to limit
access to PCASM
exclusively to
a defined set of participants,
then the intended
means of access
is clearly the "front door";
and any other access mechanism
is a "back door".

If the term
"back door"
is considered
innately pejorative,
alternative, uncertain constructions
such as
"illegitimate access feature",
"potentially intentional data-access weakness",
"legally-obligated exceptional access mechanism",
or any other phrase,
all **MUST** combine
both notions
of an access mechanism (e.g. "door")
and a definite or suspected intention (e.g. "legal obligation").

So the phrase
"back door"
is brief,
clear,
and widely understood
to mean "a secondary means of access".
In the above definition
we already allow
for the term to be prefixed
with "intentional" or "unintentional".

Thus it seems
appropriate
to use this term
in this context,
not least because
it is also not far removed
from the similar
and established term
"side channel".

## Why: Transparency of Participation

The "ends"
of "end to end"
are the participants;
for a message to be composed
to be exclusively accessible
to that set of participants,
all participants must be visible.

For
decentralised
"virtual point-to-point"
E2ESM solutions
such as PGP-Encrypted Email
or Ricochet,
the set of participants
is fixed
by the author
at the time
of individual message composition,
and **MUST**
be visible
to all participants.

For "centralised"
E2ESM solutions
such as Signal
or WhatsApp,
the set of participants
is a "group context"
shared amongst all participants
and at the time
of individual message composition
it **MUST**
be inherited
into a set of
"fixed" per-participant
access capabilities
by the author.

## Why: Integrity of Participation

Inherent in the term
"end to end secure messenger"
is the intention
that PCASM
will only be available
to the participants ("ends")
at the time the message was composed.

If this was not the intention
we would deduce
that an E2ESM
would automatically make
past content
available to
newly-added conversation participants,
thereby breaking
forward secrecy.
This is not
a characteristic
of any E2ESM,
but it is
characteristic of
several non-E2ESM.
Therefore
the converse
is true.

As a concrete example
this means
that participants
who are
newly added
to a "group"
**MUST NOT**
be able
to read messages
that were
sent before
they joined
that group -
unless
(for instance)
one pre-existing participant
is explicitly intended
to provide
a "searchable archive"
or similar function.
The function
of such a participant
is considered to be
out of scope
for the messenger.

## Why: Equality of Participation

Without equality of participation
it would be allowed
for a person to deploy
a standalone cleartext chat server,
available solely over TLS-encrypted links,
declare themselves to be "participants"
in every conversation from its outset,
access all message PCASM on that basis,
and yet call themselves an E2ESM.

So this is an "anti-cheating" clause:
all participant access to PCASM
**MUST** be via
the same mechanisms
for all participants
without favour or privilege,
and in particular
PCASM **MUST NOT**
be available via other means,
e.g.
raw block-device access,
raw filestore,
raw database access,
or network sniffing.

## Why: Closure of Conversation

If a conversation
is not
"only extensible from within"
then it would be possible
for participants
to be injected
into the conversation
thereby defeating
the closure of message distribution.

A subtle
centralised vs: decentralised
edge-case is as follows:
consider a
PGP-encrypted email distribution list.
Would it break "closure of conversation"
for a non-participant
email administrator
to simply add new users
to the maillist?

Answer: no, because
in this case
the maillist
is functioning
as a "platform"
for multiple "conversation" threads,
and mere addition of
of a new
"transport-level"
maillist member
would not include them
as a participant
in ongoing E2ESM conversations;
such inclusion
would be a future burden
upon existing participants.

However:
similar external injection
of a new entity
into a centralised
WhatsApp or Signal "group"
would be clearly a breach
of "closure of conversation".

## Why: Management of Participant Clients and Devices

There is little benefit
in requiring
conversations
to be closed
against "participant injection"
if a non-participant
may obtain
PCASM access
by forcing a platform
to silently add
extra means of PCASM access
to an existing participant
on behalf of that non-participant.

Therefore
to be an E2ESM
the platform
**MUST** provide
the described
management of participant clients and devices.

# **OPTIONAL** Features of E2ESM

## Disappearing Messages

"Disappearing",
"expiring",
"exploding",
"ephemeral"
or other forms of
time-limited access to PCASM
are strongly **RECOMMENDED**
but not obligatory
mechanisms
for E2ESM,
not least
because they
are impossible to implement
in a way that cannot be circumvented
by e.g. screenshots.

## Mutual Identity Verification

Some manner of
"shared key"
which mutually assures
participant identity
and communications integrity
are strongly **RECOMMENDED**
but not obligatory
mechanisms
for E2ESM.

The benefits
of such mechanisms
are limited to certain perspectives
of certain platforms.

For instance:
in Ricochet
the identity key
of a user
is the absolute source of truth
for their identity,
and excusing detection of typographic errors
there is nothing which can be added to that
in order to further assure their "identity".

Similarly WhatsApp
provides each participant
with a "verifiable security QR code"
and "security code change notifications",
but these codes
do not "leak" the number
of "WhatsApp For Web" connections,
desktop WhatsApp applications,
or other clients
which are bound to
the E2ESM software
which executes on that phone.

Participant-client information
of this kind
**MAY** be
a highly private aspect
of that participant's TCB,
and **SHOULD** be treated
sensitively by platforms.

# Examples of PCASM

For an example message with content ("content") of "Hello, world.",
for the purposes of this example encoded as an ASCII string of length
13 bytes without terminator character.

## Content PCASM

Examples of Content PCASM would include, non-exclusively:

1. The content is "Hello, world."
1. The content starts with the word "Hello"
1. The top bit of the first byte of the content, is zero
1. The MD5 hash of the content is 080aef839b95facf73ec599375e92d47
1. The Salted-MD5 Hash of the content is : ...

## Size PCASM

Size PCASM is defined in the main text, as it relates to the transport
and/or content encryption mechanisms.

## Analytic PCASM

Examples of Analytic PCASM would include, non-exclusively:

1. The content contains the substring "ello"
1. The content does not contain the word "Goodbye"
1. The content contains a substring from amongst the following set: ...
1. The content does not contain a substring from amongst the following set: ...
1. The hash of the content exists amongst the following set of hashes: ...
1. The hash of the content does not exist amongst the following set of hashes: ...
1. The content was matched by a machine-learning classifier with the following training set: ...

## Conversation Metadata as **OPTIONAL** PCASM

Examples of Conversation Metadata would include, non-exclusively:

1. maillist email addresses
1. maillist server names
1. group titles
1. group topics
1. group icons
1. group participant lists

## Non-PCASM

Information which would not be PCASM would include, non-exclusively:

1. The content is sent from Alice
1. The content is sent to Bob
1. The content is between 1 and 16 bytes long
1. The content was sent at the following date and time: ...
1. The content was sent from the following IP address: ...
1. The content was sent from the following geolocation: ...
1. The content was composed using the following platform: ...

# Worked Example

Consider FooBook,
a hypothetical example company
which provides
messaging services
for conversations
between entities
who use it.

For each conversation
FooBook **MUST** decide
whether to represent itself
as a conversation participant
or as a non-participant. (Transparency of Participation)

If FooBook decides
to represent itself
as a non-participant,
then it **MUST NOT**
have any access to PCASM. (Integrity of Participation / Non-Participation)

If FooBook decides
to represent itself
as a participant,
then it **MUST NOT**
have "exceptional" access
to PCASM,
despite being
the provider
of the service -
for instance
via
raw database access
or network sniffing.
However it **MAY**
participate in
E2ESM conversations
in a "normal" way,
and thereby
have "normal" access
to intra-conversation PCASM.
(Integrity of Participation, Equality of Participation)

FooBook **MAY**
retain means
to eject reported abusive participants
from a conversation. (Decrease in Closure of Participation)

FooBook **MUST NOT**
retain means
to forcibly insert
new participants
into a conversation.
For clarity:
this specification
does not recognise
any notion
of "atomic" exchange
of one participant with another,
treating it as an ejection,
followed by an "illegitimate" insertion.
(Increase in Closure of Participation)

FooBook **MUST**
enable the user
to observe and manage
the complete state
of their [@TrustedComputingBase]
with respect
to their FooBook messaging services. (Management and Visibility)

FooBook **MAY**
treat conversation metadata
as PCASM,
but it **MUST**
communicate to participants
whether it does
or does not.

# See Also

A different approach
to defining
(specifically)
end-to-end encryption
is discussed
in [@I-D.knodel-e2ee-definition].

# Live Drafts

Live working drafts
of this document
are at:
https://github.com/alecmuffett/draft-muffett-end-to-end-secure-messaging

# IANA Considerations

This document has no IANA actions.

# Security Considerations

This document is entirely composed of security considerations.

{backmatter}

<reference anchor='RoleOfTrust' target='https://www.repository.law.indiana.edu/fclj/vol63/iss2/3'>
	<front>
		<title>The End-to-End Argument and Application Design: The Role of Trust</title>
		<author fullname="David D. Clark"> </author>
		<author fullname="Marjory S. Blumenthal"> </author>
		<date year='2011'/>
	</front>
</reference>

<reference anchor='Ricochet' target='https://www.ricochetrefresh.net'>
	<front>
		<title>Ricochet Refresh</title>
		<author fullname="BlueprintForFreeSpeech"> </author>
		<date year='2021'/>
	</front>
</reference>

<reference anchor='BREACH' target='https://en.wikipedia.org/wiki/BREACH'>
    <front>
        <title>BREACH</title>
        <author fullname="Wikipedia"></author>
        <date year='2021'/>
    </front>
</reference>

<reference anchor='CipherInd' target='https://en.wikipedia.org/wiki/Ciphertext_indistinguishability'>
    <front>
        <title>Ciphertext indistinguishability</title>
        <author fullname="Wikipedia"></author>
        <date year='2021'/>
    </front>
</reference>

<reference anchor='Clipper' target='https://en.wikipedia.org/wiki/Clipper_chip'>
    <front>
        <title>Clipper chip</title>
        <author fullname="Wikipedia"></author>
        <date year='2021'/>
    </front>
</reference>

<reference anchor='CryptoWars' target='https://en.wikipedia.org/wiki/Crypto_Wars'>
    <front>
        <title>Crypto Wars</title>
        <author fullname="Wikipedia"></author>
        <date year='2021'/>
    </front>
</reference>

<reference anchor='DualUse' target='https://en.wikipedia.org/wiki/Dual-use_technology'>
    <front>
        <title>Dual-use technology</title>
        <author fullname="Wikipedia"></author>
        <date year='2021'/>
    </front>
</reference>

<reference anchor='ExportControl' target='https://en.wikipedia.org/wiki/Export_of_cryptography_from_the_United_States#Cold_War_era'>
    <front>
        <title>Export of cryptography from the United States</title>
        <author fullname="Wikipedia"></author>
        <date year='2021'/>
    </front>
</reference>

<reference anchor='Logjam' target='https://en.wikipedia.org/wiki/Logjam_(computer_security)'>
    <front>
        <title>Logjam</title>
        <author fullname="Wikipedia"></author>
        <date year='2021'/>
    </front>
</reference>

<reference anchor='Meltdown' target='https://en.wikipedia.org/wiki/Meltdown_(security_vulnerability)'>
    <front>
        <title>Meltdown</title>
        <author fullname="Wikipedia"></author>
        <date year='2021'/>
    </front>
</reference>

<reference anchor='Spectre' target='https://en.wikipedia.org/wiki/Spectre_(security_vulnerability)'>
    <front>
        <title>Spectre</title>
        <author fullname="Wikipedia"></author>
        <date year='2021'/>
    </front>
</reference>

<reference anchor='TrustedComputingBase' target='https://en.wikipedia.org/wiki/Trusted_computing_base'>
    <front>
        <title>Trusted Computing Base</title>
        <author fullname="Wikipedia"></author>
        <date year='2021'/>
    </front>
</reference>
