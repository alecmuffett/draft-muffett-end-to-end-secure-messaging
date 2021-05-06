%%%
title = "Functional Definition of End-to-End Secure Messaging"
abbrev = "e2esm"
category = "info"
docName = "apparently this tool demands a doc name but does not use it"
ipr ="trust200902"
area = "Internet"
workgroup = "ietf-mls"
keyword = ["messaging", "end to end", "encryption"]

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

This document defines End-to-End Secure Messaging in terms of the behaviours that **MUST** be
exhibited by software which claims to implement it, or which claims to implement that subset which
is known as End-to-End Encrypted Messaging.

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

Therefore we describe E2ESM in terms of functional outcomes of the messenger rather than in terms of
implementation goals and technologies.

## Notational Conventions

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT",
"RECOMMENDED", "NOT RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as
described in BCP 14 [@RFC2119] [@RFC8174] when, and only when, they appear in all capitals, as shown
here.

# Requirements for an End-to-End Secure Messenger

Software which functions as an End-to-End Secure Messenger **MUST** satisfy the following
principles, and **MUST** satisfy these principles in respect of the provided definitions for all
forms of communication and data-sharing that the software offers, otherwise it is not an End-to-End
Secure Messenger.

# Principles

For a series of one or more "messages" each which are comprised of "plaintext content and sensitive
metadata" (PCASM) and which constitute a "conversation" amongst a set of "participants", to provide
E2ESM will require:

## Equality of Participation

All participants **MUST** be peers who **MUST** have equal access to any given message's PCASM.

## Transparency of Participation

The existence of all current conversation participants **MUST** be visible at all times to all
current conversation participants.

## Integrity of Participation

The PCASM of any given message **MUST** only be available to the fixed set of conversation
participants from whom, to whom, and at the time when it was sent.

### Non-Participation

It follows that for any given message, all entities that exist outside of the above-defined set are
"non-participants" in respect of that message.

## Closure of Conversation

The set of participants in a conversation **SHALL NOT** be increased except by the intentional
action of one or more existing participants.

## Management and Visibility of Participant Clients & Devices

E2ESM solutions **MUST** provide each participant entity with means to review or revoke access for
clients or devices that can access future PCASM.

E2ESM solutions **MUST** provide each participant entity with notifications or complete logs of
changes to the set of clients or devices that can or could access message PCASM.

# Definitions

These principles **MUST** be measured with respect to the following definitions:

## Participant

A participant is any entity - human, machine, software bot, escrow agent, or otherwise, that is
bounded by the extent of that entity's [@TrustedComputingBase].

## Conversation

A conversation is a sequence of one or more messages over a period of time amongst a constant or
evolving set of participants.

## Plaintext Content and Sensitive Metadata (PCASM)

The PCASM of a message is defined as: 1 or more bits of information regarding any or all of:

1.  the plaintext message content (the "content")

2.  the precise size of the content

3.  any metadata which may describe the thematic nature of the content

### Examples of PCASM

Information which would be PCASM would include, non-exclusively:

1.   The content is "Hello, world."

2.   The content is definitely 13 bytes long

3.   The content starts with the word "Hello"

4.   The content contains the substring "ello"

5.   The content does not contain the word "Goodbye"

6.   The content contains a substring from amongst the following set: ...

7.   The content does not contain a substring from amongst the following set: ...

8.   The top bit of the first byte of the content in ASCII encoding, is zero

9.   The MD5 hash of the content is 080aef839b95facf73ec599375e92d47

10.  The hash of the content exists amongst the following set of hashes: ...

11.  The hash of the content does not exist amongst the following set of hashes: ...

12.  The content was matched by a machine-learning classifier with the following training set: ...

### Examples of non-PCASM

Information which would not be PCASM would include, non-exclusively:

1.  The content is sent from Alice

2.  The content is sent to Bob

3.  The content is between 1 and 16 bytes long

4.  The content was sent at the following date and time: ...

5.  The content was sent from the following IP address: ...

6.  The content was sent from the following geolocation: ...

7.  The content was composed using the following platform: ...

There is obvious discussion to be had regarding "how fuzzy a content-size is fuzzy enough?"

If the size of a message's content is at all observable by a non-participant, it would appear
reasonable where a block cipher is used to implement E2ESM, to avoid visibly surfacing the
underlying content size as a number that is any more specific or precise than an integer multiple of
the underlying cipher block size would be.

Stream cipher "fuzziness" adequacy is currently undefined in this draft.

## Backdoor

Discussions of E2ESM frequently reference the concept of "backdoors". We propose a standard
definition:

A backdoor is any intentional or unintentional mechanism, in respect of a given message and that
message's set of participants where some PCASM of that message **MAY** become available to a
non-participant without the intentional action of a participant.

# Scope of a Participant in E2ESM

The term "participant" in this document exists to supercede the more vague notion of "end" in the
phrase "end-to-end".

Participants are defined in terms of an entity's [@TrustedComputingBase] to acknowledge that an
entity **MAY** legitimately store, forward, or access messages by means that are outside of the
messenger software.

For example: if a participant accesses their E2ESM messenger via remote desktop software, and their
RDP session is hijacked by a third party; of if they back-up their messages in cleartext to cloud
storage leading somehow to data exfiltration, neither of these would be a failure of E2ESM.

This would be a failure of the participant's [@TrustedComputingBase].

# Rationale

Consider FooBook, a company which provides messaging services for conversations between entities who
use it.

FooBook **MUST** decide whether to represent itself as a conversation participant or as a
non-participant. (Transparency of Participation)

If FooBook decides to represent itself as a conversation non-participant, then it **MUST NOT** have
any access to PCASM. (Integrity of Participation / Non-Participation)

If FooBook decides to represent itself as a conversation participant, then it **MUST NOT** have
privileged access to PCASM, for instance via direct database access, but it **MAY** have "normal"
access to PCASM of conversations where it is a participant. (Integrity of Participation, Equality of
Participation)

FooBook **MAY** retain means to eject reported abusive participants from a conversation. (Decrease
in Closure of Participation)

FooBook **MUST NOT** retain means to forcibly insert new participants into a conversation. For
clarity: this specification does not recognise any notion of "atomic" exchange of one particpant
with another, treating it as an ejection, followed by an "illegitimate" insertion. (Increase in
Closure of Participation)

FooBook **MUST** enable the user to observe and manage the complete state of their
[@TrustedComputingBase] with respect to their FooBook messaging services. (Management and
Visibility)

# See Also

A different approach to defining (specifically) end-to-end encryption is being discussed in
[@I-D.knodel-e2ee-definition].

# IANA Considerations

This document has no IANA actions.

# Security Considerations

This document is entirely comprised of security considerations.

{backmatter}

<reference anchor="TrustedComputingBase" target="https://en.wikipedia.org/wiki/Trusted_computing_base">
   <front>
      <title>Trusted Computing Base</title>
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
