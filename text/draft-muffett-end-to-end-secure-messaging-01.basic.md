%%%
title = "Functional Definition of End-to-End Secure Messaging"
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
value = "draft-muffett-end-to-end-secure-messaging-01"
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

This document defines End-to-End Secure Messaging in terms of the behaviours that **MUST** be
exhibited by software that claims to implement it, or which claims to implement that subset which is
known as End-to-End Encrypted Messaging.

{mainmatter}

# Introduction

End-to-End Secure Messaging (E2ESM) is a mechanism which offers a digital analogue of "closed
distribution lists" for sharing message content amongst a set of participants, where all
participants are visible to each other and where non-participants are excluded from access to
message content.

In client-server network models it is common to implement E2ESM by means of encryption, in order
to obscure content at rest upon a central server. So therefore E2ESM is often narrowly regarded in
terms of "end-to-end encryption".

Other architectural approaches exist - for instance [@RicochetRefresh] which implements closed
distribution by using secure point-to-point [@RFC7686] networking to literally restrict the
distribution of plaintext content to relevant participants.

Therefore we describe E2ESM in terms of functional behaviours of the software rather than in terms
of implementation goals and technologies.

## Comments

Comments are solicited and should be addressed to the working group's mailing list TODO and/or the
author(s).

## Notational Conventions

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT",
"RECOMMENDED", "NOT RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as
described in BCP 14 [@RFC2119] [@RFC8174] when, and only when, they appear in all capitals, as shown
here.

# Requirements for an End-to-End Secure Messenger

Software which functions as an End-to-End Secure Messenger **MUST** satisfy the following
principles, and **MUST** satisfy these principles in respect of the provided definitions for all
forms of communication and data-sharing that the software offers. The software **MAY** comprise
either a complete application, or a clearly defined subset of functionality within a larger
application.

Any software that does not satisfy these requirements is not an End-to-End Secure Messenger, and
it does not implement End-to-End Secure Messaging, nor does it implement End-to-End Encrypted
Messaging.

# Definitions

Further context for several of these definitions may also be found in the rationales section, below.

## Participant

A participant is any entity - human, machine, software bot, conversation archiver, or other - and
the systems that they control and use for the E2ESM software, bounded by the extent of that entity's
Trusted Computing Base (TCB).

## Conversation

A conversation is a sequence of one or more messages over a period of time amongst a constant or
evolving set of participants.

## Plaintext Content and Sensitive Metadata (PCASM)

The PCASM of a message is defined as any or all of:

### Content PCASM

Content PCASM is any data that can offer better than 50-50 certainty regarding the value of any
given bit of the plaintext message content ("content").

### Size PCASM

For block encryption of content, Size PCASM is the unpadded size of the content.

For stream encryption of content, Size PCASM is currently undefined.

For transport encryption of content, precise Size PCASM **SHOULD NOT** be observable.

### Analytic PCASM

Analytic PCASM is data which analyzes, describes, reduces, or summarizes the "content".

### Conversation Metadata (**OPTIONAL**)

Conversation Metadata exists "outside" of messages and describes the conversationa context. Whether
per-conversation metadata constitute PCASM, is an **OPTIONAL** choice for E2ESM software, but that
choice **MUST** be made apparent to participants.

## Backdoor

A "backdoor" is any intentional or unintentional mechanism, in respect of a given message and
that message's set of participants, where some PCASM of that message **MAY** become available to a
non-participant without the intentional action of a participant.

# Principles

For a series of one or more "messages" each which are composed of "plaintext content and sensitive
metadata" (PCASM) and which constitute a "conversation" amongst a set of "participants", to provide
E2ESM will require:

## Transparency of Participation

The complete set of all conversation participants **MUST** be visible at the current time to all
conversation participants.

## Integrity of Participation

Excusing the "retransmission exception", PCASM of any given message **MUST** only be available to
the fixed set of conversation participants from whom, to whom, and at the time when it was sent.

### Retransmission Exception

If a participant that can access an "original" message intentionally "retransmits" (e.g. quotes,
forwards) that message to create a new message within the E2ESM software, then the original
message's PCASM **MAY** become available to a new, additional, and possibly different set of
conversation participants, via that new message.

### Non-Participation

It follows that for any given message, all entities that exist outside of the above-defined sets of
participants will be "non-participants" in respect of that message.

## Equality of Participation

All participants **MUST** be peers who **MUST** have equal access to the PCASM of any message for
which they have access; see "Integrity of Participation".

## Closure of Conversation

The set of participants in a conversation **SHALL NOT** be increased except by the intentional
action of one or more existing participants.

### Public Conversations and Self-Subscription

Existing participants **MAY** publicly share links, data, or other mechanisms to enable
non-participant entities to subscribe themselves as conversation participants. This **MAY** be
considered legitimate "intentional action" to increase the set of participants in the group.

## Management of Participant Clients and Devices

Where there exists centralised E2ESM software that hosts participants:

1.  The E2ESM software **MUST** provide each participant entity with means to review or revoke
    access for clients or devices that can access future PCASM.

2.  The E2ESM software **MUST** provide each participant entity with notifications and/or complete
    logs of changes to the set of clients or devices that can or could access message PCASM.

# Rationales

This explanatory section regarding the principles has been broken out for clarity and argumentation
purposes.

## Why: Participant

It is important to note that the concept of "participant", defined by their TCB, is a foundation
for all other trust. Developing from the basic definitions of a [@TrustedComputingBase] and from
the concept of "trust-to-trust" discussed in [@RoleOfTrust], a failure of a participant to maintain
integrity over their own (trusted) environment should not be considered a failure of an E2ESM that
connects it to other participants.

Further: it is obviously possible to burden the E2ESM with surfacing potential integrity issues of
any given participant; but to require such in this standard would risk harming the privacy of the
participant entity.

The term "participant" in this document exists to supersede the more vague notion of "end" in the
phrase "end-to-end".

Participants are defined in terms of an entity's [@TrustedComputingBase] to acknowledge that an
entity **MAY** legitimately store, forward, or access messages by means that are outside of the
E2ESM software.

For example: if a participant accesses their E2ESM software via remote desktop software, and their
RDP session is hijacked by a third party; of if they back-up their messages in cleartext to cloud
storage leading somehow to data exfiltration, neither of these would be a failure of E2ESM. This
would instead be a failure of the participant's [@TrustedComputingBase].

## Why: Content PCASM

**TODO** because content needs to stay secret

## Why: Size PCASM

**TODO** because "yes" is three letters, and "no" is two. Unless you're using another language, but
signals intelligence is still a thing.

## Why: Analytic PCASM

**TODO** because these enable backdoors.

## Why: Conversation Metadata as **OPTIONAL** PCASM

**TODO** optional because email, if nothing else.

## Why: Backdoor

In software engineering there is a perpetual tension between the concepts of "feature" versus "bug"
- and occasionally "misfeature" versus "misbug". These tensions arise from the problem of [@DualUse]
- that it is not feasible to firmly and completely ascribe "intention" to any hardware or software
mechanism.

The information security community have experienced a historical spectrum of mechanisms which have
assisted non-participant access to PCASM. These have variously been named as "export-grade key
restrictions" (TLS, then Logjam), "side channel attacks" (Spectre and Meltdown), "law enforcement
access fields" (Clipper), and "key escrow" (Crypto Wars).

All of these terms combine an "access facilitation mechanism" with an "intention or opportunity" -
and for all of them an access facilitation mechanism is first **REQUIRED**.

An access facilitation mechanism is a "door", and is inherently [@DualUse]. Because the goal of
E2ESM is to limit access to PCASM exclusively to a defined set of participants, then the intended
means of access is clearly the "front door"; and any other access mechanism is a "back door".

If the term "back door" is considered innately pejorative, alternative, uncertain constructions such
as "illegitimate access feature", "potentially intentional data-access weakness", "legally-obligated
exceptional access mechanism", or any other phrase, all **MUST** combine both notions of an access
mechanism (e.g. "door") and a definite or suspected intention (e.g. "legal obligation").

So the phrase "back door" is brief, clear, and widely understood to mean "a secondary means of
access". In the above definition we already allow for the term to be prefixed with "intentional" or
"unintentional".

Thus it seems appropriate to use this term in this context, not least because it is also not far
removed from the similar and established term "side channel".

## Why: Transparency of Participation

The "ends" of "end to end" are the participants; for a message to be composed to be exclusively
accessible to that set of participants, all participants must be visible.

For "virtual peer-to-peer" E2ESM solutions such as "Email with PGP" or (to a limited extent)
"Ricochet", the set of participants is fixed by the author at the time of individual message
composition, and **MUST** be visible to all participants.

For "centralised" E2ESM solutions such as Signal or WhatsApp, the set of participants is a "group
context" shared amongst all participants and at the time of individual message composition it
**MUST** be inherited into a set of "fixed" per-participant access capabilities by the author.

## Why: Integrity of Participation

Inherent in the term "end to end secure messenger" is the intention that PCASM will only be
available to the participants ("ends") at the time the message was composed.

If this was not the intention we would deduce that an E2ESM would automatically make past content
available to newly-added conversation participants, thereby breaking forward secrecy. This is not a
characteristic of any E2ESM, but it is characteristic of several non-E2ESM. Therefore the converse
is true.

## Why: Equality of Participation

Without equality of participation it would be allowed for a person to deploy a standalone cleartext
chat server, available solely over TLS-encrypted links, declare themselves to be "participants" in
every conversation from its outset, access all message PCASM on that basis, and yet call themselves
an E2ESM.

So this is an "anti-cheating" clause: all participant access to PCASM **MUST** be via the same
mechanisms for all participants without favour or privilege, and in particular PCASM **MUST NOT** be
available via other means, e.g. raw filestore, database access or network sniffing.

## Why: Closure of Conversation

If a conversation is not "only extensible from within" then it would be possible for participants to
be injected into the conversation thereby defeating the closure of message distribution.

## Why: Management of Participant Clients and Devices

**TODO** **REQUIRED** because there is little benefit in requiring group conversations to be closed
against "ghost participant injection" if the security services of an illiberal state will simply
demand that the ghost is injected into a participant instead of a conversation

## Why Not: Require Disappearing Messages?

**TODO** / doesn't fit email / excellent, **RECOMMENDED** even, but not obliged.

## Why Not: Require Mutual Identity Verification?

**TODO** / how to metricate the value-add / how to add value at all, in a peer-to-peer network? /
how to add value at all, if there is no external trust? / also: reflections on trusting trust

## Why Not: Require Third-Party Identity?

**TODO**

# Examples of PCASM

For an example message with a plaintext content ("content") of "Hello, world.", for the purposes of
this example encoded as an ASCII string of length 13 bytes without terminator character.

## Content PCASM

Examples of Content PCASM would include, non-exclusively:

1.  The content is "Hello, world."

2.  The content starts with the word "Hello"

3.  The top bit of the first byte of the content, is zero

4.  The MD5 hash of the content is 080aef839b95facf73ec599375e92d47

5.  The Salted-MD5 Hash of the content is : ...

## Size PCASM

Size PCASM is defined in the main text, as it relates to the transport and/or content encryption
mechanisms.

## Analytic PCASM

Examples of Analytic PCASM would include, non-exclusively:

1.  The content contains the substring "ello"

2.  The content does not contain the word "Goodbye"

3.  The content contains a substring from amongst the following set: ...

4.  The content does not contain a substring from amongst the following set: ...

5.  The hash of the content exists amongst the following set of hashes: ...

6.  The hash of the content does not exist amongst the following set of hashes: ...

7.  The content was matched by a machine-learning classifier with the following training set: ...

## Conversation Metadata as **OPTIONAL** PCASM

Examples of Conversation Metadata would include, non-exclusively:

1.  maillist email addresses

2.  maillist server names

3.  group titles

4.  group topics

5.  group icons

6.  group participant lists

## Non-PCASM

Information which would not be PCASM would include, non-exclusively:

1.  The content is sent from Alice

2.  The content is sent to Bob

3.  The content is between 1 and 16 bytes long

4.  The content was sent at the following date and time: ...

5.  The content was sent from the following IP address: ...

6.  The content was sent from the following geolocation: ...

7.  The content was composed using the following platform: ...

# Worked Example

Consider FooBook, a hypothetical example company which provides messaging services for conversations
between entities who use it.

For each conversation FooBook **MUST** decide whether to represent itself as a conversation
participant or as a non-participant. (Transparency of Participation)

If FooBook decides to represent itself as a non-participant, then it **MUST NOT** have any access to
PCASM. (Integrity of Participation / Non-Participation)

If FooBook decides to represent itself as a participant, then it **MUST NOT** have exceptional
access to PCASM, despite being the provider of the service - for instance via raw database access
or network sniffing. However it **MAY** participate in E2ESM conversations in a "normal" way, and
thereby have "normal" access to intra-conversation PCASM. (Integrity of Participation, Equality of
Participation)

FooBook **MAY** retain means to eject reported abusive participants from a conversation. (Decrease
in Closure of Participation)

FooBook **MUST NOT** retain means to forcibly insert new participants into a conversation. For
clarity: this specification does not recognise any notion of "atomic" exchange of one participant
with another, treating it as an ejection, followed by an "illegitimate" insertion. (Increase in
Closure of Participation)

FooBook **MUST** enable the user to observe and manage the complete state of their
[@TrustedComputingBase] with respect to their FooBook messaging services. (Management and
Visibility)

FooBook **MAY** treat conversation metadata as PCASM, but it **MUST** communicate to participants
whether it does, or does not.

# See Also

A different approach to defining (specifically) end-to-end encryption is discussed in
[@I-D.knodel-e2ee-definition].

# IANA Considerations

This document has no IANA actions.

# Security Considerations

This document is entirely composed of security considerations.

{backmatter}

<reference anchor="RoleOfTrust" target="https://www.repository.law.indiana.edu/fclj/vol63/iss2/3">
   <front>
      <title>The End-to-End Argument and Application Design: The Role of Trust</title>
      <author fullname="David D. Clark"></author>
      <author fullname="Marjory S. Blumenthal"></author>
      <date year="2011"></date>
   </front>
</reference>

<reference anchor="TrustedComputingBase" target="https://en.wikipedia.org/wiki/Trusted_computing_base">
   <front>
      <title>Trusted Computing Base</title>
      <author fullname="Wikipedia"></author>
      <date year="2021"></date>
   </front>
</reference>

<reference anchor="DualUse" target="https://en.wikipedia.org/wiki/Dual-use_technology">
   <front>
      <title>Dual-use technology</title>
      <author fullname="Wikipedia"></author>
      <date year="2021"></date>
   </front>
</reference>

<reference anchor="ExportControl" target="https://en.wikipedia.org/wiki/Export_of_cryptography_from_the_United_States#Cold_War_era">
   <front>
      <title>Export of cryptography from the United States</title>
      <author fullname="Wikipedia"></author>
      <date year="2021"></date>
   </front>
</reference>

<reference anchor="RicochetRefresh" target="https://www.ricochetrefresh.net">
   <front>
      <title>Ricochet Refresh</title>
      <author fullname="BlueprintForFreeSpeech"></author>
      <date year="2021"></date>
   </front>
</reference>
