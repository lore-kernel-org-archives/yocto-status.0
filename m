Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 231CACD343E
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 14:41:11 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.25086.1725374464539148705
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 03 Sep 2024 07:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZGmS4Gvy;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7c3ebba7fbbso3763081a12.1;
        Tue, 03 Sep 2024 07:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725374463; x=1725979263; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OZZkeuJv8hpiWpnvQTzKgsmi1GAuBnN3X4KR6TAOSFA=;
        b=ZGmS4GvypuV9AbM/VQ+pdPOaD6faX1jPd5GCGVHvO+SHf5wlKjdinRdPPhCOedETev
         FSDpCjGlcG80fPjmdszv7cagUFg3uYajtqR4FahdDvIZSDyxrsK/ZoDe/hoTDnxTpd5T
         aV7s0ncSbgUA9kBwcsqitbd8ZI7kLMVz/lUMpGyvnPrDL7rdZ3y3PV//1qTuxUNN/qxT
         ugAhU90m+euQ2wP7T0EI/3xDWjPrxirclZHue1xUMuO53/7LNKQcX/2T6B29qSCmy6qM
         BrZrNqvull1qYhSgCPIwYirx8Fye2qxJZ2htJ1w1xhJbeh7iutnzocgcDwYIqwsFr8Cd
         9TPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725374463; x=1725979263;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OZZkeuJv8hpiWpnvQTzKgsmi1GAuBnN3X4KR6TAOSFA=;
        b=qDqJstnvk8DSD25FUUUpRts2OrCUwpAwnd9gu0+/NWofPIP/qozDKFXUHejAyOywaA
         9AVbTSFmJlyYEz63dM9AOxrmcF6E/C4mURMY8Ym2NCyKJ+KCKzORySF4asfaVynsIviB
         TpmRCbWCDwVJgbOabkZlG7w3SENwy+wugsiKxvXDLQJ6dtFT86KRMOffQGu7fzPZLQdN
         QVOKc4ctkNBUd2oIrlStJiDDnYJ9BvcVH8Cs/lL9emLX2RQZ6sV72eNNjgDoG2aV4ulg
         /oDCtCTozvkzdTneTO29ZZ7Bb5tdpDppCKAW12FbRLFoso3yMCWT0GaVuuKfV59IY0ej
         MDfg==
X-Forwarded-Encrypted: i=1; AJvYcCU9bDLQWTPnS6mpRvkdyjppO2NDQ/ytvpnA/ZSLH14vHu+IUTUXgQT3hIbgOnaT3AfLOZViR5CZFxXx0nk=@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwuBuHzqbwrHCGtbGnaIIxrosVmUcqrfKGfi8CJGjQ5bZmlfukV
	/vFqfO4c+/Xh7j1guQizNK2NfkCYX7NLi1cR3WW0n2renePC034g2TmHHizAaST5tgTZIWb0Cce
	pSCRCStwEm403Y8tpB+KEsWK8P8Aq5TYa
X-Google-Smtp-Source: AGHT+IEgNr8mckLoKkAFrBUvrVYmF3kWlYm8CCJ8I3iIh/lxnUXVtSRtsPhGUEu+z6F+8M8OXUz4NccVmDu6n3X07gM=
X-Received: by 2002:a17:903:28f:b0:202:4d05:a245 with SMTP id
 d9443c01a7336-20546601577mr138201485ad.29.1725374463346; Tue, 03 Sep 2024
 07:41:03 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 3 Sep 2024 07:40:52 -0700
Message-ID: <CAK5yBb8av+tXyER+BGWYUhhduY7zhDE8WE_vTEhOGhT49qi5BA@mail.gmail.com>
Subject: Yocto Project Status 3 Sept. 2024 (WW36)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000fe0e880621380be4"
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Tue, 03 Sep 2024 14:41:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/25

--000000000000fe0e880621380be4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 5.1 Feature Freeze and Bug Fixing

Next Deadline: YP 5.1 M4 Build 30 Sept. 2024

Next Team Meetings:

   -

   Bug Triage meeting Thursday Sept. 5th at 7:30 am PST (
   https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
   -

   Weekly Project Engineering Sync Tuesday Sept. 3rd at 8 am PST (
   https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
   <https://zoom.us/j/990892712>
   -

   Twitch -  See https://www.twitch.tv/theyoctojester


Key Status/Updates:

   -

   YP 5.1 M3 is in QA
   -

   We are now at feature freeze and working on bug fixing for the final 5.1
   release builds
   -

   Some limited recipe upgrades may be taken in M4 depending on their value
   of bug fixes vs breaking changes/features.
   -

   Fixes to make ERROR_QA only rebuild tasks it directly affects were
   merged, which will improve sstate reuse from the project servers
   significantly.
   -

   There is discussion around configuration file markup/syntax related to
   fragment management on the architecture list, targeting 5.2.
   -

   Upcoming Event:  For those attending OSS EU in Vienna, Yocto Project
   Developer Day Sept. 19th 9am-5pm.

Register here:
https://events.linuxfoundation.org/open-source-summit-europe/features/co-lo=
cated-events/#yocto-project-developer-day
<https://czw--04.na1.hs-sales-engage.com/Ctc/RI+23284/cZw--04/JjT4YGXpW50kH=
_H6lZ3mYW2zGP2g4RYwHlW4jl_sH82F1mBW75wf4S5fQSGwW3q-h137pS86vVlHM703t9PdRW6V=
fJXS6kJbk-VWLZV53p2BqSW3dkpTN4Wc9tYN8d4d7CsmmQxW3FmT508QTKq_W3V5Mp_7kTnQNW7=
xM1Xl68DVpQW6pxfq05vlySZW3YVFPs32PrWcW20rDWR8-Y1-cW6wQgz783gRDGW3DBJfc3v8KB=
0W1tJ4qd7-_qs-VBQjVz98qlrBW273HcF8lvxs-W6br4Hp8pCKLpW8vscLk13k-26W3BStmd2-h=
wGKN73nChGP4XnJN7NJkHZfJ3KBW2rWQPL67szjbW2LnfX34HKpDXW6PFDTz1wv6WFTfqbK6x5N=
4yW4PCDQB1ZGz88VqC4Lq632tJGW1MSmXh35d3k2f5D-ZFs04>

Ways to contribute:

   -

   As people are likely aware, the project has a number of components which
   are either unmaintained, or have people with little to no time trying to
   keep them alive. These components include: devtool, toaster, wic, oeqa,
   autobuilder, CROPs containers, pseudo and more. Many have open bugs. Hel=
p
   is welcome in trying to better look after these components!
   -

   There is an issue open upstream with the openssl project related to
   making path relocation of openssl easier (as used in our buildtools tarb=
all
   and SDK). We=E2=80=99d love assistance in moving this forward and gettin=
g some kind
   of upstream feature merged to make this easier:
   https://github.com/openssl/openssl/pull/19260
   -

   There are bugs identified as possible for newcomers to the project:
   https://wiki.yoctoproject.org/wiki/Newcomers
   -

   There are bugs that are currently unassigned for YP 5.1. See:
   https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium+_5.1_Unassigned_Enh=
ancements/Bugs
   -

   We=E2=80=99d welcome new maintainers for recipes in OE-Core. Please see =
the list
   at:
   http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/include/=
maintainers.inc
   and discuss with the existing maintainer, or ask on the OE-Core mailing
   list. We will likely move a chunk of these to =E2=80=9CUnassigned=E2=80=
=9D soon to help
   facilitate this.
   -

   Help is very much welcome in trying to resolve our autobuilder
   intermittent issues. You can see the list of failures we=E2=80=99re cont=
inuing to
   see by searching for the =E2=80=9CAB-INT=E2=80=9D tag in bugzilla:
   https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DAB-INT.
   -

   Help us resolve CVE issues: CVE metrics
   <https://autobuilder.yocto.io/pub/non-release/patchmetrics/>
   -

   We have a growing number of bugs in bugzilla, any help with them is
   appreciated.
   -

   Regarding bugs, even if you can=E2=80=99t fix a bug, submitting a failin=
g test
   case that can reproduce the issue significantly improves the chances it
   might get fixed.
   -

   Further help on optimizing build disk usage would be most welcome.


Tracking Metrics:

   -

   WDD 2764 (last week 2759) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   OE-Core/Poky Patch Metrics
   -

      Total patches found: 1057 (last week 1070)
      -

      Patches in the Pending State: 176 (17%) [last week 177 (17%)]
      -

      https://autobuilder.yocto.io/pub/non-release/patc
      <https://autobuilder.yocto.io/pub/non-release/patchmetrics/>%hmetrics=
/
      <https://autobuilder.yocto.io/pub/non-release/patchmetrics/>


YP 5.1 Milestone Dates:

   -

   YP 5.1 M3 in QA
   -

   YP 5.1 M4 Build date  2024-09-30
   -

   YP 5.1 M4 Release date 2024-10-25


Upcoming dot releases:

   -

   YP 4.0.21 Build Date 2024-09-09
   -

   YP 4.0.21 Release Date 2024-09-20
   -

   YP 5.0.4 Build Date 2024-09-23
   -

   YP 5.0.4 Release Date 2024-10-04
   -

   YP 4.0.22 Build Date 2024-10-14
   -

   YP 4.0.22 Release Date 2024-10-25
   -

   YP 5.0.5 Build Date 2024-11-11
   -

   YP 5.0.5 Release Date 2024-11-22
   -

   YP 4.0.23 Build Date 2024-11-18
   -

   YP 4.0.23 Release Date 2024-11-29


The Yocto Project=E2=80=99s technical governance is through its Technical S=
teering
Committee, more information is available at:

https://wiki.yoctoproject.org/wiki/TSC

The Status reports are now stored on the wiki at:
https://wiki.yoctoproject.org/wiki/Weekly_Status

[If anyone has suggestions for other information you=E2=80=99d like to see =
on this
weekly status update, let us know!]

Thanks,



*Stephen K. Jolley*

*Yocto Project Program Manager*

(    *Cell*:                (208) 244-4460

* *Email*:                 *s
<stephen.k.jolley@intel.com>jolley.yp.pm@gmail.com <jolley.yp.pm@gmail.com>=
*

--000000000000fe0e880621380be4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-b502970b-7fff-5ee8-4d=
59-a1d3818fb6f9"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;font-variant-alternates:normal;vertical-alig=
n:baseline">Current Dev Position: YP 5.1 Feature Freeze and Bug Fixing</spa=
n></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline"=
>Next Deadline: YP 5.1 M4 Build 30 Sept. 2024</span></p><br><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;vertical-align:baseline">Next Team Meetings:<=
/span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" st=
yle=3D"list-style-type:disc;font-size:9.5pt;font-family:Arial,sans-serif;co=
lor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:b=
aseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11p=
t;background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;font-variant-alternates:normal;vertical-align:baseline">Bug =
Triage meeting Thursday Sept. 5th at 7:30 am PST (</span><a href=3D"https:/=
/zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09" style=3D"text-=
decoration-line:none"><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varia=
nt-alternates:normal;text-decoration-line:underline;vertical-align:baseline=
">https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</span>=
</a><span style=3D"font-size:11pt;background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norm=
al;vertical-align:baseline">)</span></p></li><li dir=3D"ltr" style=3D"list-=
style-type:disc;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;font-variant-alternates:normal;vertical-align:baseline;whit=
e-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-variant-alternates:normal;vertical-align:baseline">Weekly Project E=
ngineering Sync Tuesday Sept. 3rd at 8 am PST (</span><a href=3D"https://zo=
om.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09" style=3D"text-dec=
oration-line:none"><span style=3D"font-size:11pt;background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-=
alternates:normal;text-decoration-line:underline;vertical-align:baseline">h=
ttps://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</span></a=
><a href=3D"https://zoom.us/j/990892712" style=3D"text-decoration-line:none=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;text-decoration-line:underline;vertical-align:baseline">)</span></a></p></=
li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:9.5pt;font-famil=
y:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:no=
rmal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span s=
tyle=3D"font-size:11pt;background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical=
-align:baseline">Twitch -=C2=A0 See </span><a href=3D"https://www.twitch.tv=
/theyoctojester" style=3D"text-decoration-line:none"><span style=3D"font-si=
ze:11pt;background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-variant-alternates:normal;text-decoration-line:un=
derline;vertical-align:baseline">https://www.twitch.tv/theyoctojester</span=
></a><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:nor=
mal;vertical-align:baseline">=C2=A0</span></p></li></ul><br><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;vertical-align:baseline">Key Status/Updates:<=
/span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" st=
yle=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;col=
or:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:ba=
seline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top=
:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt=
;background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;font-variant-alternates:normal;vertical-align:baseline">YP 5.=
1 M3 is in QA</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;=
font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;vertical-align:baseline;white-space:pre"><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">We are now at feature freeze and =
working on bug fixing for the final 5.1 release builds</span></p></li><li d=
ir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;font-variant-alternates:normal;vert=
ical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"f=
ont-size:11pt;background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:ba=
seline">Some limited recipe upgrades may be taken in M4 depending on their =
value of bug fixes vs breaking changes/features.</span></p></li><li dir=3D"=
ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-se=
rif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-a=
lign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-si=
ze:11pt;background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline=
">Fixes to make ERROR_QA only rebuild tasks it directly affects were merged=
, which will improve sstate reuse from the project servers significantly.</=
span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;=
font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alt=
ernates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentatio=
n"><span style=3D"font-size:11pt;background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norma=
l;vertical-align:baseline">There is discussion around configuration file ma=
rkup/syntax related to fragment management on the architecture list, target=
ing 5.2.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-=
size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-v=
ariant-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D=
"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"p=
resentation"><span style=3D"font-size:11pt;background-color:transparent;fon=
t-weight:700;font-variant-numeric:normal;font-variant-east-asian:normal;fon=
t-variant-alternates:normal;vertical-align:baseline">Upcoming Event: </span=
><span style=3D"font-size:11pt;background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;=
vertical-align:baseline">=C2=A0For those attending OSS EU in Vienna, Yocto =
Project Developer Day Sept. 19th 9am-5pm.=C2=A0=C2=A0</span></p></li></ul><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-left:36pt;margin-top:0pt;mar=
gin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;=
color:rgb(0,0,0);background-color:transparent;font-weight:700;font-variant-=
numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norma=
l;vertical-align:baseline">Register here</span><span style=3D"font-size:11p=
t;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">:</span><a href=3D"https://czw--0=
4.na1.hs-sales-engage.com/Ctc/RI+23284/cZw--04/JjT4YGXpW50kH_H6lZ3mYW2zGP2g=
4RYwHlW4jl_sH82F1mBW75wf4S5fQSGwW3q-h137pS86vVlHM703t9PdRW6VfJXS6kJbk-VWLZV=
53p2BqSW3dkpTN4Wc9tYN8d4d7CsmmQxW3FmT508QTKq_W3V5Mp_7kTnQNW7xM1Xl68DVpQW6px=
fq05vlySZW3YVFPs32PrWcW20rDWR8-Y1-cW6wQgz783gRDGW3DBJfc3v8KB0W1tJ4qd7-_qs-V=
BQjVz98qlrBW273HcF8lvxs-W6br4Hp8pCKLpW8vscLk13k-26W3BStmd2-hwGKN73nChGP4XnJ=
N7NJkHZfJ3KBW2rWQPL67szjbW2LnfX34HKpDXW6PFDTz1wv6WFTfqbK6x5N4yW4PCDQB1ZGz88=
VqC4Lq632tJGW1MSmXh35d3k2f5D-ZFs04" style=3D"text-decoration-line:none"><sp=
an style=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:tr=
ansparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-v=
ariant-alternates:normal;text-decoration-line:underline;vertical-align:base=
line"> https://events.linuxfoundation.org/open-source-summit-europe/feature=
s/co-located-events/#yocto-project-developer-day</span></a></p><br><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;font-variant-alternates:normal;vertical-align:baseline">Ways to con=
tribute:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;font-variant-alternates:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line">As people are likely aware, the project has a number of components wh=
ich are either unmaintained, or have people with little to no time trying t=
o keep them alive. These components include: devtool, toaster, wic, oeqa, a=
utobuilder, CROPs containers, pseudo and more. Many have open bugs. Help is=
 welcome in trying to better look after these components!</span></p></li><l=
i dir=3D"ltr" style=3D"list-style-type:disc;font-size:9.5pt;font-family:Ari=
al,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;=
vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline">There is an issue open upstream with the openssl project relat=
ed to making path relocation of openssl easier (as used in our buildtools t=
arball and SDK). We=E2=80=99d love assistance in moving this forward and ge=
tting some kind of upstream feature merged to make this easier: </span><a h=
ref=3D"https://github.com/openssl/openssl/pull/19260" style=3D"text-decorat=
ion-line:none"><span style=3D"font-size:11pt;background-color:transparent;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alte=
rnates:normal;text-decoration-line:underline;vertical-align:baseline">https=
://github.com/openssl/openssl/pull/19260</span></a></p></li><li dir=3D"ltr"=
 style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;=
color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-variant-alternates:normal;vertical-align=
:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;vertical-align:baseline">Th=
ere are bugs identified as possible for newcomers to the project: </span><a=
 href=3D"https://wiki.yoctoproject.org/wiki/Newcomers" style=3D"text-decora=
tion-line:none"><span style=3D"font-size:11pt;background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alt=
ernates:normal;text-decoration-line:underline;vertical-align:baseline">http=
s://wiki.yoctoproject.org/wiki/Newcomers</span></a></p></li><li dir=3D"ltr"=
 style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;=
color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-variant-alternates:normal;vertical-align=
:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;vertical-align:baseline">Th=
ere are bugs that are currently unassigned for YP 5.1. See: </span><a href=
=3D"https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium+_5.1_Unassigned_En=
hancements/Bugs" style=3D"text-decoration-line:none"><span style=3D"font-si=
ze:11pt;background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-variant-alternates:normal;text-decoration-line:un=
derline;vertical-align:baseline">https://wiki.yoctoproject.org/wiki/Bug_Tri=
age#Medium+_5.1_Unassigned_Enhancements/Bugs</span></a></p></li><li dir=3D"=
ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-se=
rif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-a=
lign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-si=
ze:11pt;background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline=
">We=E2=80=99d welcome new maintainers for recipes in OE-Core. Please see t=
he list at: </span><a href=3D"http://git.yoctoproject.org/cgit.cgi/poky/tre=
e/meta/conf/distro/include/maintainers.inc" style=3D"text-decoration-line:n=
one"><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:nor=
mal;text-decoration-line:underline;vertical-align:baseline">http://git.yoct=
oproject.org/cgit.cgi/poky/tree/meta/conf/distro/include/maintainers.inc</s=
pan></a><span style=3D"font-size:11pt;background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:=
normal;vertical-align:baseline"> and discuss with the existing maintainer, =
or ask on the OE-Core mailing list. We will likely move a chunk of these to=
 =E2=80=9CUnassigned=E2=80=9D soon to help facilitate this.</span></p></li>=
<li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ar=
ial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline">Help is very much welcome in trying to resolve our autobuilder=
 intermittent issues. You can see the list of failures we=E2=80=99re contin=
uing to see by searching for the =E2=80=9CAB-INT=E2=80=9D tag in bugzilla: =
</span><a href=3D"https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=
=3DAB-INT" style=3D"text-decoration-line:none"><span style=3D"font-size:11p=
t;background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;font-variant-alternates:normal;text-decoration-line:underlin=
e;vertical-align:baseline">https://bugzilla.yoctoproject.org/buglist.cgi?qu=
icksearch=3DAB-INT</span></a><span style=3D"font-size:11pt;background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fon=
t-variant-alternates:normal;vertical-align:baseline">.</span></p></li><li d=
ir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;font-variant-alternates:normal;vert=
ical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"f=
ont-size:11pt;background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:ba=
seline">Help us resolve CVE issues: </span><a href=3D"https://autobuilder.y=
octo.io/pub/non-release/patchmetrics/" style=3D"text-decoration-line:none">=
<span style=3D"font-size:11pt;background-color:transparent;font-variant-num=
eric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;t=
ext-decoration-line:underline;vertical-align:baseline">CVE metrics</span></=
a><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;vertical-align:baseline">=C2=A0</span></p></li><li dir=3D"ltr" style=3D"li=
st-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,=
0,0);background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-variant-alternates:normal;vertical-align:baseline;wh=
ite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;font-variant-alternates:normal;vertical-align:baseline">We have a grow=
ing number of bugs in bugzilla, any help with them is appreciated.</span></=
p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates=
:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><spa=
n style=3D"font-size:11pt;background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;font-variant-alternates:normal;verti=
cal-align:baseline">Regarding bugs, even if you can=E2=80=99t fix a bug, su=
bmitting a failing test case that can reproduce the issue significantly imp=
roves the chances it might get fixed.</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;font-variant-alternates:normal;vertical-align:basel=
ine;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;font-variant-alternates:normal;vertical-align:baseline">Further =
help on optimizing build disk usage would be most welcome.</span></p></li><=
/ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rg=
b(0,0,0);background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;font-variant-alternates:normal;vertical-align:baselin=
e">Tracking Metrics:</span></p><ul style=3D"margin-top:0px;margin-bottom:0p=
x"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family=
:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:nor=
mal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span st=
yle=3D"font-size:11pt;background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-=
align:baseline">WDD 2764 (last week 2759) </span><span style=3D"font-size:1=
1pt;font-family:Consolas,sans-serif;background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:no=
rmal;vertical-align:baseline">(</span><a href=3D"https://wiki.yoctoproject.=
org/charts/combo.html" style=3D"text-decoration-line:none"><span style=3D"f=
ont-size:11pt;background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-variant-alternates:normal;text-decoration-l=
ine:underline;vertical-align:baseline">https://wiki.yoctoproject.org/charts=
/combo.html</span></a><span style=3D"font-size:11pt;font-family:Consolas,sa=
ns-serif;background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;font-variant-alternates:normal;vertical-align:baselin=
e">)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size=
:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-va=
riant-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pr=
esentation"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;font-variant-alternates:normal;vertical-align:baseline">OE-Core/Po=
ky Patch Metrics</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0=
px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-fam=
ily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:=
normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span=
 style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;font-variant-alternates:normal;vertic=
al-align:baseline">Total patches found: 1057 (last week 1070)</span></p></l=
i><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-famil=
y:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:no=
rmal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span s=
tyle=3D"font-size:11pt;background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical=
-align:baseline">Patches in the Pending State: 176 (17%) [last week 177 (17=
%)]</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-siz=
e:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-v=
ariant-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D=
"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"p=
resentation"><a href=3D"https://autobuilder.yocto.io/pub/non-release/patchm=
etrics/" style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;=
font-family:Arial,sans-serif;background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;te=
xt-decoration-line:underline;vertical-align:baseline">https://autobuilder.y=
octo.io/pub/non-release/patc</span></a><span style=3D"font-size:11pt;font-f=
amily:Arial,sans-serif;background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical=
-align:baseline">%</span><a href=3D"https://autobuilder.yocto.io/pub/non-re=
lease/patchmetrics/" style=3D"text-decoration-line:none"><span style=3D"fon=
t-size:11pt;font-family:Arial,sans-serif;background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;font-variant-alternat=
es:normal;text-decoration-line:underline;vertical-align:baseline">hmetrics/=
</span></a></p></li></ul></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family=
:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:nor=
mal;vertical-align:baseline">YP 5.1 Milestone Dates:</span></p><ul style=3D=
"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type=
:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;font-variant-alternates:normal;vertical-align:baseline;white-space:pre=
"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-var=
iant-alternates:normal;vertical-align:baseline">YP 5.1 M3 in QA</span></p><=
/li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-famil=
y:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:no=
rmal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span s=
tyle=3D"font-size:11pt;background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical=
-align:baseline">YP 5.1 M4 Build date=C2=A0 2024-09-30</span></p></li><li d=
ir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;font-variant-alternates:normal;vert=
ical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"f=
ont-size:11pt;background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:ba=
seline">YP 5.1 M4 Release date 2024-10-25</span></p></li></ul><br><p dir=3D=
"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span sty=
le=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;font-variant-alternates:normal;vertical-align:baseline">Upcoming dot r=
eleases:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;font-variant-alternates:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line">YP 4.0.21 Build Date 2024-09-09</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;font-variant-alternates:normal;vertical-align:basel=
ine;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;font-variant-alternates:normal;vertical-align:baseline">YP 4.0.2=
1 Release Date 2024-09-20</span></p></li><li dir=3D"ltr" style=3D"list-styl=
e-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;font-variant-alternates:normal;vertical-align:baseline;white-spa=
ce:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fo=
nt-variant-alternates:normal;vertical-align:baseline">YP 5.0.4 Build Date 2=
024-09-23</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font=
-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-=
variant-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">YP 5.0.4 Release Date 2024-10-04<=
/span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt=
;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent=
;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-al=
ternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentati=
on"><span style=3D"font-size:11pt;background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norm=
al;vertical-align:baseline">YP 4.0.22 Build Date 2024-10-14</span></p></li>=
<li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ar=
ial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline">YP 4.0.22 Release Date 2024-10-25</span></p></li><li dir=3D"lt=
r" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-seri=
f;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size=
:11pt;background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline">=
YP 5.0.5 Build Date 2024-11-11</span></p></li><li dir=3D"ltr" style=3D"list=
-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;font-variant-alternates:normal;vertical-align:baseline;whit=
e-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-variant-alternates:normal;vertical-align:baseline">YP 5.0.5 Release=
 Date 2024-11-22</span></p></li><li dir=3D"ltr" style=3D"list-style-type:di=
sc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;font-variant-alternates:normal;vertical-align:baseline;white-space:pre"><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" r=
ole=3D"presentation"><span style=3D"font-size:11pt;background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varian=
t-alternates:normal;vertical-align:baseline">YP 4.0.23 Build Date 2024-11-1=
8</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11=
pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-=
alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presenta=
tion"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:no=
rmal;vertical-align:baseline">YP 4.0.23 Release Date 2024-11-29</span></p><=
/li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;col=
or:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:ba=
seline">The Yocto Project=E2=80=99s technical governance is through its Tec=
hnical Steering Committee, more information is available at:</span></p><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><a h=
ref=3D"https://wiki.yoctoproject.org/wiki/TSC" style=3D"text-decoration-lin=
e:none"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;font-variant-alternates:normal;text-decoration-line:underline;vertical=
-align:baseline">https://wiki.yoctoproject.org/wiki/TSC</span></a></p><br><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><=
span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;font-variant-alternates:normal;vertical-align:baseline">The St=
atus reports are now stored on the wiki at: </span><a href=3D"https://wiki.=
yoctoproject.org/wiki/Weekly_Status" style=3D"text-decoration-line:none"><s=
pan style=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-=
variant-alternates:normal;text-decoration-line:underline;vertical-align:bas=
eline">https://wiki.yoctoproject.org/wiki/Weekly_Status</span></a></p><br><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><=
span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;font-variant-alternates:normal;vertical-align:baseline">[If an=
yone has suggestions for other information you=E2=80=99d like to see on thi=
s weekly status update, let us know!]</span></p></span><br class=3D"gmail-A=
pple-interchange-newline"><div dir=3D"ltr" class=3D"gmail_signature" data-s=
martmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><p class=3D"=
MsoNormal" style=3D"background-image:initial;background-position:initial;ba=
ckground-repeat:initial"><span style=3D"font-size:12pt;font-family:Arial,sa=
ns-serif">Thanks,<span></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:12pt;font-fam=
ily:Arial,sans-serif">=C2=A0<span></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><b><i><span style=3D"font-size:16pt;co=
lor:purple">Stephen K. Jolley</span></i></b><span style=3D"font-size:12pt;f=
ont-family:Arial,sans-serif"><span></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><b><span style=3D"font-size:8pt;font-f=
amily:&quot;Courier New&quot;;color:blue">Yocto Project Program Manager</sp=
an></b></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:9pt;font-fami=
ly:Wingdings;color:black">(</span><span style=3D"font-size:9pt;font-family:=
&quot;MS Sans Serif&quot;,serif;color:teal">=C2=A0=C2=A0=C2=A0=C2=A0</span>=
<b><span style=3D"font-size:8pt;font-family:&quot;Comic Sans MS&quot;;color=
:teal">Cell</span></b><span style=3D"font-size:9pt;font-family:&quot;MS San=
s Serif&quot;,serif;color:teal">:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span><span style=3D"font=
-size:9pt;font-family:&quot;MS Sans Serif&quot;,serif">(208) 244-4460</span=
><span style=3D"font-size:12pt;font-family:Arial,sans-serif"><span></span><=
/span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:9pt;font-fami=
ly:Wingdings">*=C2=A0</span><b><span lang=3D"FR" style=3D"font-size:8pt;fon=
t-family:&quot;Comic Sans MS&quot;;color:teal">Email</span></b><span lang=
=3D"FR" style=3D"font-size:9pt;font-family:&quot;MS Sans Serif&quot;,serif;=
color:teal">:</span><span lang=3D"FR" style=3D"font-size:9pt;font-family:&q=
uot;MS Sans Serif&quot;,serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</span><u><span=
 lang=3D"FR" style=3D"font-size:9pt;font-family:&quot;MS Sans Serif&quot;,s=
erif;color:blue"><span style=3D"color:rgb(17,85,204)"><a href=3D"mailto:ste=
phen.k.jolley@intel.com" target=3D"_blank">s</a><a href=3D"mailto:jolley.yp=
.pm@gmail.com" target=3D"_blank">jolley.yp.pm@gmail.com</a></span></span></=
u></p></div></div></div></div>

--000000000000fe0e880621380be4--

