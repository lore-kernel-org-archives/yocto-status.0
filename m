Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D8E3C04FFE
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 14:42:04 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.17503.1715697716872041508
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 14 May 2024 07:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=crl6LmrP;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a59b49162aeso20932566b.3;
        Tue, 14 May 2024 07:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715697715; x=1716302515; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=r334Oc0m9EDPmB+xfTFlcad2DRAPr5/uH+3PDwx6IZ8=;
        b=crl6LmrPNV5D0z0GP4e3rAPayUVVXYTttHz0u1HqcRdbZWhWssnC2uwZhy4NNVVxFS
         8LaBO2PniGF6Wuq4cNyZKTlfyvKY79Zruu1Ncbd+th2pTXhm4dW2yFAS3qa2SStklVvn
         fWoCj/g8V7Hn5f1AJh9D96bSTvRi5k3wWtxFUHJIF5zRuUR+cqtMGNclcRF0ZfnrAHAP
         Fzjc3iZhCHugC467+t2U8Y3+0g280wHLAozo5sMFzDABu7H/+4NK5B0gbADjm4xRlP1u
         JRL+kWKYySu3Ak0/fHDFKKd5KR+yUWLDDtf521/TXmNqdNmTM3akiPnd+1uW+O2wVGnO
         XyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715697715; x=1716302515;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r334Oc0m9EDPmB+xfTFlcad2DRAPr5/uH+3PDwx6IZ8=;
        b=dz0hCA2YGiYM6m8qzg8pyESe2ne70OfVqlGwiGyeeuWj615yVv+sx22P9SDOzvIxqx
         v4LR9rTm8y5OoXPERcTDFs0lVYPg4J2Z17EUOHHqj5N74JRpGIHSy/vIUhiwFAS0JaNU
         1PUispGRdWG2k4joWS22IvDchGzMOTWZRiJzzChn5m4GeTeE2rMmvP2Lqf11f5x8yCDo
         FzNyj155s+CgNNEu688aNchPTzaueax6ul0IVtSchTsQ0XHMvXTLfZRLSXvhaln3O8l9
         z1qEwnvSKQdFbsRaL2sjAhzL/w15CRWneZNGGZYdWP9LmeH0kcICg6Bf8NbLcJqmgYPh
         qEdA==
X-Forwarded-Encrypted: i=1; AJvYcCWj00clc5bcUjp53R2qytZotHMvMviRfGpv2TqTERw7WpBeAdZSy2wat+l8QLWCJk3UdcHXoKT1/XPUuudZqx67utFF3cOG5Uh+t+NCz00CtSeGpA==
X-Gm-Message-State: AOJu0YwwcrwycMVWtg+bXED752xWvigonpstLAV9Eu3z0XlJdTlYPro3
	HIYeIgxK3mYS9vei1+SF3bKn7uNHcePGTcP1ssvSQ2Wtu/hg9ODFz3nJsXdW3SHrvALo7lx0D6d
	HBzH54O+dhkyxujrAhi271m97ZSfPAaAt
X-Google-Smtp-Source: AGHT+IFawvIN+ybkcA4SB6oljxoyf3rdpZLgLtCEcuB3rqRcH7a+9m0xDvU6qTUFaZWJzVsiO75Es45hq1ihbZEfpCc=
X-Received: by 2002:a17:906:b7c6:b0:a59:ef1f:83e4 with SMTP id
 a640c23a62f3a-a5a2d6417f0mr849216366b.59.1715697714644; Tue, 14 May 2024
 07:41:54 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 14 May 2024 07:41:44 -0700
Message-ID: <CAK5yBb91fDiuQjn3QwyHzV5n-KvK9OMCBfzR2RRxFmcSmkp3vg@mail.gmail.com>
Subject: Yocto Project Status 14 May 2024 (WW20)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000d2cfe406186b00ef"
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Tue, 14 May 2024 14:42:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/7

--000000000000d2cfe406186b00ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 5.1 M1

Next Deadline: YP 5.1 M1 Build 20 May 2024

Next Team Meetings:

   -

   Bug Triage meeting Thursday May 16th at 7:30 am PST (
   https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
   -

   Weekly Project Engineering Sync Tuesday May 14th at 8 am PST (
   https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
   <https://zoom.us/j/990892712>
   -

   Twitch -  See https://www.twitch.tv/theyoctojester


Key Status/Updates:

   -

   YP 4.0.18 has been released
   -

   YP 5.0.1 rc2 is in QA.
   -

   YP 5.0.1 rc1 was abandoned due to high numbers of intermittent failures.
   -

   There are some CVE related announcements which are helpful to us:
   -

      There was a CVE 5.1 Record format
      <https://www.cve.org/Media/News/item/blog/2024/04/30/New-CVE-Record-F=
ormat-Enables-Additional-Data>
      announcement with changes that encourage more useful data from our
      perspective
      -

      CISA announced on linkedin
      <https://www.linkedin.com/posts/cisagov_we-understand-that-timely-and=
-accurate-information-activity-7193995615737901056-8PNq>
      the creation of https://github.com/cisagov/vulnrichment
      -

   There is an open letter the project has created related to the CVE/NVD
   situation, more information is available here:
   https://lists.openembedded.org/g/openembedded-architecture/message/1990

Please consider signing this to show support for those changes.

Signatures from small businesses/consultancies are as welcome as those from
larger organizations as we want to demonstrate the breadth of the need for
these changes.

   -

   The project is sponsoring Syslinbit to separate out our CVE tooling from
   the build system into a standalone tool so that it can be used on softwa=
re
   manifests of output at a later date.
   -

   The WORKDIR to UNPACKDIR transition and redefinition of UNPACKDIR now
   has patches under testing in master-next, including updates to recipetoo=
l
   and devtool which pass our automated tests.
   -

   gcc 14 has patches pending thanks for Khem and Martin in particular.
   Merging the new gcc version is needed to generate new uninative tarballs=
 to
   support Fedora 40 builds or any other distro using the new gcc version.
   -

   The project is in the process of testing a new way of hosting our
   autobuilder with plans to switch soon if successful. Our existing hardwa=
re
   is past end of life and showing increased hardware failures so is curren=
tly
   down on capacity meaning builds are taking longer than normal.
   -

   Mailing list changes now mean any google hosted email accounts have the
   mailing list From: address rewritten. This had impacted our ability to
   handle patches but key maintainers now have workarounds for this.
   -

   Our automated tests have been seeing a number of intermittent
issues. An email
   <https://lists.openembedded.org/g/openembedded-architecture/message/2003=
>was
   sent detailing a few of these and the response with several patches or
   patches in progress has been extremely helpful and they=E2=80=99re very =
gratefully
   received.


Ways to contribute:

   -

   As people are likely aware, the project has a number of components which
   are either unmaintained, or have people with little to no time trying to
   keep them alive. These components include: devtool, toaster, wic, oeqa,
   autobuilder, CROPs containers, pseudo and more. Many have open bugs. Hel=
p
   is welcome in trying to better look after these components!
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


Tracking Metrics:

   -

   WDD 2740 (last week 2720) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   OE-Core/Poky Patch Metrics
   -

      Total patches found: 1128 (last week 1125)
      -

      Patches in the Pending State: 221 (20%) [last week 221 (20%)]
      -

   https://autobuilder.yocto.io/pub/non-release/patchmetrics/


YP 5.1 Milestone Dates:

   -

   YP 5.1 M1 Build date  2024-05-20
   -

   YP 5.1 M1 Release date 2024-05-31
   -

   YP 5.1 M2 Build date  2024-07-08
   -

   YP 5.1 M2 Release date 2024-07-19
   -

   YP 5.1 M3 Build date  2024-08-26
   -

   YP 5.1 M3 Release date 2024-09-06
   -

   YP 5.1 M4 Build date  2024-09-30
   -

   YP 5.1 M4 Release date 2024-10-25


Upcoming dot releases:

   -

   YP 4.0.18 is released.


   -

   YP 5.0.1 is in QA.
   -

   YP 4.0.19 build date 2024-06-03
   -

   YP 4.0.19 Release date 2024-06-14
   -

   YP 5.0.2 Build Date 2024-06-24
   -

   YP 5.0.2 Release Date 2024-07-05
   -

   YP 4.0.20 Build Date 2024-07-15
   -

   YP 4.0.20 Release Date 2024-07-26
   -

   YP 5.0.3 Build Date 2024-08-12
   -

   YP 5.0.3 Release Date 2024-08-23
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

--000000000000d2cfe406186b00ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-1b63caaa-7fff-653c-8c=
f3-b0d0aeacdcc9"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;font-variant-alternates:normal;vertical-alig=
n:baseline">Current Dev Position: YP 5.1 M1</span></p><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-v=
ariant-alternates:normal;vertical-align:baseline">Next Deadline: YP 5.1 M1 =
Build 20 May 2024</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:A=
rial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norma=
l;vertical-align:baseline">Next Team Meetings:</span></p><ul style=3D"margi=
n-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;=
font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
font-variant-alternates:normal;vertical-align:baseline;white-space:pre"><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" rol=
e=3D"presentation"><span style=3D"font-size:11pt;background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-=
alternates:normal;vertical-align:baseline">Bug Triage meeting Thursday May =
16th at 7:30 am PST (</span><a href=3D"https://zoom.us/j/454367603?pwd=3DZG=
xoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09" style=3D"text-decoration-line:none"><span s=
tyle=3D"font-size:11pt;background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;font-variant-alternates:normal;text-dec=
oration-line:underline;vertical-align:baseline">https://zoom.us/j/454367603=
?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</span></a><span style=3D"font-size:=
11pt;background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-variant-alternates:normal;vertical-align:baseline">)=
</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:9.5=
pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-=
alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presenta=
tion"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:no=
rmal;vertical-align:baseline">Weekly Project Engineering Sync Tuesday May 1=
4th at 8 am PST (</span><a href=3D"https://zoom.us/j/990892712?pwd=3DcHU1Mj=
hoM2x6ck81bkcrYjRrcmJsUT09" style=3D"text-decoration-line:none"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;text-decorat=
ion-line:underline;vertical-align:baseline">https://zoom.us/j/990892712?pwd=
=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</span></a><a href=3D"https://zoom.us/j/=
990892712" style=3D"text-decoration-line:none"><span style=3D"font-size:11p=
t;background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;font-variant-alternates:normal;text-decoration-line:underlin=
e;vertical-align:baseline">)</span></a></p></li><li dir=3D"ltr" style=3D"li=
st-style-type:disc;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0=
,0,0);background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline;w=
hite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;font-variant-alternates:normal;vertical-align:baseline">Twitch -=C2=
=A0 See </span><a href=3D"https://www.twitch.tv/theyoctojester" style=3D"te=
xt-decoration-line:none"><span style=3D"font-size:11pt;background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-va=
riant-alternates:normal;text-decoration-line:underline;vertical-align:basel=
ine">https://www.twitch.tv/theyoctojester</span></a><span style=3D"font-siz=
e:11pt;background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline"=
>=C2=A0</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:A=
rial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norma=
l;vertical-align:baseline">Key Status/Updates:</span></p><ul style=3D"margi=
n-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;=
font-size:11pt;font-family:Arial,sans-serif;color:rgb(46,52,54);background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;font-variant-alternates:normal;vertical-align:baseline;white-space:pre"><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" r=
ole=3D"presentation"><span style=3D"font-size:11pt;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-=
align:baseline">YP 4.0.18 has been released</span></p></li><li dir=3D"ltr" =
style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;c=
olor:rgb(46,52,54);background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size=
:11pt;font-variant-numeric:normal;font-variant-east-asian:normal;font-varia=
nt-alternates:normal;vertical-align:baseline">YP 5.0.1 rc2 is in QA.</span>=
</p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-=
family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;font-variant-alternat=
es:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><s=
pan style=3D"font-size:11pt;background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;font-variant-alternates:normal;ver=
tical-align:baseline">YP 5.0.1 rc1 was abandoned due to high numbers of int=
ermittent failures.</span></p></li><li dir=3D"ltr" style=3D"list-style-type=
:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;font-variant-alternates:normal;vertical-align:baseline;white-space:pre=
"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-var=
iant-alternates:normal;vertical-align:baseline">There are some CVE related =
announcements which are helpful to us:</span></p></li><ul style=3D"margin-t=
op:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;f=
ont-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fo=
nt-variant-alternates:normal;vertical-align:baseline;white-space:pre"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">There was a </span><a href=3D"htt=
ps://www.cve.org/Media/News/item/blog/2024/04/30/New-CVE-Record-Format-Enab=
les-Additional-Data" style=3D"text-decoration-line:none"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;text-decoration-lin=
e:underline;vertical-align:baseline">CVE 5.1 Record format</span></a><span =
style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-variant-alternates:normal;vertica=
l-align:baseline"> announcement with changes that encourage more useful dat=
a from our perspective</span></p></li><li dir=3D"ltr" style=3D"list-style-t=
ype:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;font-variant-alternates:normal;vertical-align:baseline;white-spac=
e:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fon=
t-variant-alternates:normal;vertical-align:baseline">CISA announced on </sp=
an><a href=3D"https://www.linkedin.com/posts/cisagov_we-understand-that-tim=
ely-and-accurate-information-activity-7193995615737901056-8PNq" style=3D"te=
xt-decoration-line:none"><span style=3D"font-size:11pt;background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-va=
riant-alternates:normal;text-decoration-line:underline;vertical-align:basel=
ine">linkedin</span></a><span style=3D"font-size:11pt;background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-var=
iant-alternates:normal;vertical-align:baseline"> the creation of </span><a =
href=3D"https://github.com/cisagov/vulnrichment" style=3D"text-decoration-l=
ine:none"><span style=3D"font-size:11pt;background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;font-variant-alternate=
s:normal;text-decoration-line:underline;vertical-align:baseline">https://gi=
thub.com/cisagov/vulnrichment</span></a></p></li></ul><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;font-variant-alternates:normal;vertical-align:basel=
ine;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;font-variant-alternates:normal;vertical-align:baseline">There is=
 an open letter the project has created related to the CVE/NVD situation, m=
ore information is available here: </span><a href=3D"https://lists.openembe=
dded.org/g/openembedded-architecture/message/1990" style=3D"text-decoration=
-line:none"><span style=3D"font-size:11pt;background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alterna=
tes:normal;text-decoration-line:underline;vertical-align:baseline">https://=
lists.openembedded.org/g/openembedded-architecture/message/1990</span></a><=
/p></li></ul><p dir=3D"ltr" style=3D"line-height:1.38;margin-left:36pt;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Ari=
al,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;=
vertical-align:baseline">Please consider signing this to show support for t=
hose changes.</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-lef=
t:36pt;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font=
-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alterna=
tes:normal;vertical-align:baseline">Signatures from small businesses/consul=
tancies are as welcome as those from larger organizations as we want to dem=
onstrate the breadth of the need for these changes.</span></p><ul style=3D"=
margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:=
disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;font-variant-alternates:normal;vertical-align:baseline;white-space:pre"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
 role=3D"presentation"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;font-vari=
ant-alternates:normal;vertical-align:baseline">The project is sponsoring Sy=
slinbit to separate out our CVE tooling from the build system into a standa=
lone tool so that it can be used on software manifests of output at a later=
 date.=C2=A0</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;f=
ont-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fo=
nt-variant-alternates:normal;vertical-align:baseline;white-space:pre"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">The WORKDIR to UNPACKDIR transiti=
on and redefinition of UNPACKDIR now has patches under testing in master-ne=
xt, including updates to recipetool and devtool which pass our automated te=
sts.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size=
:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varia=
nt-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"prese=
ntation"><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates=
:normal;vertical-align:baseline">gcc 14 has patches pending thanks for Khem=
 and Martin in particular. Merging the new gcc version is needed to generat=
e new uninative tarballs to support Fedora 40 builds or any other distro us=
ing the new gcc version.</span></p></li><li dir=3D"ltr" style=3D"list-style=
-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;font-variant-alternates:normal;vertical-align:baseline;white-spac=
e:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fon=
t-variant-alternates:normal;vertical-align:baseline">The project is in the =
process of testing a new way of hosting our autobuilder with plans to switc=
h soon if successful. Our existing hardware is past end of life and showing=
 increased hardware failures so is currently down on capacity meaning build=
s are taking longer than normal.</span></p></li><li dir=3D"ltr" style=3D"li=
st-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,=
0,0);background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-variant-alternates:normal;vertical-align:baseline;wh=
ite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;font-variant-alternates:normal;vertical-align:baseline">Mailing list c=
hanges now mean any google hosted email accounts have the mailing list From=
: address rewritten. This had impacted our ability to handle patches but ke=
y maintainers now have workarounds for this.</span></p></li><li dir=3D"ltr"=
 style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;=
color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-variant-alternates:normal;vertical-align=
:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;vertical-align:baseline">Ou=
r automated tests have been seeing a number of intermittent issues. An </sp=
an><a href=3D"https://lists.openembedded.org/g/openembedded-architecture/me=
ssage/2003" style=3D"text-decoration-line:none"><span style=3D"font-size:11=
pt;background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;font-variant-alternates:normal;text-decoration-line:underli=
ne;vertical-align:baseline">email </span></a><span style=3D"font-size:11pt;=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;font-variant-alternates:normal;vertical-align:baseline">was se=
nt detailing a few of these and the response with several patches or patche=
s in progress has been extremely helpful and they=E2=80=99re very gratefull=
y received.</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-fami=
ly:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:n=
ormal;vertical-align:baseline">Ways to contribute:</span></p><ul style=3D"m=
argin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:d=
isc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-variant-alternates:normal;vertical-align:baseline;white-space:pre">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" =
role=3D"presentation"><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varia=
nt-alternates:normal;vertical-align:baseline">As people are likely aware, t=
he project has a number of components which are either unmaintained, or hav=
e people with little to no time trying to keep them alive. These components=
 include: devtool, toaster, wic, oeqa, autobuilder, CROPs containers, pseud=
o and more. Many have open bugs. Help is welcome in trying to better look a=
fter these components!</span></p></li><li dir=3D"ltr" style=3D"list-style-t=
ype:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;font-variant-alternates:normal;vertical-align:baseline;white-space:=
pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-=
variant-alternates:normal;vertical-align:baseline">There are bugs identifie=
d as possible for newcomers to the project: </span><a href=3D"https://wiki.=
yoctoproject.org/wiki/Newcomers" style=3D"text-decoration-line:none"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-variant-alternates:normal;text-de=
coration-line:underline;vertical-align:baseline">https://wiki.yoctoproject.=
org/wiki/Newcomers</span></a></p></li><li dir=3D"ltr" style=3D"list-style-t=
ype:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;font-variant-alternates:normal;vertical-align:baseline;white-space:=
pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-=
variant-alternates:normal;vertical-align:baseline">There are bugs that are =
currently unassigned for YP 5.1. See: </span><a href=3D"https://wiki.yoctop=
roject.org/wiki/Bug_Triage#Medium+_5.1_Unassigned_Enhancements/Bugs" style=
=3D"text-decoration-line:none"><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;text-decoration-line:underline;vertical-align=
:baseline">https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium+_5.1_Unassi=
gned_Enhancements/Bugs</span></a></p></li><li dir=3D"ltr" style=3D"list-sty=
le-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;font-variant-alternates:normal;vertical-align:baseline;white-sp=
ace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;vertical-align:baseline">We=E2=80=99d welcome=
 new maintainers for recipes in OE-Core. Please see the list at: </span><a =
href=3D"http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/inc=
lude/maintainers.inc" style=3D"text-decoration-line:none"><span style=3D"fo=
nt-size:11pt;background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;text-decoration-li=
ne:underline;vertical-align:baseline">http://git.yoctoproject.org/cgit.cgi/=
poky/tree/meta/conf/distro/include/maintainers.inc</span></a><span style=3D=
"font-size:11pt;background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:=
baseline"> and discuss with the existing maintainer, or ask on the OE-Core =
mailing list. We will likely move a chunk of these to =E2=80=9CUnassigned=
=E2=80=9D soon to help facilitate this.</span></p></li><li dir=3D"ltr" styl=
e=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;font-variant-alternates:normal;vertical-align:baseline">Help is=
 very much welcome in trying to resolve our autobuilder intermittent issues=
. You can see the list of failures we=E2=80=99re continuing to see by searc=
hing for the =E2=80=9CAB-INT=E2=80=9D tag in bugzilla: </span><a href=3D"ht=
tps://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DAB-INT" style=3D"=
text-decoration-line:none"><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-=
variant-alternates:normal;text-decoration-line:underline;vertical-align:bas=
eline">https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DAB-INT</=
span></a><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates=
:normal;vertical-align:baseline">.</span></p></li><li dir=3D"ltr" style=3D"=
list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline;=
white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-variant-alternates:normal;vertical-align:baseline">Help us reso=
lve CVE issues: </span><a href=3D"https://autobuilder.yocto.io/pub/non-rele=
ase/patchmetrics/" style=3D"text-decoration-line:none"><span style=3D"font-=
size:11pt;background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;font-variant-alternates:normal;text-decoration-line:=
underline;vertical-align:baseline">CVE metrics</span></a><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line">=C2=A0</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;f=
ont-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fo=
nt-variant-alternates:normal;vertical-align:baseline;white-space:pre"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">We have a growing number of bugs =
in bugzilla, any help with them is appreciated.</span></p></li><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-al=
ign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-siz=
e:11pt;background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline"=
>Regarding bugs, even if you can=E2=80=99t fix a bug, submitting a failing =
test case that can reproduce the issue significantly improves the chances i=
t might get fixed.</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;fo=
nt-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fo=
nt-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alter=
nates:normal;vertical-align:baseline">Tracking Metrics:</span></p><ul style=
=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-t=
ype:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;font-variant-alternates:normal;vertical-align:baseline;white-space:=
pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-=
variant-alternates:normal;vertical-align:baseline">WDD 2740 (last week 2720=
) </span><span style=3D"font-size:11pt;font-family:Consolas,sans-serif;back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;font-variant-alternates:normal;vertical-align:baseline">(</span><a=
 href=3D"https://wiki.yoctoproject.org/charts/combo.html" style=3D"text-dec=
oration-line:none"><span style=3D"font-size:11pt;background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-=
alternates:normal;text-decoration-line:underline;vertical-align:baseline">h=
ttps://wiki.yoctoproject.org/charts/combo.html</span></a><span style=3D"fon=
t-size:11pt;font-family:Consolas,sans-serif;background-color:transparent;fo=
nt-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alter=
nates:normal;vertical-align:baseline">)</span></p></li><li dir=3D"ltr" styl=
e=3D"list-style-type:disc;font-size:11pt;font-family:Consolas,sans-serif;co=
lor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:b=
aseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11p=
t;font-family:Arial,sans-serif;background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;=
vertical-align:baseline">OE-Core/Poky Patch Metrics</span></p></li><ul styl=
e=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-=
type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;font-variant-alternates:normal;vertical-align:baseline;white-spa=
ce:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fo=
nt-variant-alternates:normal;vertical-align:baseline">Total patches found: =
1128 (last week 1125)</span></p></li><li dir=3D"ltr" style=3D"list-style-ty=
pe:circle;font-size:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;font-variant-alternates:normal;vertical-align:baseline;white-sp=
ace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-family:Ar=
ial,sans-serif;background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:b=
aseline">Patches in the Pending State: 221 (20%) [last week 221 (20%)]</spa=
n></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11p=
t;font-family:Consolas,sans-serif;color:rgb(0,0,0);background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varian=
t-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presen=
tation"><a href=3D"https://autobuilder.yocto.io/pub/non-release/patchmetric=
s/" style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;font-=
family:Arial,sans-serif;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-variant-alternates:normal;text-de=
coration-line:underline;vertical-align:baseline">https://autobuilder.yocto.=
io/pub/non-release/patchmetrics/</span></a></p></li></ul><br><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
font-variant-alternates:normal;vertical-align:baseline">YP 5.1 Milestone Da=
tes:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"lt=
r" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-seri=
f;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size=
:11pt;background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline">=
YP 5.1 M1 Build date=C2=A0 2024-05-20</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;font-variant-alternates:normal;vertical-align:basel=
ine;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;font-variant-alternates:normal;vertical-align:baseline">YP 5.1 M=
1 Release date 2024-05-31</span></p></li><li dir=3D"ltr" style=3D"list-styl=
e-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;font-variant-alternates:normal;vertical-align:baseline;white-spa=
ce:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fo=
nt-variant-alternates:normal;vertical-align:baseline">YP 5.1 M2 Build date=
=C2=A0 2024-07-08</span></p></li><li dir=3D"ltr" style=3D"list-style-type:d=
isc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-variant-alternates:normal;vertical-align:baseline;white-space:pre">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" =
role=3D"presentation"><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varia=
nt-alternates:normal;vertical-align:baseline">YP 5.1 M2 Release date 2024-0=
7-19</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size=
:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varia=
nt-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"prese=
ntation"><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates=
:normal;vertical-align:baseline">YP 5.1 M3 Build date=C2=A0 2024-08-26</spa=
n></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fon=
t-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;font-variant-altern=
ates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;vertical-align:baseline">YP 5.1 M3 Release date 2024-09-06</span></p></li>=
<li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ar=
ial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline">YP 5.1 M4 Build date=C2=A0 2024-09-30</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;font-variant-alternates:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line">YP 5.1 M4 Release date 2024-10-25</span></p></li></ul><br><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-variant-alternates:normal;vertical-align:baseline">Upcoming dot rel=
eases:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"=
ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-se=
rif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-a=
lign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-si=
ze:11pt;background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline=
">YP 4.0.18 is released.</span></p></li></ul><ul style=3D"margin-top:0px;ma=
rgin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11=
pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-=
alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presenta=
tion"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:no=
rmal;vertical-align:baseline">YP 5.0.1 is in QA.</span></p></li><li dir=3D"=
ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-se=
rif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-a=
lign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-si=
ze:11pt;background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline=
">YP 4.0.19 build date 2024-06-03</span></p></li><li dir=3D"ltr" style=3D"l=
ist-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0=
,0,0);background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline;w=
hite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;font-variant-alternates:normal;vertical-align:baseline">YP 4.0.19 Rel=
ease date 2024-06-14</span></p></li><li dir=3D"ltr" style=3D"list-style-typ=
e:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;font-variant-alternates:normal;vertical-align:baseline;white-space:pr=
e"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-va=
riant-alternates:normal;vertical-align:baseline">YP 5.0.2 Build Date 2024-0=
6-24</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size=
:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varia=
nt-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"prese=
ntation"><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates=
:normal;vertical-align:baseline">YP 5.0.2 Release Date 2024-07-05</span></p=
></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fam=
ily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:=
normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span=
 style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;font-variant-alternates:normal;vertic=
al-align:baseline">YP 4.0.20 Build Date 2024-07-15</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;font-variant-alternates:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line">YP 4.0.20 Release Date 2024-07-26</span></p></li><li dir=3D"ltr" styl=
e=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;font-variant-alternates:normal;vertical-align:baseline">YP 5.0.=
3 Build Date 2024-08-12</span></p></li><li dir=3D"ltr" style=3D"list-style-=
type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;font-variant-alternates:normal;vertical-align:baseline;white-space=
:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;font=
-variant-alternates:normal;vertical-align:baseline">YP 5.0.3 Release Date 2=
024-08-23</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font=
-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-=
variant-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">YP 4.0.21 Build Date 2024-09-09</=
span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;=
font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alt=
ernates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentatio=
n"><span style=3D"font-size:11pt;background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norma=
l;vertical-align:baseline">YP 4.0.21 Release Date 2024-09-20</span></p></li=
><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:A=
rial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norma=
l;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-al=
ign:baseline">YP 5.0.4 Build Date 2024-09-23</span></p></li><li dir=3D"ltr"=
 style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;=
color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-variant-alternates:normal;vertical-align=
:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;vertical-align:baseline">YP=
 5.0.4 Release Date 2024-10-04</span></p></li><li dir=3D"ltr" style=3D"list=
-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;font-variant-alternates:normal;vertical-align:baseline;whit=
e-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-variant-alternates:normal;vertical-align:baseline">YP 4.0.22 Build =
Date 2024-10-14</span></p></li><li dir=3D"ltr" style=3D"list-style-type:dis=
c;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;font-variant-alternates:normal;vertical-align:baseline;white-space:pre"><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" ro=
le=3D"presentation"><span style=3D"font-size:11pt;background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant=
-alternates:normal;vertical-align:baseline">YP 4.0.22 Release Date 2024-10-=
25</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:1=
1pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant=
-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"present=
ation"><span style=3D"font-size:11pt;background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:n=
ormal;vertical-align:baseline">YP 5.0.5 Build Date 2024-11-11</span></p></l=
i><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:=
Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norm=
al;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span sty=
le=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-a=
lign:baseline">YP 5.0.5 Release Date 2024-11-22</span></p></li><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-al=
ign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-siz=
e:11pt;background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline"=
>YP 4.0.23 Build Date 2024-11-18</span></p></li><li dir=3D"ltr" style=3D"li=
st-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,=
0,0);background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-variant-alternates:normal;vertical-align:baseline;wh=
ite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;font-variant-alternates:normal;vertical-align:baseline">YP 4.0.23 Rele=
ase Date 2024-11-29</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;f=
ont-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alte=
rnates:normal;vertical-align:baseline">The Yocto Project=E2=80=99s technica=
l governance is through its Technical Steering Committee, more information =
is available at:</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt"><a href=3D"https://wiki.yoctoproject.org/wiki/TS=
C" style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;font-f=
amily:Arial,sans-serif;background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;font-variant-alternates:normal;text-dec=
oration-line:underline;vertical-align:baseline">https://wiki.yoctoproject.o=
rg/wiki/TSC</span></a></p><br><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Ari=
al,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;=
vertical-align:baseline">The Status reports are now stored on the wiki at: =
</span><a href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status" style=
=3D"text-decoration-line:none"><span style=3D"font-size:11pt;font-family:Ar=
ial,sans-serif;background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-variant-alternates:normal;text-decoration-=
line:underline;vertical-align:baseline">https://wiki.yoctoproject.org/wiki/=
Weekly_Status</span></a></p><br><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:A=
rial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norma=
l;vertical-align:baseline">[If anyone has suggestions for other information=
 you=E2=80=99d like to see on this weekly status update, let us know!]</spa=
n></p></span><br class=3D"gmail-Apple-interchange-newline"><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr"><div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"background-image:initi=
al;background-position:initial;background-repeat:initial"><span style=3D"fo=
nt-size:12pt;font-family:Arial,sans-serif">Thanks,<span></span></span></p>

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

--000000000000d2cfe406186b00ef--

