%%%
title = "Functional Definition of End-to-End Secure Messaging"
abbrev = "e2esm"
category = "info"
docName = "apparently this tool demands a doc name but does not use it"
ipr ="trust200902"
area = "Internet"
workgroup = "ietf-mls"
keyword = ["messaging", "end to end", "encryption", "security"]

[seriesInfo]
status = "informational"
name = "Internet-Draft"
value = "draft-muffett-end-to-end-secure-messaging-00"
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

This document
defines End-to-End Secure Messaging
in terms of the behaviours
that **MUST** be exhibited
by software
that claims to implement it,
or which claims to implement
that subset which is known as
End-to-End Encrypted Messaging.

{mainmatter}

# Introduction

End-to-End Secure Messaging (E2ESM)
is a mechanism
which offers a digital analogue
of "closed distribution lists"
for sharing message content
amongst a set of participants,
where all participants
are visible to each other
and where non-participants
are excluded
from access to message content.

In client-server network models
it is common to implement E2ESM
by means of encryption,
in order to obscure
content at rest
upon a central server.
So therefore E2ESM
is often
narrowly regarded
in terms of "end-to-end encryption".

Other architectural approaches exist -
for instance [@RicochetRefresh]
which implements
closed distribution
by using
secure point-to-point [@RFC7686] networking
to literally restrict
the distribution
of plaintext content
to relevant participants.

Therefore we describe E2ESM
in terms of
functional behaviours
of the software
rather than
in terms
of implementation
goals and technologies.

## Comments

Comments are solicited
and should be addressed to
the working group's
mailing list
TODO
and/or the author(s).

## Notational Conventions

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "NOT RECOMMENDED", "MAY", and
"OPTIONAL" in this document are to be interpreted as described in BCP
14 [@RFC2119] [@RFC8174] when, and only when, they appear in all
capitals, as shown here.

# Requirements for an End-to-End Secure Messenger

Software which functions
as an
End-to-End Secure Messenger
**MUST** satisfy the following principles, and
**MUST** satisfy these principles in respect of the provided definitions
for all forms of communication
and data-sharing
that the software offers.

Any software
that does not
satisfy these requirements
is not an
End-to-End Secure Messenger,
and it does not implement
End-to-End Secure Messaging,
nor does it implement
End-to-End Encrypted Messaging.

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

## Equality of Participation

All participants
**MUST** be peers who
**MUST** have equal access
to any given message's PCASM.

## Transparency of Participation

The existence
of all current
conversation participants
**MUST** be visible
at the current
time
to all current
conversation participants.

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

### Non-Participation

It follows that
for any given message,
all entities
that exist
outside of
the above-defined sets of participants
will be "non-participants"
in respect of that message.

## Closure of Conversation

The set of participants
in a conversation
**SHALL NOT** be increased
except by the intentional action
of one or more
existing participants.

### Public Conversations and Self-Subscription

Existing participants **MAY**
publicly share
links,
data,
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

## Management and Visibility of Participant Clients and Devices

E2ESM software
**MUST** provide
each participant entity
with means
to review or revoke access for
clients or devices
that can access
future PCASM.

E2ESM software
**MUST** provide
each participant entity
with notifications
and/or complete logs
of changes
to the set of
clients or devices
that can or could access
message PCASM.

# Definitions

These principles
**MUST** be measured
with respect to
the following definitions:

## Participant

A participant
is any entity -
human,
machine,
software bot,
conversation archiver,
or other,
that is bounded
by the extent
of that entity's
[@TrustedComputingBase].

## Conversation

A conversation
is a sequence
of one or more messages
over a period of time
amongst a constant or evolving
set of participants.

## Plaintext Content and Sensitive Metadata (PCASM)

The PCASM
of a message
is defined as
any of:

### Content PCASM

Content PCASM
is any data
that can offer
better than 50-50 certainty
regarding the value of
any given bit
of the plaintext message content. ("content")

Content PCASM would include, non-exclusively:

1. The content is "Hello, world."
1. The content starts with the word "Hello"
1. The top bit of the first byte of the content in ASCII encoding, is zero
1. The MD5 hash of the content is 080aef839b95facf73ec599375e92d47
1. The Salted-MD5 Hash of the content is : ...

### Size PCASM

For block encryption of content,
Size PCASM is the unpadded size of the content.

For stream encryption of content,
Size PCASM is currently undefined.

For transport encryption of content,
precise Size PCASM **SHOULD NOT** be observable.

### Descriptive PCASM

Descriptive PCASM
is data
that describes
the "content".

Descriptive PCASM would include, non-exclusively:

1. The content contains the substring "ello"
1. The content does not contain the word "Goodbye"
1. The content contains a substring from amongst the following set: ...
1. The content does not contain a substring from amongst the following set: ...
1. The hash of the content exists amongst the following set of hashes: ...
1. The hash of the content does not exist amongst the following set of hashes: ...
1. The content was matched by a machine-learning classifier with the following training set: ...

### Conversation Metadata (**OPTIONAL**)

Whether
per-conversation
"group" metadata,
such as
"group titles",
"group topics",
"group icons",
or "group participant lists"
constitute PCASM,
is an
**OPTIONAL**
choice
for the E2ESM software,
but that choice
**MUST**
be made apparent
to participants.

### Non-PCASM

Information which would not be PCASM would include, non-exclusively:

1. The content is sent from Alice
1. The content is sent to Bob
1. The content is between 1 and 16 bytes long
1. The content was sent at the following date and time: ...
1. The content was sent from the following IP address: ...
1. The content was sent from the following geolocation: ...
1. The content was composed using the following platform: ...

## Backdoor

A "backdoor"
is any
intentional or unintentional mechanism,
in respect of a given message
and that message's set of participants,
where some PCASM
of that message
**MAY** become available
to a non-participant
without the intentional action of a participant.

### Why call this a "backdoor"?

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
have experienced
a historical spectrum
of mechanisms
which have assisted
non-participant access to PCASM.
These have
variously been named as
"export-grade key restrictions" (TLS, then Logjam),
"side channel attacks" (Spectre and Meltdown),
"law enforcement access fields" (Clipper), and
"key escrow" (Crypto Wars).

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
aLternative, uncertain constructions
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

# Scope of a Participant in E2ESM

The term "participant"
in this document
exists to supercede
the more vague notion of "end"
in the phrase "end-to-end".

Participants are defined
in terms of an entity's [@TrustedComputingBase]
to acknowledge
that an entity
**MAY** legitimately
store, forward, or access messages
by means
that are outside of
the E2ESM software.

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

# Rationale

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
have privileged access
to PCASM,
for instance
via direct database access,
but it **MAY**
have "normal" access
to PCASM
of conversations
where it is a participant. (Integrity of Participation, Equality of Participation)

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
of one particpant with another,
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
whether it does,
or does not.

# See Also

A different approach
to defining
(specifically)
end-to-end encryption
is discussed
in [@I-D.knodel-e2ee-definition].

# IANA Considerations

This document has no IANA actions.

# Security Considerations

This document is entirely composed of security considerations.

{backmatter}

<reference anchor='TrustedComputingBase' target='https://en.wikipedia.org/wiki/Trusted_computing_base'>
	<front>
		<title>Trusted Computing Base</title>
		<author fullname="Wikipedia"> </author>
		<date year='2021'/>
	</front>
</reference>


<reference anchor='DualUse' target='https://en.wikipedia.org/wiki/Dual-use_technology'>
	<front>
		<title>Dual-use technology</title>
		<author fullname="Wikipedia"> </author>
		<date year='2021'/>
	</front>
</reference>



<reference anchor='ExportControl' target='https://en.wikipedia.org/wiki/Export_of_cryptography_from_the_United_States#Cold_War_era'>
	<front>
		<title>Export of cryptography from the United States</title>
		<author fullname="Wikipedia"> </author>
		<date year='2021'/>
	</front>
</reference>


<reference anchor='RicochetRefresh' target='https://www.ricochetrefresh.net'>
	<front>
		<title>Ricochet Refresh</title>
		<author fullname="BlueprintForFreeSpeech"> </author>
		<date year='2021'/>
	</front>
</reference>
