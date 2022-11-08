<?xml version="1.0" encoding="utf-8"?>
<!-- name="GENERATOR" content="github.com/mmarkdown/mmark Mmark Markdown Processor - mmark.miek.nl" -->
<rfc version="3" ipr="trust200902" docName="draft-muffett-end-to-end-secure-messaging-04" submissionType="IETF" category="info" xml:lang="en" xmlns:xi="http://www.w3.org/2001/XInclude" indexInclude="true" consensus="true">

<front>
<title abbrev="e2esm">A 'Duck Test' for End-to-End Secure, Encrypted Messenger Software</title><seriesInfo value="draft-muffett-end-to-end-secure-messaging-04" stream="IETF" status="informational" name="Internet-Draft"></seriesInfo>
<author initials="A." surname="Muffett" fullname="Alec Muffett"><organization>Security Researcher</organization><address><postal><street></street>
</postal><email>alec.muffett@gmail.com</email>
</address></author><date/>
<area>Internet</area>
<workgroup>CFRG</workgroup>
<keyword>messaging</keyword>
<keyword>end to end</keyword>
<keyword>end to end encryption</keyword>
<keyword>end to end secure</keyword>
<keyword>end to end security</keyword>
<keyword>encryption</keyword>
<keyword>security</keyword>

<abstract>
<t>This internet-draft
describes a test
which <bcp14>MAY</bcp14> be used,
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
of messenger software.</t>
</abstract>

</front>

<middle>

<section anchor="introduction"><name>Introduction</name>

<section anchor="work-in-progress"><name>Work in Progress</name>
<t>This document is a complete rewrite from the ground up; if you are
interested in seeing contextual previous work, see the
<tt>draft-muffett-end-to-end-secure-messaging-04-abandoned</tt> series.</t>
</section>

<section anchor="why-cfrg"><name>Why CFRG?</name>
<t>The <eref target="https://datatracker.ietf.org/doc/charter-irtf-cfrg/01/">IRTF CFRG charter</eref>
says:</t>
<blockquote><t>The CFRG serves as a bridge between theory and practice, bringing
new cryptographic techniques to the Internet community and promoting
an understanding of the use and applicability of these mechanisms
via Informational RFCs ... Our goal is to provide a forum for
discussing and analyzing general cryptographic aspects of security
protocols, and to offer guidance on the use of emerging mechanisms
and new uses of existing mechanisms.</t>
</blockquote><t>This internet-draft proposes an informational RFC which assists the
discussion and analysis of the general cryptographic aspects of
end-to-end secure, encrypted messenger software, providing
guidance on the use - especially choice - of such software.</t>
<t>Hence this internet-draft is submitted to CFRG.</t>
</section>

<section anchor="why-a-duck-test"><name>Why a 'Duck Test'?</name>
<t>There are efforts afoot to help a user determine whether some software
'looks' like end-to-end secure, encrypted messenger software.  Such
determinations may require considerable information, discussion of
nuance, and application of considerable judgement.</t>
<t>By contrast, this internet-draft specifies a simple 'falsifiability'
test using which a person may establish whether some software does not
'quack' in the way that end-to-end secure, encrypted messenger
software is commonly expected.</t>
<t>The described test is not intended to be complete; additional tests,
checks and obligations may be brought to bear by people who wish to
determine whether some software also offers other characteristics such
as 'anonymity', or broader forms of 'metadata privacy'.</t>
<t>If some software fails to satisfy the duck test, it will be deemed
only to have failed the duck test, and nothing more excepting that by
failing the duck test we can clearly state that the software fails to
exhibit some commonly expected characteristics of end-to-end secure,
encrypted messenger software.</t>
</section>

<section anchor="why-only-messenger-software"><name>Why only 'Messenger Software'?</name>
<t>This internet-draft is written for the test to be applied to
end-to-end secure, encrypted messenger software.</t>
<t>It may be that the concepts describe could be more broadly applied -
for instance to other encrypted transport protocols - but the scale of
adoption, invention, and discussion of messenger software demands a
focused document which deals exclusively with the particular use-case,
common features and foibles of end-to-end secure, encrypted messenger
software.</t>
<t>Future documents may explore the aspects of this duck test which are
well-suited for other purposes.</t>
</section>
</section>

<section anchor="the-field-model"><name>The 'Field Model'</name>
<t>Several key sources on encryption and privacy (TK, TK, TK) observe
using similar terms that in pre-industrial-revolution societies:</t>
<blockquote><t>All that was once necessary for two or more people to have a private
conversation was for them to walk into a field - away from
eavesdroppers - where they could simply talk...</t>
</blockquote><t>We refer to this as the 'field model' of secure communication, and
observe several characteristics from which we derive the duck test:</t>

<ul>
<li><t>There is a 'speaker', who will be the 'first party', named 'Alice'
('A')</t>
</li>
<li><t>There are 'listeners', who will be 'second parties', named 'Bob'
('B'), 'Carol' ('C'), 'Dave' ('D'), etc...</t>
</li>
<li><t>The speaker, and the listeners which are visible to the speaker as
standing 'within earshot' alongside her in the field, comprise the
'participants' for a given message as uttered by the speaker</t>
</li>
<li><t>Each message may have different 'participation', as Bob, Carol, and
Dave variously arrive and depart, all being seen by Alice</t>
</li>
<li><t>There is a 'field' or 'platform' ('P') for the conversation, acting
as a 'third party', analogous to 'WhatsApp' or 'Signal' or other
end-to-end secure, encrypted messenger software; the third party is
inert ground and is incapable of comprehension of the conversation</t>
</li>
<li><t>All other entities outside of these three sets, are 'fourth parties'</t>
</li>
</ul>

<section anchor="the-duck-test"><name>The 'Duck Test'</name>
<t>From the above we may define the duck test:</t>
<blockquote><t>Subject to a fixed set of conditions and exceptions: for any given
message, if <strong>any</strong> entity that was not a 'participant' for that
message <strong>may</strong> use partial or complete knowledge of the platform -
including logs of past-sent and future-sent messages - to learn
<strong>some</strong> information regarding that message's content, then the
platform fails to satisfy the duck test</t>
</blockquote></section>

<section anchor="learn-some-information"><name>'Learn Some Information'?</name>
<t>The duck test pivots upon an entity which was not first- or
second-party to a message, &quot;learning some information&quot; about that
message.  How much is &quot;some information&quot;?</t>
<blockquote><t>For the duck test we define &quot;learning about a single bit of message
content to greater than 50% certainty&quot; as being sufficient
information to have learned so as to cause failure of the test</t>
</blockquote><t>This condition extends beyond message content into some aspects of
sensitive metadata - for instance zero (or very short) message lengths
can leak single bits of message content to greater than 50% certainty,
and therefore must be mitigated.</t>
</section>

<section anchor="conditions-and-exceptions"><name>'Conditions and Exceptions'</name>
<t>...</t>
</section>
</section>

</middle>

</rfc>
