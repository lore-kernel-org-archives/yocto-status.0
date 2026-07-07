Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43D9C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 14:48:58 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.176104.1783435733333834409
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 07 Jul 2026 07:48:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QgMddaAz;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-37df72c9984so4222418a91.3
        for <yocto-status@lists.yoctoproject.org>; Tue, 07 Jul 2026 07:48:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783435733; cv=none;
        d=google.com; s=arc-20260327;
        b=A+x4Hdn56oGTZyI7SeV0clWpyHDK796By8+wxVjEK2QYDztEp65l1JVb7Wsg/5VXeV
         3Wno38SdYPLeSNY7NjBO9zyKrlP6m1BPGhhBfuMbULPtTyw0WRFSbNUVpochH1PuKXTA
         NbMBiLE5gpZfBcZRjwl71Cw51bubePsbQoVLosLffin28yphr4Hixtj47itPopHqsqdE
         7fxSOgYYW4po0fVqqf48qQnt5sUQ4GrMstOlRfTBW3mZWCvLaREjVrNXGnLfmy8tyHYv
         hxev6uloiyeplwZh44O0RX8VgPnqMxyxQVwM+lSbsseEg61agmHCHeGLWP/JgiywkBMV
         OBpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=k+WD4MGwcAL8cnkh18mTDyu4+4JrZr9bMPvKC6bsBIQ=;
        fh=sE9Yox7al7WovmnyRZqWNwk/Z/q9yIESrRe5DpWMQ80=;
        b=E+qT8UAUlsx2pOXzrk0ul29s7KDKCpivLwrzpph9U81brs71n2IcXqm6wpHLCPgCyE
         RGZ3VAyhtD1MELb++94IH8ErFHiLJM83wMWGNxYDztR83T9x0CUPEUw7PnWsUllEBjJD
         RkzYXVIc75SyqYK2sTu5+499kaAJHjj3VNSau/JkcdYY8KP5Mw07IJZBOyqhXKLUVAQV
         tBxsxXLQOVMknCUkrusfZndSt3PoekXVlOxjinm8dxHcNV+zTDtYJw0Y4UvKAArpFahS
         63Fj1CrmqtYoCCw9MakSbVd1USkz1TyMfYL2MKlbK2+pEX/PjqZTVE3D5KhWASdHAl/e
         t9Yw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435733; x=1784040533; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k+WD4MGwcAL8cnkh18mTDyu4+4JrZr9bMPvKC6bsBIQ=;
        b=QgMddaAzV4Q1ygvy4tcUDu+q/qiX2/7vQfIdzq02HAPdJu3KPL5E3rrgceSG6iQkTg
         5OKeyGUnMBRMRcgP0Sv3Rxg1AoVwjPcMLWvOuSqduGChhf31m/g7T51IMMjNNwtKkyJt
         7pIGXDVo/NvvZxsHsMvK2/5qQBINSq0M7Erp8Kkd/qtkdzzDzXFxoqutktk8gFVc5V7M
         qHDRXrzWqKvh0gpq3qHQ866JSHJjc30L6CKV61DqAjwHW9ybLmL+cQ2pmJ/jEvkkqyN4
         GurTO8E4SnPuSQKdv6ynvzxmxcAkOrO965oseZY1yDInPh34ciaRUl+iQQaMnb/I21Xl
         +Btg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435733; x=1784040533;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k+WD4MGwcAL8cnkh18mTDyu4+4JrZr9bMPvKC6bsBIQ=;
        b=s7L5+ZGJKITCTzFCrDaWT2EY7EhVe9IW2JLLLaWLxwK/LmU4uvqjz7/McFPdAUO5ON
         GrCO/RDMZsfwUmIKJgdx/UNfR4h8TgBxlVkPRx15aB8VVshP5r0L082YVdDN5GI1fUZ/
         PR8HZZWznK96pwSsMFYO8hJpbsLvarWFuo9IKdZyB2ZHcVGT8VMZ0fwHtGO/p7OpA8JK
         UH0oaXaIbrBL62nrzeBzuVLPqjAFEanYlZrhcYylIoBN7SqNwBXnIu/7ozICHEQX0OO4
         s8Bqc/ThSyFajqytzxPECnhvFHk29oFQ3kOci2fk0Mnj4auYHXt4OtyZ/b/rZek0a633
         N5/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrEZe3zsad9ph1jgZN3hX8KtdIHS51NAA95QyrIUx+xz/KNX9QRYhfTtU7KAC1iHgMvAfMQXqgGyQgOOpU=@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwNA+5c52F/ZDxCC+0Jr85SeNsE3DTbpTbnfk8DueDQJb4OoI1t
	teslJnQQ959KaBEg1bS8qxThyKZpFGyoxPxNXnnx5d/ET/5LkyepD1k5ZhBfi9XyzQ25f7RKYQ2
	/5I5jJtoeM3ODDuwcR5J+Go0WA1f3x0A=
X-Gm-Gg: AfdE7cniAy4Yf992iihNw3R0Jmz510fM5jMjLoEtcH8OItY0G5E0+3n5YJle8gQKFR6
	tbQLF7brgqV6Y9PN/pJtCbCmWh5hHqQyjuayz5Ox7FokIaAI7G6dbtLUG6NG95yFG9TKFjx0mOO
	ID/FBBVshhZGTf2wF+hQx9oQ30Vbl7n6empB6LjewHKaLdbNrTaC3jlTTi0vX+1to52slnR4ndn
	93SwQ/8MJFbzzF/2KoNOlV17acH5Qbiurl/DbvmqiPm8lhQBwDdTC6ZpEaIL18etZC61IRwpWuT
	bVxvPtE7NKIxY1roDbs5JaAfMayFO2utAP5bHWe2as8qt7hRTzXqhPJ9ShA3P5E0FEIWMDr8Yw8
	dNv1UHKpSJzy4x9HfHiyaB9HXfV9LDS8vMdwxGzChxbaiMxu/j7oLZ32fiubs9+2oKhNPpX4=
X-Received: by 2002:a17:90b:33c9:b0:387:e0cb:7f6 with SMTP id
 98e67ed59e1d1-387e0cb0ba8mr2896862a91.42.1783435732382; Tue, 07 Jul 2026
 07:48:52 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 7 Jul 2026 07:48:41 -0700
X-Gm-Features: AVVi8Cd5eF4N8FVQoyP9x5wTOHotXSnpFtOswKubtC5eP2u_fmpUVRk7YrbNHnM
Message-ID: <CAK5yBb8P6BwUm_VGAbUiDFp5LOHe4gL_1F9HG1joS4Js4xVDJQ@mail.gmail.com>
Subject: Yocto Project Status 7 July 2026 (WW28)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000004ef9f70656067dc0"
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Tue, 07 Jul 2026 14:48:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/129

--0000000000004ef9f70656067dc0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 6.1 M2

Next Deadline: YP 6.1 M2: w/c 2026-07-20

Next Team Meetings:

   -

   Bug Triage meeting - Thursday 9th July 7:30am PDT (
   https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
   -

   Weekly Project Engineering Sync  - Tuesday 7th July 8am PDT (
   https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
   <https://zoom.us/j/990892712>
   -

   Yocto Project Patch Review - Thursday 9th July 10am GMT and Monday 13th
   July 9am PDT (
   https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1)


Project data dashboard: https://dashboard.yoctoproject.org/

Key Status/Updates:

   -

   YP 6.1 M1 was released
   -

   YP 6.0.2 is in review
   -

   YP 5.0.19 is in QA
   -

   We are now two weeks away from M2!
   -

   We have identified a few linux-yocto CVEs which need triaging due to
   missing version information in the CVE databases (affecting master, wryn=
ose
   and scarthgap), see the email sent to the list:
   https://lists.yoctoproject.org/g/yocto/topic/120036383
   -

   We are having some challenges with the autobuilder, both with an NFS
   server open file/lock build up of some kind causing slowdown and eventua=
l
   halting of write operations and also a mkdir cache race issue. We are
   working to debug both issues but it is distracting from other work like
   patch review and new development (e.g. layer.conf format changes).
   -

   Systemd issues with older host kernels (e.g. RHEL 8) is still being
   worked on
   https://lists.openembedded.org/g/openembedded-architecture/topic/1198703=
59
   -

   We have become aware we should ideally replace eudev with a minimal udev
   build from systemd instead similar to what some other distros are doing.
   -

   We continue to see high load on our infrastructure due to bots and AI
   scraping. This has primarily caused timeouts and errors accessing
   git.openembedded.org & git.yoctoproject.org. We have mitigations in
   place for now. Traditional git:// protocol continues to be disabled.
   -

   We=E2=80=99re working through the backlog of patches, the bandwidth for =
changes
   needing in depth review/feedback continues to be a challenge.
   -

   A key pseudo memory corruption issue when interacting with bash was
   identified and patches are being worked on for a new pseudo release to
   address this.
   -

   Intermittent build failures continue to be problematic:
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

   We would like to know what people are planning to work on for Yocto
   Project 6.1 and beyond. We have a roadmap document in Google Docs:
   https://docs.google.com/document/d/12xgAzSjDj5zVlo4eQIbiv1s3QMjtBTCvBFY3=
_T7OPto


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

   WDD 2689 (last week 2647) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   OE-Core/Poky Patch Metrics
   -

      Total patches found: 1037 (last week 1036)
      -

      Patches in the Pending State: 145 (14%) [last week 145 (14%)]
      -

      https://valkyrie.yocto.io/pub/non-release/patchmetrics/


Upcoming development releases:

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

   YP 5.0.19 is in QA.
   -

      Release Date w/c 2026-07-13
      -

   YP 6.0.3
   -

      Build Date w/c 2026-08-10
      -

      Release Date w/c 2026-08-24
      -

   YP 5.0.20
   -

      Build Date w/c 2026-08-17
      -

      Release Date w/c 2026-08-31
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

--0000000000004ef9f70656067dc0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span id=3D"gmail-docs-internal-guid-4e163694-7fff-18=
04-6819-e45c784b43bf"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-=
serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;ver=
tical-align:baseline;white-space:pre-wrap">Current Dev Position: YP 6.1 M2<=
/span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align:=
baseline;white-space:pre-wrap">Next Deadline: YP 6.1 M2: w/c 2026-07-20</sp=
an></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre-wrap">Next Team Meetings:</span></p><ul style=3D"=
margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:=
disc;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-variant:normal;vertical-align:baseline;white-spac=
e:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color=
:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-wr=
ap">Bug Triage meeting - Thursday 9th July 7:30am PDT (</span><a href=3D"ht=
tps://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09" style=3D"=
text-decoration:none"><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant:normal;text-decoration:underline;vertical-align:baseline=
;white-space:pre-wrap">https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bF=
d5aVpHVVZ6dz09</span></a><span style=3D"font-size:11pt;background-color:tra=
nsparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">=
)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:9.=
5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpar=
ent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pr=
esentation"><span style=3D"font-size:11pt;background-color:transparent;font=
-variant:normal;vertical-align:baseline;white-space:pre-wrap">Weekly Projec=
t Engineering Sync=C2=A0 - Tuesday 7th July 8am PDT (</span><a href=3D"http=
s://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09" style=3D"te=
xt-decoration:none"><span style=3D"font-size:11pt;background-color:transpar=
ent;font-variant:normal;text-decoration:underline;vertical-align:baseline;w=
hite-space:pre-wrap">https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcr=
YjRrcmJsUT09</span></a><a href=3D"https://zoom.us/j/990892712" style=3D"tex=
t-decoration:none"><span style=3D"font-size:11pt;background-color:transpare=
nt;font-variant:normal;text-decoration:underline;vertical-align:baseline;wh=
ite-space:pre-wrap">)</span></a></p></li><li dir=3D"ltr" style=3D"list-styl=
e-type:disc;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);b=
ackground-color:transparent;font-variant:normal;vertical-align:baseline;whi=
te-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant:normal;vertical-align:baseline;white-space=
:pre-wrap">Yocto Project Patch Review - Thursday 9th July 10am GMT and Mond=
ay 13th July 9am PDT (</span><a href=3D"https://zoom.us/j/97762397148?pwd=
=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1" style=3D"text-decoration:none"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant:normal;te=
xt-decoration:underline;vertical-align:baseline;white-space:pre-wrap">https=
://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1</span></a>=
<span style=3D"font-size:11pt;background-color:transparent;font-variant:nor=
mal;vertical-align:baseline;white-space:pre-wrap">)</span></p></li></ul><br=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0=
);background-color:transparent;font-variant:normal;vertical-align:baseline;=
white-space:pre-wrap">Project data dashboard: </span><a href=3D"https://das=
hboard.yoctoproject.org/" style=3D"text-decoration:none"><span style=3D"fon=
t-size:11pt;font-family:Arial,sans-serif;background-color:transparent;font-=
variant:normal;text-decoration:underline;vertical-align:baseline;white-spac=
e:pre-wrap">https://dashboard.yoctoproject.org/</span></a><span style=3D"fo=
nt-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color=
:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-wr=
ap">=C2=A0</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sa=
ns-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;=
vertical-align:baseline;white-space:pre-wrap">Key Status/Updates:</span></p=
><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"li=
st-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,=
0,0);background-color:transparent;font-variant:normal;vertical-align:baseli=
ne;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;bac=
kground-color:transparent;font-variant:normal;vertical-align:baseline;white=
-space:pre-wrap">YP 6.1 M1 was released</span></p></li><li dir=3D"ltr" styl=
e=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant:normal;vertical-align:baselin=
e;white-space:pre-wrap">YP 6.0.2 is in review</span></p></li><li dir=3D"ltr=
" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical=
-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-=
size:11pt;background-color:transparent;font-variant:normal;vertical-align:b=
aseline;white-space:pre-wrap">YP 5.0.19 is in QA</span></p></li><li dir=3D"=
ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-se=
rif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;verti=
cal-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fo=
nt-size:11pt;background-color:transparent;font-variant:normal;vertical-alig=
n:baseline;white-space:pre-wrap">We are now two weeks away from M2!</span><=
/p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-f=
amily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-v=
ariant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre-wrap">We have identified a fe=
w linux-yocto CVEs which need triaging due to missing version information i=
n the CVE databases (affecting master, wrynose and scarthgap), see the emai=
l sent to the list: </span><a href=3D"https://lists.yoctoproject.org/g/yoct=
o/topic/120036383" style=3D"text-decoration:none"><span style=3D"font-size:=
11pt;background-color:transparent;font-variant:normal;text-decoration:under=
line;vertical-align:baseline;white-space:pre-wrap">https://lists.yoctoproje=
ct.org/g/yocto/topic/120036383</span></a></p></li><li dir=3D"ltr" style=3D"=
list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(=
0,0,0);background-color:transparent;font-variant:normal;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;b=
ackground-color:transparent;font-variant:normal;vertical-align:baseline;whi=
te-space:pre-wrap">We are having some challenges with the autobuilder, both=
 with an NFS server open file/lock build up of some kind causing slowdown a=
nd eventual halting of write operations and also a mkdir cache race issue. =
We are working to debug both issues but it is distracting from other work l=
ike patch review and new development (e.g. layer.conf format changes).</spa=
n></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fon=
t-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fon=
t-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentat=
ion"><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t:normal;vertical-align:baseline;white-space:pre-wrap">Systemd issues with =
older host kernels (e.g. RHEL 8) is still being worked on </span><a href=3D=
"https://lists.openembedded.org/g/openembedded-architecture/topic/119870359=
" style=3D"text-decoration:none"><span style=3D"font-size:11pt;background-c=
olor:transparent;font-variant:normal;text-decoration:underline;vertical-ali=
gn:baseline;white-space:pre-wrap">https://lists.openembedded.org/g/openembe=
dded-architecture/topic/119870359</span></a></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align:=
baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11=
pt;background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre-wrap">We have become aware we should ideally replace eudev=
 with a minimal udev build from systemd instead similar to what some other =
distros are doing.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:=
disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgroun=
d-color:transparent;font-variant:normal;vertical-align:baseline;white-space=
:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:=
transparent;font-variant:normal;vertical-align:baseline;white-space:pre-wra=
p">We continue to see high load on our infrastructure due to bots and AI sc=
raping. This has primarily caused timeouts and errors accessing </span><a h=
ref=3D"http://git.openembedded.org" style=3D"text-decoration:none"><span st=
yle=3D"font-size:11pt;background-color:transparent;font-variant:normal;text=
-decoration:underline;vertical-align:baseline;white-space:pre-wrap">git.ope=
nembedded.org</span></a><span style=3D"font-size:11pt;background-color:tran=
sparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap"> =
&amp; </span><a href=3D"http://git.yoctoproject.org" style=3D"text-decorati=
on:none"><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant:normal;text-decoration:underline;vertical-align:baseline;white-space:=
pre-wrap">git.yoctoproject.org</span></a><span style=3D"font-size:11pt;back=
ground-color:transparent;font-variant:normal;vertical-align:baseline;white-=
space:pre-wrap">. We have mitigations in place for now. Traditional git:// =
protocol continues to be disabled.</span></p></li><li dir=3D"ltr" style=3D"=
list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(=
0,0,0);background-color:transparent;font-variant:normal;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;b=
ackground-color:transparent;font-variant:normal;vertical-align:baseline;whi=
te-space:pre-wrap">We=E2=80=99re working through the backlog of patches, th=
e bandwidth for changes needing in depth review/feedback continues to be a =
challenge.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;fon=
t-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:=
transparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" ro=
le=3D"presentation"><span style=3D"font-size:11pt;background-color:transpar=
ent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">A key=
 pseudo memory corruption issue when interacting with bash was identified a=
nd patches are being worked on for a new pseudo release to address this.</s=
pan></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;f=
ont-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;f=
ont-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"present=
ation"><span style=3D"font-size:11pt;background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre-wrap">Intermittent build=
 failures continue to be problematic:</span></p></li><ul style=3D"margin-to=
p:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;fo=
nt-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color=
:transparent;font-variant:normal;vertical-align:baseline;white-space:pre"><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" r=
ole=3D"presentation"><span style=3D"font-size:11pt;background-color:transpa=
rent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">seve=
ral qemu =E2=80=98hang=E2=80=99 type issues</span></p></li><li dir=3D"ltr" =
style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical=
-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-=
size:11pt;background-color:transparent;font-variant:normal;vertical-align:b=
aseline;white-space:pre-wrap">sometimes yocto-check-layer is showing checks=
um mismatch issues</span></p></li><li dir=3D"ltr" style=3D"list-style-type:=
circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgro=
und-color:transparent;font-variant:normal;vertical-align:baseline;white-spa=
ce:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-w=
rap">siggen reset issues (=E2=80=9CResourceWarning: unclosed transport=E2=
=80=9D)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font=
-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:t=
ransparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" rol=
e=3D"presentation"><span style=3D"font-size:11pt;background-color:transpare=
nt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">groff =
build race issues</span></p></li><li dir=3D"ltr" style=3D"list-style-type:c=
ircle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-variant:normal;vertical-align:baseline;white-spac=
e:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color=
:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-wr=
ap">intermittent ptest failures in many recipes</span></p></li></ul><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;v=
ertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">We would like to know what people ar=
e planning to work on for Yocto Project 6.1 and beyond. We have a roadmap d=
ocument in Google Docs: </span><a href=3D"https://docs.google.com/document/=
d/12xgAzSjDj5zVlo4eQIbiv1s3QMjtBTCvBFY3_T7OPto" style=3D"text-decoration:no=
ne"><span style=3D"font-size:11pt;background-color:transparent;font-variant=
:normal;text-decoration:underline;vertical-align:baseline;white-space:pre-w=
rap">https://docs.google.com/document/d/12xgAzSjDj5zVlo4eQIbiv1s3QMjtBTCvBF=
Y3_T7OPto</span></a></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-va=
riant:normal;vertical-align:baseline;white-space:pre-wrap">Want to contribu=
te? We would appreciate help with the following areas:</span></p><ul style=
=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-t=
ype:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-co=
lor:transparent;font-variant:normal;vertical-align:baseline;white-space:pre=
-wrap">We have several open issues for pseudo and limited maintainer time t=
o work on them. Help from someone familiar with systems programming in C wo=
uld be greatly appreciated. </span><a href=3D"https://bugzilla.yoctoproject=
.org/buglist.cgi?list_id=3D661406&amp;priority=3DHigh&amp;priority=3DMedium=
%2B&amp;product=3DPseudo&amp;query_format=3Dadvanced&amp;resolution=3D---" =
style=3D"text-decoration:none"><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant:normal;text-decoration:underline;vertical-align=
:baseline;white-space:pre-wrap">https://bugzilla.yoctoproject.org/buglist.c=
gi?list_id=3D661406&amp;priority=3DHigh&amp;priority=3DMedium%2B&amp;produc=
t=3DPseudo&amp;query_format=3Dadvanced&amp;resolution=3D---</span></a></p><=
/li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-famil=
y:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varia=
nt:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><s=
pan style=3D"font-size:11pt;background-color:transparent;font-variant:norma=
l;vertical-align:baseline;white-space:pre-wrap">There are a large number of=
 intermittent failures on our autobuilder, any help with investigating, rep=
roducing or solving these issues would be welcome! </span><a href=3D"https:=
//valkyrie.yocto.io/pub/non-release/abint/" style=3D"text-decoration:none">=
<span style=3D"font-size:11pt;background-color:transparent;font-variant:nor=
mal;text-decoration:underline;vertical-align:baseline;white-space:pre-wrap"=
>https://valkyrie.yocto.io/pub/non-release/abint/</span></a></p></li><li di=
r=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sa=
ns-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;=
vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">Many recipes in openembedded-core wo=
uld benefit from a new recipe maintainer. Please look at </span><a href=3D"=
https://git.openembedded.org/openembedded-core/tree/meta/conf/distro/includ=
e/maintainers.inc" style=3D"text-decoration:none"><span style=3D"font-size:=
11pt;background-color:transparent;font-variant:normal;text-decoration:under=
line;vertical-align:baseline;white-space:pre-wrap">https://git.openembedded=
.org/openembedded-core/tree/meta/conf/distro/include/maintainers.inc</span>=
</a><span style=3D"font-size:11pt;background-color:transparent;font-variant=
:normal;vertical-align:baseline;white-space:pre-wrap"> and see if you can a=
dopt any of the unassigned recipes.</span></p></li><li dir=3D"ltr" style=3D=
"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb=
(0,0,0);background-color:transparent;font-variant:normal;vertical-align:bas=
eline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;=
background-color:transparent;font-variant:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">For more ways to contribute, see </span><a href=3D"http=
s://docs.google.com/document/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9owFuCWbzgjOk=
/edit?usp=3Dsharing" style=3D"text-decoration:none"><span style=3D"font-siz=
e:11pt;background-color:transparent;font-variant:normal;text-decoration:und=
erline;vertical-align:baseline;white-space:pre-wrap">https://docs.google.co=
m/document/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9owFuCWbzgjOk/edit?usp=3Dsharin=
g</span></a></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Ari=
al,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:no=
rmal;vertical-align:baseline;white-space:pre-wrap">New to the project?</spa=
n></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align:=
baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11=
pt;background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre-wrap">We have a list of issues we think are good places to=
 start contributing: </span><a href=3D"https://bugzilla.yoctoproject.org/bu=
glist.cgi?quicksearch=3DNEWCOMER" style=3D"text-decoration:none"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant:normal;text-d=
ecoration:underline;vertical-align:baseline;white-space:pre-wrap">https://b=
ugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DNEWCOMER</span></a></p><=
/li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;col=
or:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">Tracking Metrics:</span></p><ul style=3D"=
margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:=
disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgroun=
d-color:transparent;font-variant:normal;vertical-align:baseline;white-space=
:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:=
transparent;font-variant:normal;vertical-align:baseline;white-space:pre-wra=
p">WDD 2689 (last week 2647) </span><span style=3D"font-size:11pt;font-fami=
ly:Consolas,sans-serif;background-color:transparent;font-variant:normal;ver=
tical-align:baseline;white-space:pre-wrap">(</span><a href=3D"https://wiki.=
yoctoproject.org/charts/combo.html" style=3D"text-decoration:none"><span st=
yle=3D"font-size:11pt;background-color:transparent;font-variant:normal;text=
-decoration:underline;vertical-align:baseline;white-space:pre-wrap">https:/=
/wiki.yoctoproject.org/charts/combo.html</span></a><span style=3D"font-size=
:11pt;font-family:Consolas,sans-serif;background-color:transparent;font-var=
iant:normal;vertical-align:baseline;white-space:pre-wrap">)</span></p></li>=
<li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Co=
nsolas,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varian=
t:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><sp=
an style=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:tr=
ansparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap"=
>OE-Core/Poky Patch Metrics</span></p></li><ul style=3D"margin-top:0px;marg=
in-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11=
pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpare=
nt;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pre=
sentation"><span style=3D"font-size:11pt;background-color:transparent;font-=
variant:normal;vertical-align:baseline;white-space:pre-wrap">Total patches =
found: 1037 (last week 1036)</span></p></li><li dir=3D"ltr" style=3D"list-s=
tyle-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">Patches in the Pending State: 145 (14%) [last week 145 (14%)=
]</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:=
11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);background-color:tran=
sparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><a href=3D"https://valkyrie.yocto.io/pub/non-release/patc=
hmetrics/" style=3D"text-decoration:none"><span style=3D"font-size:11pt;fon=
t-family:Arial,sans-serif;background-color:transparent;font-variant:normal;=
text-decoration:underline;vertical-align:baseline;white-space:pre-wrap">htt=
ps://valkyrie.yocto.io/pub/non-release/patchmetrics/</span></a></p></li></u=
l></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre-wrap">Upcoming development releases:</span></p><u=
l style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-=
style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0=
);background-color:transparent;font-variant:normal;vertical-align:baseline;=
white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgr=
ound-color:transparent;font-variant:normal;vertical-align:baseline;white-sp=
ace:pre-wrap">6.1 M2:</span></p></li><ul style=3D"margin-top:0px;margin-bot=
tom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;fon=
t-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fon=
t-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentat=
ion"><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t:normal;vertical-align:baseline;white-space:pre-wrap">Build Date: w/c 2026=
-07-20</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-=
size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Release=
 Date: w/c 2026-08-03</span></p></li></ul><li dir=3D"ltr" style=3D"list-sty=
le-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);b=
ackground-color:transparent;font-variant:normal;vertical-align:baseline;whi=
te-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant:normal;vertical-align:baseline;white-space=
:pre-wrap">6.1 M3:</span></p></li><ul style=3D"margin-top:0px;margin-bottom=
:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-f=
amily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-v=
ariant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre-wrap">Build Date: w/c 2026-08=
-31</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-siz=
e:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:trans=
parent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Release=
 Date: w/c 2026-09-14</span></p></li></ul><li dir=3D"ltr" style=3D"list-sty=
le-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);b=
ackground-color:transparent;font-variant:normal;vertical-align:baseline;whi=
te-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant:normal;vertical-align:baseline;white-space=
:pre-wrap">6.1.0:</span></p></li><ul style=3D"margin-top:0px;margin-bottom:=
0px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-va=
riant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre-wrap">Build Date (M4): w/c 20=
26-10-12</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;fon=
t-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:=
transparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" ro=
le=3D"presentation"><span style=3D"font-size:11pt;background-color:transpar=
ent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Relea=
se Date: w/c 2026-11-02</span></p></li></ul></ul><br><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap"=
>Upcoming dot releases:</span></p><ul style=3D"margin-top:0px;margin-bottom=
:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fam=
ily:Arial,sans-serif;background-color:transparent;font-variant:normal;verti=
cal-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fo=
nt-size:11pt;font-variant:normal;vertical-align:baseline;white-space:pre-wr=
ap">YP 5.0.19 is in QA.</span></p></li><ul style=3D"margin-top:0px;margin-b=
ottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;f=
ont-family:Arial,sans-serif;background-color:transparent;font-variant:norma=
l;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span styl=
e=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;white-space=
:pre-wrap">Release Date w/c 2026-07-13</span></p></li></ul><li dir=3D"ltr" =
style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;b=
ackground-color:transparent;font-variant:normal;vertical-align:baseline;whi=
te-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-vari=
ant:normal;vertical-align:baseline;white-space:pre-wrap">YP 6.0.3</span></p=
></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=
=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;back=
ground-color:transparent;font-variant:normal;vertical-align:baseline;white-=
space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-variant=
:normal;vertical-align:baseline;white-space:pre-wrap">Build Date w/c 2026-0=
8-10</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-si=
ze:11pt;font-family:Arial,sans-serif;background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><=
span style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">Release Date w/c 2026-08-24</span></p></li></ul><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,san=
s-serif;background-color:transparent;font-variant:normal;vertical-align:bas=
eline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;=
font-variant:normal;vertical-align:baseline;white-space:pre-wrap">YP 5.0.20=
</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"l=
tr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-s=
erif;background-color:transparent;font-variant:normal;vertical-align:baseli=
ne;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;fon=
t-variant:normal;vertical-align:baseline;white-space:pre-wrap">Build Date w=
/c 2026-08-17</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circl=
e;font-size:11pt;font-family:Arial,sans-serif;background-color:transparent;=
font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presen=
tation"><span style=3D"font-size:11pt;font-variant:normal;vertical-align:ba=
seline;white-space:pre-wrap">Release Date w/c 2026-08-31</span></p></li></u=
l><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:=
Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant=
:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><spa=
n style=3D"font-size:11pt;background-color:transparent;font-variant:normal;=
vertical-align:baseline;white-space:pre-wrap">For future release dates, see=
 </span><a href=3D"https://wiki.yoctoproject.org/wiki/Release_calendar" sty=
le=3D"text-decoration:none"><span style=3D"font-size:11pt;background-color:=
transparent;font-variant:normal;text-decoration:underline;vertical-align:ba=
seline;white-space:pre-wrap">https://wiki.yoctoproject.org/wiki/Release_cal=
endar</span></a></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family=
:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varian=
t:normal;vertical-align:baseline;white-space:pre-wrap">The Yocto Project=E2=
=80=99s technical governance is through its Technical Steering Committee, m=
ore information is available at:</span></p><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt"><a href=3D"https://wiki.yoctopro=
ject.org/wiki/TSC" style=3D"text-decoration:none"><span style=3D"font-size:=
11pt;font-family:Arial,sans-serif;background-color:transparent;font-variant=
:normal;text-decoration:underline;vertical-align:baseline;white-space:pre-w=
rap">https://wiki.yoctoproject.org/wiki/TSC</span></a></p><br><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant:normal;vertical-align:baseline;white-space:=
pre-wrap">The Status reports are now stored on the wiki at: </span><a href=
=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status" style=3D"text-decorat=
ion:none"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;backgr=
ound-color:transparent;font-variant:normal;text-decoration:underline;vertic=
al-align:baseline;white-space:pre-wrap">https://wiki.yoctoproject.org/wiki/=
Weekly_Status</span></a></p><br><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:A=
rial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:=
normal;vertical-align:baseline;white-space:pre-wrap">[If anyone has suggest=
ions for other information you=E2=80=99d like to see on this weekly status =
update, let us know!]</span></p></span><br class=3D"gmail-Apple-interchange=
-newline"></div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><p class=3D"MsoNorma=
l" style=3D"background-image:initial;background-position:initial;background=
-repeat:initial"><span style=3D"font-size:12pt;font-family:Arial,sans-serif=
">Thanks,<span></span></span></p>

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

--0000000000004ef9f70656067dc0--

