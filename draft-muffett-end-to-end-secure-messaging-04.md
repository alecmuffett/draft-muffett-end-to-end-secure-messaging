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

## Why CFRG?

The IRTF CFRG charter says:
https://datatracker.ietf.org/doc/charter-irtf-cfrg/01/

"The CFRG serves as a bridge between theory and practice, bringing new
cryptographic techniques to the Internet community and promoting an
understanding of the use and applicability of these mechanisms via
Informational RFCs ... Our goal is to provide a forum for discussing
and analyzing general cryptographic aspects of security protocols, and
to offer guidance on the use of emerging mechanisms and new uses of
existing mechanisms."

This internet-draft proposes an informational RFC which assists the
discussion and analysis of the general cryptographic aspects of
end-to-end secure, encrypted messenger software, providing
guidance on the use - especially choice - of such software.

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

# The Field Model

...
