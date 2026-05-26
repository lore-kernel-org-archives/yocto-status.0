Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D44CD5BD2
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 14:44:49 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38892.1779806680686917650
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 26 May 2026 07:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PxT6TjJa;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-303dbfbec77so12563568eec.0
        for <yocto-status@lists.yoctoproject.org>; Tue, 26 May 2026 07:44:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779806680; cv=none;
        d=google.com; s=arc-20240605;
        b=NIF1iXKdy03bgwuOrfSw7cfFqFaFZDi4H9WCTsZUeoQIA6cyTnrr+rx10aG1Znh33r
         D4FCBKxdtVrj2K54KXCWq1bWCMnOffe7jYHak9zvq+0jNw9+GUooblOy9+PawHW7L3FL
         Cjkd6n827sM09WzvJ51J6+HmCT0TQaKsU1C+I9oW0aaw4Q6q1jPzxdGRUDcF0snuvpMo
         OP8K1vXgO4ky1cBW3JqcB0gu7wF218gNBkI3Hwim7hS8XxUqicD1m0BjmdKr2c1E+WPr
         4fjqgmCdj8IlQOk/3gFBf0OaQWRaF7plDprTvgnjUrPPbwDmg3SFTm3Rtgj+rwnoYBvm
         GHCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=T2nExuMbCaqS2+etAbSabpWzLaDGG/lkTgJQeOLoz6Y=;
        fh=DtYbyB32Z9wTryVNG3cZf76F2ldjAu1cDds9bwCjb60=;
        b=QgDD1oPq/QaZEKt/3WslI31IkAdiggQEvyn9LjlWXjGxTspKTqQX5W+QbEo9uBenl+
         PkjbHd2GUQYdPS+Ia/tpBix46gHrBPIJjIpJZiCCHEt1T8TQqSj3QlpMvlbIav/ma/tS
         zDAlclvhJNCLiAFuPcPj2oVz/urHn7NeV56ZDACGNV6qC3NpsaYcN0oyNeiGMGdMvMGC
         bgclOln9119bPOVNL43zThNgvEajBJmnZGhdBKVZ4vxMjsuicX01jS60ttUFdyUd/2pY
         E+9iYZS/6VChmtnMm1JKn0+X7rgzpIbkeSIMY8aTdUtl0BgVmy5S8gECy1zW5iR1Sv4D
         78yg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779806680; x=1780411480; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T2nExuMbCaqS2+etAbSabpWzLaDGG/lkTgJQeOLoz6Y=;
        b=PxT6TjJaKTqLGU7tOxb/prlaNnqyaiDhGGc/5aQfe2D5NoiVSNCwtUYkErTSOrBmTJ
         TGyv6KtDVjmS88QrrKBJSg5Z7/PfP7S5sjLXI/G4s/i7o4GQ3BARl2GqMrttppWJhNl7
         gp3sobltBBeF6OUoCeJVmBN/FYRSDXa82FPDli+DKAvXIq9e0yKkwHg+hucpBk9Rezvl
         8+9ce3vTa3M3i+bx1K2T2iND6TT8jqxtFOUIp49W09TU90OhLOqTyYdP+Mm3jsUa7pkB
         hmUA/rQiX0vsEKq1CDcl7J8EVzPnCdiQHQSwN12PGh7LBFMYthfdo1obYODfwsz6l0/o
         oWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806680; x=1780411480;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T2nExuMbCaqS2+etAbSabpWzLaDGG/lkTgJQeOLoz6Y=;
        b=qNRelzgNRaa6g19mRDyjKvNNi7bC+ecxR+SZVYqV4RjDkuVoNJEqeUzNAj6CmvAGj6
         iviZ5SjbOO0w78zLSEz70305f6yNZw88YZp08dFQ29p9ATjowPgfi1PIC0Nlhao5Qnwv
         s3YZN7FKFHKKLf/wfV55HoCjECe21UzeHvJ2E3DiND0MUYjFWJfZC+hhCEY/E3/nSfpl
         ORf9FKHOO4XFCGiqakzu1ICu8WRe4NAYPYU+usu9XdIZxz65SotYqJtSosat+ZWoBBRX
         O04Fsf9fUzXhQ+0UkztMzzgkl4VePPBiTteNn/zJa/ioH5Z2b96gSFxPvul8q3X4Jxe9
         +3ng==
X-Forwarded-Encrypted: i=1; AFNElJ8VhmLD5/tU7IAklDFQSial3XaAGePTk9p8cA+SFKKKbJT5NhDVu2BXz93iPyi0n37gUbtS2G1bpNcroe8=@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxwooHDtc+wEpd3XObpz5VMH01v/JmxXQ9W2V/bEGLp4L8nogND
	DScz23l3dlSVvY7ApK1VHblB7piF6ymIm7xX3X9+qhBJ1I+4Uwuaa+lR9Jc0TU8d9uXxv/sHgON
	gO6W4NoJV3q/6xt4vraTRa7m6L7wibv8=
X-Gm-Gg: Acq92OGGmWvxWlO4jGAfEA0MKp3QeAx+NjYyMOxyhslHrQOgAa20cp0Nawe07D4HIaJ
	Gn0tD2u2y1luu/TUrWpAXe8Pu0gwd56MFKJTmuJw72qkGOqsVNi/HetYUrnVzuMJY/0jNSqUsDd
	Y0dOeITW2MhnZiWDZ6KX66rxRdhISSIpR2PAekZYz1oFmxj1DvtY7N6b/9mFjtuqoJxLLPHzHl+
	AK/MdF6uYKktfpKdbPAdTDJ+f6Uyg7TkCPYFlIV5Ua2ZBsaOWWdxwK7NgXQZNuSNK5PerrAxk/5
	NKQodd76bCo6tBTK1k3Q9p+pyy5KHhRE6HSo57GPuhAoupn6x40lEZfaG3Tnhz/3hmkJgnor59S
	1PW0CLV0/YvAYcO/EfmOE2p964UGncJxAm0abz7j7QQLShUUaGTVKF8mMt+K8zn/KDTqUbBzslQ
	ZTv2/FI6c=
X-Received: by 2002:a05:7300:f191:b0:2da:2ec2:64fe with SMTP id
 5a478bee46e88-30449095624mr8287388eec.24.1779806679507; Tue, 26 May 2026
 07:44:39 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 26 May 2026 07:44:28 -0700
X-Gm-Features: AVHnY4LKJJWVN0LrVoOThOOkRO1sSIKVqmtNNaqkMYXYKUwpNSeKBQ357_HN85s
Message-ID: <CAK5yBb-AQYhPKmjfC7Qwuge2gZtd5CF7dKqqdAYxB7Nmj46xqg@mail.gmail.com>
Subject: Yocto Project Status 26 May 2026 (WW22)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000e6a5890652b988ca"
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Tue, 26 May 2026 14:44:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/123

--000000000000e6a5890652b988ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 6.1 M1

Next Deadline: YP 6.1 M1: w/c 2026-06-08

Next Team Meetings:

   -

   Bug Triage meeting - Thursday 28th May 7:30am PDT (
   https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
   -

   Weekly Project Engineering Sync  - Tuesday 26th May. 8am PDT (
   https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
   <https://zoom.us/j/990892712>
   -

   Yocto Project Patch Review - Thursday 28th May 10am GMT and Monday 1st
   June 9am PDT (https://zoom.us/j/9776239
   <https://zoom.us/j/97762397148?pwd=3D1xkiC9hp9SjEonaTaONwTb6iWry4Eb.1>7
   148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1
   <https://zoom.us/j/97762397148?pwd=3D1xkiC9hp9SjEonaTaONwTb6iWry4Eb.1>)


Project data dashboard: https://dashboard.yoctoproject.org/

Key Status/Updates:

   -

   YP 5.0.18 is out of QA and under review.
   -

   YP 6.0.1 is in QA
   -

   We=E2=80=99re working through the backlog of patches, the bandwidth for =
changes
   needing in depth review/feedback continues to be a challenge.
   -

   Intermittent build failures continue to be problematic and unchanged
   from last week:
   -

      several qemu =E2=80=98hang=E2=80=99 type issues
      -

      sometimes yocto-check-layer is showing checksum mismatch issues
      -

      siggen reset issues (=E2=80=9CResourceWarning: unclosed transport=E2=
=80=9D)
      -

      groff build race issues
      -

      intermittent ptest failures in many recipes
      -

   Is anyone using 32 bit SDKs, if so let us know. Qemu dropped support for
   32 bit hosts and we are considering discontinuing 32 bit SDKs.
   -

   We are likely to merge the gcc 16 upgrade soon
   -

   We would like to know what people are planning to work on for Yocto
   Project 6.1 and beyond. We have a roadmap document in Google Docs:
   https://docs.google.com/document/d/12xgAzSjDj5zVlo4eQIbiv1s3QMjtBTCvBFY3=
_T7OPto
   -

   We are updating the project=E2=80=99s security team and welcome nominati=
ons
   and/or feedback:
   https://lists.openembedded.org/g/openembedded-architecture/topic/1193887=
16


Want to contribute? We would appreciate help with the following areas:

   -

   We have several open issues for pseudo and limited maintainer time to
   work on them. Help from someone familiar with systems programming in C
   would be greatly appreciated.
   https://bugzilla.yoctoproject.org/buglist.cgi?list_id=3D661406&priority=
=3DHigh&priority=3DMedium%2B&product=3DPseudo&query_format=3Dadvanced&resol=
ution=3D---
   -

   There are a large number of intermittent failures on our autobuilder,
   any help with investigating, reproducing or solving these issues would b=
e
   welcome! https://valkyrie.yocto.io/pub/non-release/abint/
   -

   Many recipes in openembedded-core would benefit from a new recipe
   maintainer. Please look at
   https://git.openembedded.org/openembedded-core/tree/meta/conf/distro/inc=
lude/maintainers.inc
   and see if you can adopt any of the unassigned recipes.
   -

   For more ways to contribute, see
   https://docs.google.com/document/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9owFuC=
WbzgjOk/edit?usp=3Dsharing


New to the project?

   -

   We have a list of issues we think are good places to start contributing:
   https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DNEWCOMER


Tracking Metrics:

   -

   WDD 2660 (last week 2673) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   OE-Core/Poky Patch Metrics
   -

      Total patches found: 1083 (last week 1083)
      -

      Patches in the Pending State: 148 (14%) [last week 148 (14%)
      -

      https://valkyrie.yocto.io/pub/non-release/patchmetrics/


Upcoming development releases:

   -

   6.1 M1:
   -

      Build Date: w/c 2026-06-08
      -

      Release Date: w/c 2026-06-22
      -

   6.1 M2:
   -

      Build Date: w/c 2026-07-20
      -

      Release Date: w/c 2026-08-03
      -

   6.1 M3:
   -

      Build Date: w/c 2026-08-31
      -

      Release Date: w/c 2026-09-14
      -

   6.1.0:
   -

      Build Date (M4): w/c 2026-10-12
      -

      Release Date: w/c 2026-11-02


Upcoming dot releases:

   -

   YP 5.0.18 is in review.
   -

   YP 6.0.1is in QA.
   -

   YP 5.0.19
   -

      Build Date  2026-06-30
      -

      Release Date 2026-07-13
      -

   For future release dates, see
   https://wiki.yoctoproject.org/wiki/Release_calendar


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

--000000000000e6a5890652b988ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span id=3D"gmail-docs-internal-guid-17575ec7-7fff-0a=
34-d129-3dbd6945bdf8"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-=
serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;ver=
tical-align:baseline;white-space:pre-wrap">Current Dev Position: YP 6.1 M1<=
/span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align:=
baseline;white-space:pre-wrap">Next Deadline: YP </span><span style=3D"font=
-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:=
transparent;font-variant:normal;vertical-align:baseline;white-space:pre-wra=
p">6.1 M1:</span><span style=3D"font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical=
-align:baseline;white-space:pre-wrap"> w/c 2026-06-08</span></p><br><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">Next Team Meetings:</span></p><ul style=3D"margin-top:0px;ma=
rgin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:9.=
5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpar=
ent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pr=
esentation"><span style=3D"font-size:11pt;background-color:transparent;font=
-variant:normal;vertical-align:baseline;white-space:pre-wrap">Bug Triage me=
eting - Thursday 28th May 7:30am PDT (</span><a href=3D"https://zoom.us/j/4=
54367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09" style=3D"text-decoration:n=
one"><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t:normal;text-decoration:underline;vertical-align:baseline;white-space:pre-=
wrap">https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</s=
pan></a><span style=3D"font-size:11pt;background-color:transparent;font-var=
iant:normal;vertical-align:baseline;white-space:pre-wrap">)</span></p></li>=
<li dir=3D"ltr" style=3D"list-style-type:disc;font-size:9.5pt;font-family:A=
rial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:=
normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span=
 style=3D"font-size:11pt;background-color:transparent;font-variant:normal;v=
ertical-align:baseline;white-space:pre-wrap">Weekly Project Engineering Syn=
c=C2=A0 - Tuesday 26th May. 8am PDT (</span><a href=3D"https://zoom.us/j/99=
0892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09" style=3D"text-decoration:no=
ne"><span style=3D"font-size:11pt;background-color:transparent;font-variant=
:normal;text-decoration:underline;vertical-align:baseline;white-space:pre-w=
rap">https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</sp=
an></a><a href=3D"https://zoom.us/j/990892712" style=3D"text-decoration:non=
e"><span style=3D"font-size:11pt;background-color:transparent;font-variant:=
normal;text-decoration:underline;vertical-align:baseline;white-space:pre-wr=
ap">)</span></a></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font=
-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:=
transparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" ro=
le=3D"presentation"><span style=3D"font-size:11pt;background-color:transpar=
ent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Yocto=
 Project Patch Review - Thursday 28th May 10am GMT and Monday 1st June 9am =
PDT (</span><a href=3D"https://zoom.us/j/97762397148?pwd=3D1xkiC9hp9SjEonaT=
aONwTb6iWry4Eb.1" style=3D"text-decoration:none"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant:normal;text-decoration:underl=
ine;vertical-align:baseline;white-space:pre-wrap">https://zoom.us/j/9776239=
</span></a><span style=3D"font-size:11pt;background-color:transparent;font-=
variant:normal;vertical-align:baseline;white-space:pre-wrap">7</span><a hre=
f=3D"https://zoom.us/j/97762397148?pwd=3D1xkiC9hp9SjEonaTaONwTb6iWry4Eb.1" =
style=3D"text-decoration:none"><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant:normal;text-decoration:underline;vertical-align=
:baseline;white-space:pre-wrap">148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1=
</span></a><span style=3D"font-size:11pt;background-color:transparent;font-=
variant:normal;vertical-align:baseline;white-space:pre-wrap">)</span></p></=
li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-alig=
n:baseline;white-space:pre-wrap">Project data dashboard: </span><a href=3D"=
https://dashboard.yoctoproject.org/" style=3D"text-decoration:none"><span s=
tyle=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:transp=
arent;font-variant:normal;text-decoration:underline;vertical-align:baseline=
;white-space:pre-wrap">https://dashboard.yoctoproject.org/</span></a><span =
style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">=C2=A0</span></p><br><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-fami=
ly:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre-wrap">Key Status/Updates=
:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" =
style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;c=
olor:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-a=
lign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-si=
ze:11pt;background-color:transparent;font-variant:normal;vertical-align:bas=
eline;white-space:pre-wrap">YP 5.0.18 is out of QA and under review.</span>=
</p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-=
family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-=
variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentatio=
n"><span style=3D"font-size:11pt;background-color:transparent;font-variant:=
normal;vertical-align:baseline;white-space:pre-wrap">YP 6.0.1 is in QA</spa=
n></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fon=
t-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fon=
t-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentat=
ion"><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t:normal;vertical-align:baseline;white-space:pre-wrap">We=E2=80=99re workin=
g through the backlog of patches, the bandwidth for changes needing in dept=
h review/feedback continues to be a challenge.</span></p></li><li dir=3D"lt=
r" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-seri=
f;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font=
-size:11pt;background-color:transparent;font-variant:normal;vertical-align:=
baseline;white-space:pre-wrap">Intermittent build failures continue to be p=
roblematic and unchanged from last week:</span></p></li><ul style=3D"margin=
-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle=
;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-co=
lor:transparent;font-variant:normal;vertical-align:baseline;white-space:pre=
"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tran=
sparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">s=
everal qemu =E2=80=98hang=E2=80=99 type issues</span></p></li><li dir=3D"lt=
r" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-se=
rif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;verti=
cal-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fo=
nt-size:11pt;background-color:transparent;font-variant:normal;vertical-alig=
n:baseline;white-space:pre-wrap">sometimes yocto-check-layer is showing che=
cksum mismatch issues</span></p></li><li dir=3D"ltr" style=3D"list-style-ty=
pe:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);back=
ground-color:transparent;font-variant:normal;vertical-align:baseline;white-=
space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-c=
olor:transparent;font-variant:normal;vertical-align:baseline;white-space:pr=
e-wrap">siggen reset issues (=E2=80=9CResourceWarning: unclosed transport=
=E2=80=9D)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;f=
ont-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" =
role=3D"presentation"><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">gro=
ff build race issues</span></p></li><li dir=3D"ltr" style=3D"list-style-typ=
e:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-co=
lor:transparent;font-variant:normal;vertical-align:baseline;white-space:pre=
-wrap">intermittent ptest failures in many recipes</span></p></li></ul><li =
dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,=
sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:norma=
l;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre-wrap">Is anyone using 32 bit SDKs, if so =
let us know. Qemu dropped support for 32 bit hosts and we are considering d=
iscontinuing 32 bit SDKs.</span></p></li><li dir=3D"ltr" style=3D"list-styl=
e-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);ba=
ckground-color:transparent;font-variant:normal;vertical-align:baseline;whit=
e-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background=
-color:transparent;font-variant:normal;vertical-align:baseline;white-space:=
pre-wrap">We are likely to merge the gcc 16 upgrade soon</span></p></li><li=
 dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial=
,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:norm=
al;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span sty=
le=3D"font-size:11pt;background-color:transparent;font-variant:normal;verti=
cal-align:baseline;white-space:pre-wrap">We would like to know what people =
are planning to work on for Yocto Project 6.1 and beyond. We have a roadmap=
 document in Google Docs: </span><a href=3D"https://docs.google.com/documen=
t/d/12xgAzSjDj5zVlo4eQIbiv1s3QMjtBTCvBFY3_T7OPto" style=3D"text-decoration:=
none"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt:normal;text-decoration:underline;vertical-align:baseline;white-space:pre=
-wrap">https://docs.google.com/document/d/12xgAzSjDj5zVlo4eQIbiv1s3QMjtBTCv=
BFY3_T7OPto</span></a></p></li><li dir=3D"ltr" style=3D"list-style-type:dis=
c;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-c=
olor:transparent;font-variant:normal;vertical-align:baseline;white-space:pr=
e"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tra=
nsparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">=
We are updating the project=E2=80=99s security team and welcome nominations=
 and/or feedback: </span><a href=3D"https://lists.openembedded.org/g/openem=
bedded-architecture/topic/119388716" style=3D"text-decoration:none"><span s=
tyle=3D"font-size:11pt;background-color:transparent;font-variant:normal;tex=
t-decoration:underline;vertical-align:baseline;white-space:pre-wrap">https:=
//lists.openembedded.org/g/openembedded-architecture/topic/119388716</span>=
</a></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-=
serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;ver=
tical-align:baseline;white-space:pre-wrap">Want to contribute? We would app=
reciate help with the following areas:</span></p><ul style=3D"margin-top:0p=
x;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-siz=
e:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:trans=
parent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">We have=
 several open issues for pseudo and limited maintainer time to work on them=
. Help from someone familiar with systems programming in C would be greatly=
 appreciated. </span><a href=3D"https://bugzilla.yoctoproject.org/buglist.c=
gi?list_id=3D661406&amp;priority=3DHigh&amp;priority=3DMedium%2B&amp;produc=
t=3DPseudo&amp;query_format=3Dadvanced&amp;resolution=3D---" style=3D"text-=
decoration:none"><span style=3D"font-size:11pt;background-color:transparent=
;font-variant:normal;text-decoration:underline;vertical-align:baseline;whit=
e-space:pre-wrap">https://bugzilla.yoctoproject.org/buglist.cgi?list_id=3D6=
61406&amp;priority=3DHigh&amp;priority=3DMedium%2B&amp;product=3DPseudo&amp=
;query_format=3Dadvanced&amp;resolution=3D---</span></a></p></li><li dir=3D=
"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-s=
erif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vert=
ical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"f=
ont-size:11pt;background-color:transparent;font-variant:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">There are a large number of intermittent =
failures on our autobuilder, any help with investigating, reproducing or so=
lving these issues would be welcome! </span><a href=3D"https://valkyrie.yoc=
to.io/pub/non-release/abint/" style=3D"text-decoration:none"><span style=3D=
"font-size:11pt;background-color:transparent;font-variant:normal;text-decor=
ation:underline;vertical-align:baseline;white-space:pre-wrap">https://valky=
rie.yocto.io/pub/non-release/abint/</span></a></p></li><li dir=3D"ltr" styl=
e=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant:normal;vertical-align:baselin=
e;white-space:pre-wrap">Many recipes in openembedded-core would benefit fro=
m a new recipe maintainer. Please look at </span><a href=3D"https://git.ope=
nembedded.org/openembedded-core/tree/meta/conf/distro/include/maintainers.i=
nc" style=3D"text-decoration:none"><span style=3D"font-size:11pt;background=
-color:transparent;font-variant:normal;text-decoration:underline;vertical-a=
lign:baseline;white-space:pre-wrap">https://git.openembedded.org/openembedd=
ed-core/tree/meta/conf/distro/include/maintainers.inc</span></a><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap"> and see if you can adopt any of the=
 unassigned recipes.</span></p></li><li dir=3D"ltr" style=3D"list-style-typ=
e:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgro=
und-color:transparent;font-variant:normal;vertical-align:baseline;white-spa=
ce:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-w=
rap">For more ways to contribute, see </span><a href=3D"https://docs.google=
.com/document/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9owFuCWbzgjOk/edit?usp=3Dsha=
ring" style=3D"text-decoration:none"><span style=3D"font-size:11pt;backgrou=
nd-color:transparent;font-variant:normal;text-decoration:underline;vertical=
-align:baseline;white-space:pre-wrap">https://docs.google.com/document/d/18=
oxKWxLorfF813h82mK6yKTIHeBp_-9owFuCWbzgjOk/edit?usp=3Dsharing</span></a></p=
></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;c=
olor:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-a=
lign:baseline;white-space:pre-wrap">New to the project?</span></p><ul style=
=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-t=
ype:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-co=
lor:transparent;font-variant:normal;vertical-align:baseline;white-space:pre=
-wrap">We have a list of issues we think are good places to start contribut=
ing: </span><a href=3D"https://bugzilla.yoctoproject.org/buglist.cgi?quicks=
earch=3DNEWCOMER" style=3D"text-decoration:none"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant:normal;text-decoration:underl=
ine;vertical-align:baseline;white-space:pre-wrap">https://bugzilla.yoctopro=
ject.org/buglist.cgi?quicksearch=3DNEWCOMER</span></a></p></li></ul><br><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><sp=
an style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);ba=
ckground-color:transparent;font-variant:normal;vertical-align:baseline;whit=
e-space:pre-wrap">Tracking Metrics:</span></p><ul style=3D"margin-top:0px;m=
argin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:1=
1pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpar=
ent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pr=
esentation"><span style=3D"font-size:11pt;background-color:transparent;font=
-variant:normal;vertical-align:baseline;white-space:pre-wrap">WDD 2660 (las=
t week 2673) </span><span style=3D"font-size:11pt;font-family:Consolas,sans=
-serif;background-color:transparent;font-variant:normal;vertical-align:base=
line;white-space:pre-wrap">(</span><a href=3D"https://wiki.yoctoproject.org=
/charts/combo.html" style=3D"text-decoration:none"><span style=3D"font-size=
:11pt;background-color:transparent;font-variant:normal;text-decoration:unde=
rline;vertical-align:baseline;white-space:pre-wrap">https://wiki.yoctoproje=
ct.org/charts/combo.html</span></a><span style=3D"font-size:11pt;font-famil=
y:Consolas,sans-serif;background-color:transparent;font-variant:normal;vert=
ical-align:baseline;white-space:pre-wrap">)</span></p></li><li dir=3D"ltr" =
style=3D"list-style-type:disc;font-size:11pt;font-family:Consolas,sans-seri=
f;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font=
-size:11pt;font-family:Arial,sans-serif;background-color:transparent;font-v=
ariant:normal;vertical-align:baseline;white-space:pre-wrap">OE-Core/Poky Pa=
tch Metrics</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><=
li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:A=
rial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:=
normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span=
 style=3D"font-size:11pt;background-color:transparent;font-variant:normal;v=
ertical-align:baseline;white-space:pre-wrap">Total patches found: 1083 (las=
t week 1083)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle=
;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-co=
lor:transparent;font-variant:normal;vertical-align:baseline;white-space:pre=
"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tran=
sparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">P=
atches in the Pending State: 148 (14%) [last week 148 (14%)</span></p></li>=
<li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:=
Consolas,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><=
a href=3D"https://valkyrie.yocto.io/pub/non-release/patchmetrics/" style=3D=
"text-decoration:none"><span style=3D"font-size:11pt;font-family:Arial,sans=
-serif;background-color:transparent;font-variant:normal;text-decoration:und=
erline;vertical-align:baseline;white-space:pre-wrap">https://valkyrie.yocto=
.io/pub/non-release/patchmetrics/</span></a></p></li></ul></ul><br><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">Upcoming development releases:</span></p><ul style=3D"margin=
-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;f=
ont-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" =
role=3D"presentation"><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">6.1=
 M1:=C2=A0</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><l=
i dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Ar=
ial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant:normal;ve=
rtical-align:baseline;white-space:pre-wrap">Build Date: w/c 2026-06-08</spa=
n></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;f=
ont-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;f=
ont-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"present=
ation"><span style=3D"font-size:11pt;background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre-wrap">Release Date: w/c =
2026-06-22</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:dis=
c;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-c=
olor:transparent;font-variant:normal;vertical-align:baseline;white-space:pr=
e"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tra=
nsparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">=
6.1 M2:</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li d=
ir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial=
,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:norm=
al;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span sty=
le=3D"font-size:11pt;background-color:transparent;font-variant:normal;verti=
cal-align:baseline;white-space:pre-wrap">Build Date: w/c 2026-07-20</span><=
/p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font=
-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font=
-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentati=
on"><span style=3D"font-size:11pt;background-color:transparent;font-variant=
:normal;vertical-align:baseline;white-space:pre-wrap">Release Date: w/c 202=
6-08-03</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;f=
ont-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" =
role=3D"presentation"><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">6.1=
 M3:</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=
=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">Build Date: w/c 2026-08-31</span></p=
></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-f=
amily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-v=
ariant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre-wrap">Release Date: w/c 2026-=
09-14</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;fon=
t-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:=
transparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" ro=
le=3D"presentation"><span style=3D"font-size:11pt;background-color:transpar=
ent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">6.1.0=
:</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"=
ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-=
serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;ver=
tical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"=
font-size:11pt;background-color:transparent;font-variant:normal;vertical-al=
ign:baseline;white-space:pre-wrap">Build Date (M4): w/c 2026-10-12</span></=
p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-=
family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-=
variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentatio=
n"><span style=3D"font-size:11pt;background-color:transparent;font-variant:=
normal;vertical-align:baseline;white-space:pre-wrap">Release Date: w/c 2026=
-11-02</span></p></li></ul></ul><br><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-fami=
ly:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre-wrap">Upcoming dot relea=
ses:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"lt=
r" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-seri=
f;background-color:transparent;font-variant:normal;vertical-align:baseline;=
white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-v=
ariant:normal;vertical-align:baseline;white-space:pre-wrap">YP 5.0.18 is in=
 review.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-=
size:11pt;font-family:Arial,sans-serif;background-color:transparent;font-va=
riant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline=
;white-space:pre-wrap">YP 6.0.1is in QA.</span></p></li><li dir=3D"ltr" sty=
le=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;back=
ground-color:transparent;font-variant:normal;vertical-align:baseline;white-=
space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-variant=
:normal;vertical-align:baseline;white-space:pre-wrap">YP 5.0.19</span></p><=
/li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D=
"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;backgro=
und-color:transparent;font-variant:normal;vertical-align:baseline;white-spa=
ce:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-variant:no=
rmal;vertical-align:baseline;white-space:pre-wrap">Build Date=C2=A0 2026-06=
-30</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-siz=
e:11pt;font-family:Arial,sans-serif;background-color:transparent;font-varia=
nt:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><s=
pan style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;whi=
te-space:pre-wrap">Release Date 2026-07-13</span></p></li></ul><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre-wrap">For future release dates, see </span><a hre=
f=3D"https://wiki.yoctoproject.org/wiki/Release_calendar" style=3D"text-dec=
oration:none"><span style=3D"font-size:11pt;background-color:transparent;fo=
nt-variant:normal;text-decoration:underline;vertical-align:baseline;white-s=
pace:pre-wrap">https://wiki.yoctoproject.org/wiki/Release_calendar</span></=
a></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-se=
rif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;verti=
cal-align:baseline;white-space:pre-wrap">The Yocto Project=E2=80=99s techni=
cal governance is through its Technical Steering Committee, more informatio=
n is available at:</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt"><a href=3D"https://wiki.yoctoproject.org/wiki/=
TSC" style=3D"text-decoration:none"><span style=3D"font-size:11pt;font-fami=
ly:Arial,sans-serif;background-color:transparent;font-variant:normal;text-d=
ecoration:underline;vertical-align:baseline;white-space:pre-wrap">https://w=
iki.yoctoproject.org/wiki/TSC</span></a></p><br><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11=
pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpare=
nt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">The St=
atus reports are now stored on the wiki at: </span><a href=3D"https://wiki.=
yoctoproject.org/wiki/Weekly_Status" style=3D"text-decoration:none"><span s=
tyle=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:transp=
arent;font-variant:normal;text-decoration:underline;vertical-align:baseline=
;white-space:pre-wrap">https://wiki.yoctoproject.org/wiki/Weekly_Status</sp=
an></a></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;c=
olor:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-a=
lign:baseline;white-space:pre-wrap">[If anyone has suggestions for other in=
formation you=E2=80=99d like to see on this weekly status update, let us kn=
ow!]</span></p></span><br class=3D"gmail-Apple-interchange-newline"></div><=
div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature=
"><div dir=3D"ltr"><div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"backgro=
und-image:initial;background-position:initial;background-repeat:initial"><s=
pan style=3D"font-size:12pt;font-family:Arial,sans-serif">Thanks,<span></sp=
an></span></p>

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

--000000000000e6a5890652b988ca--

