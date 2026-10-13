Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB017CC6B08
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 14:52:06 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9068.1791903125514526979
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 13 Oct 2026 07:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KZEw50SJ;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33fb4680717so725468eec.1
        for <yocto-status@lists.yoctoproject.org>; Tue, 13 Oct 2026 07:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791903125; cv=none;
        d=google.com; s=arc-20260327;
        b=h/kgJp4SjPWT8tVBAL3enKGN1KHbG/NBOqojYDUEOE0a54W0s5RFzKeOO2pefIh6IV
         4AsClPlciuDCSh++0jVRY+AL2uV2TnVkAbHlw2wRhS27uJA90OQjWXNNaXViUGs5X1/c
         OmyQXLKJMqoqKR5mP3mYZsuqWqF2sLTgEX8HnhBImFjUSIzKGLBunY+8/8SoDbUB4i5V
         9LGUDFthN5buhMOc+Ksz+AnxqnXI8uKFi38Gm/rQ2vDXs8dgS4FFa6s6omF6w8ImMe+b
         lD99+KNDzeAiYBrgXte8NenK+/HUjYQ97ste7e4mopxiD3etbPtWA8aRzaRajt7gokKe
         BPdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=QLpfvy2BCCBoQjVC1K0CMxHYvYk0VFr7zPMgrb2I6pw=;
        fh=hYoqI/8lIGM8urhHyETj4r38XhStvrFbPMAbtjHEvPE=;
        b=jc+nU2P7Cfxv7jJ54ournDmiWQW2QA9495hgEzZz4pYiQG8lxqHvpTQds51uw+HLx9
         qC9ZwTPgGX0ogxLPkyIBy9Zl1hJjgAQ7hNVO2Jk/5xOVXFUXJiLC8SUbPv5lYOMEU5bs
         YmlTVehdMPAorSCO3vfhkWo103AIOUEl/J8G7j5sqXPqPNksnsCdmuIt4Bk8g6lLyZVV
         Pc3zvbJmM3XxYOqif61kZliAUsjp82sc3ICMMl34h1SjNsBG8TWDxChQNyhGeCJDw4Pv
         r44ck40mCXg/X37U46XGEW7funA6nt0y7yEcq88UmzDxZyWvmWh+tgzUyNLSBOQKl6F3
         I4Ng==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791903125; x=1792507925; darn=lists.yoctoproject.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QLpfvy2BCCBoQjVC1K0CMxHYvYk0VFr7zPMgrb2I6pw=;
        b=KZEw50SJ9vSPZweq2z/UkE4UJE3McQ2kFisReMUu8EuKN+p49EEsNr3aCTGHBEdLu8
         bWoTokw2dqXM9TU444fjhODav/g+cuF4Ixfwrs+XdIhRLIoDhN6LRtjMqq7vvlEThT59
         1NPqJP7juPokT5UqeNk2NFbsuIuDRxH4Yu6ijLR5X0OmwWMjjz8UtX3TqzKW0TnbZ3NG
         PWaD8+0/4L30ccM5A/hfPwgJq+bAL/AuEVUhw4JVwIjvnrlWxy2CUkzTA/xla/MsqdPM
         xPg47ZybyySWedLEadObHIlqRn0Bjkqj8yOsWGNRW8kI88rs68Oa6cb1nZONcyRsxiWO
         Gb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791903125; x=1792507925;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QLpfvy2BCCBoQjVC1K0CMxHYvYk0VFr7zPMgrb2I6pw=;
        b=AYcOpoWk1SL+N+yyPxblMG8KqusTkz8n3jjSy9FvU5fHO5oU+Q3wLjziTCA60O6zff
         kShv4W5yPjRqaTiOYQh0SBZeW1rK7DkpAoH7PaTj/ZjFboqTD1F7562W02Jtq+7hx34E
         WC8BRfktbG9l9cvWVvKCsjt/gYNf17GWCtX66Mt4+BN8hCs4aqQJ8GHDgDcFXp4Q8Ygs
         qcgOZDw36q31QB8AP91ctepDBOf3d1eFQlwwWUds9dqN1W23RtnD43S5eNoTPj9XgEEg
         wyAill/zTPA5U1ShAX5yBI0c8IDiV7bbW+lPp9MjgrQyb2W6MwIfHbi56ZyniPbFQ0yD
         dmRQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5Hr/bO+yfEvaEq0kmXIoz8H3OOnJVZC2elNem20lwYAo/G+2FVheb52Glwbpa6S5owg5s0TPTc7ShnMg=@lists.yoctoproject.org
X-Gm-Message-State: AFq9FYJiBLaNmG+4s5bP2jhWLyO+xYWECQJ/Tj5h26RoXDrrNBBOX8NB
	9d7mmnzsczwIarcM5x10lwOeC4x3OY9Z5TRO3DSH7928LZ9lwV+0ZRxU4vBehf+hSRN5mMrtna/
	drkSYVMr976ZXXvZzYGaXnONLkoajSGA=
X-Gm-Gg: AYBFou3wqAEkwrQlfYZFomr0oMUj5wKsmYcgefk55WwNWqxBI3XHiHSG4OhAvAYpIf4
	IW5L/Bb4765uoCLe7V9WxHV8i+I5C8C3XDV6vW6esfceMnzvpOCDC+grAsVJCeabOf0wi/l5Zmz
	6z/iBA0ClPpypqET9rUByQZZB+aqbbZTKxhO6UWA5OqSdFhgPfuX31ArB4GiLyqPk2RCWwWRChW
	qkf7/vhNsPKxMPWtnj5Dm1VD6z9ZqHefIU9cGyWJPh85tBJcyEJYP59KqMbIFbW3OpaHXJcY6bT
	k8yI273tYnchy+bjkuHS4ZkglEB0UoiG6pkmSXvKdIuZ7r4DWAmSB4v+Jk0mDiL+sAoM34OdWoT
	j052mbqaPT5s21Zn1XGDr8v8j40hw4xiQOUZXnYw4L6+AKLrjn34gXtKndJqjcjs4ATG9zx6F8j
	QGhkEr38751vK/DBf0mumn6lhGBF/VcpgSMMh53FnYnHc48+twa/DOa1X8MAJnfEe2Suio61YSR
	CorZyuOZCr6YZcVjIT4zAhVeJZj9IYoM4QE0jFrkmEHeYOSGg==
X-Received: by 2002:a05:7301:188a:b0:358:7bea:88d5 with SMTP id
 5a478bee46e88-3587bea9608mr15488232eec.21.1791903124123; Tue, 13 Oct 2026
 07:52:04 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 13 Oct 2026 07:51:51 -0700
X-Gm-Features: AclHuK_GZfJRuhEaqvRYteLWpVr0eH-4D89CQCgWGdZC5zcQHyf3F8a_3uGGvWk
Message-ID: <CAK5yBb9QHZ0i1x19JAp1pRD3bR7EgFdyh=7UZLhrJ8cqoz5KzQ@mail.gmail.com>
Subject: Yocto Project Status 13 October 2026 (WW42)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000002f750b065db9f5cc"
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Tue, 13 Oct 2026 14:52:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/143

--0000000000002f750b065db9f5cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 6.2 M1 - Development

Next Deadline: YP 6.2 M1: w/c 2026-12-21

Next Team Meetings:

   -

   Bug Triage meeting - Thursday 15th Oct. 7:30am PDT (
   https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
   -

   Weekly Project Engineering Sync  - Tuesday 13rd Oct. 8am PDT (
   https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
   <https://zoom.us/j/990892712>
   -

   Yocto Project Patch Review - Thursday 15th Oct. 10am GMT and Monday 19th
   Oct. 9am PDT (
   https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1)


Project data dashboard: https://dashboard.yoctoproject.org/

Key Status/Updates:

   -

   YP 6.1 is due for release after final review
   -

   YP 6.0.4 is in QA.
   -

   YP 5.0.21 is queued for QA next.
   -

   Blacksail and master are now on separate branches and have diverged.
   -

   Patches for 6.2 have started merging into master
   -

   There are changes to the pypi class so that PYPI_PACKAGE is the
   normalised name
   -

   There are issues where we could accept help:
   -

      Matchbox-wm segfault/xserver restart
      -

      aarch64/x86-64 build host contamination/reproducibility issue -
      thanks for the work and fixes so far on this.
      -

      Remaining github.com references in bitbake-selftest
      -

   Thanks to everyone who attended the Dev Day or came and saw us in
   Prague. This was the largest Yocto Dev Day so far!


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

   WDD 2659 (last week 2644) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   OE-Core/Poky Patch Metrics
   -

      Total found: 1041 (last week 1057)
      -

      Patches in the Pending State: 135 (13%) [last week 135 (13%)]
      -

      https://valkyrie.yocto.io/pub/non-release/patchmetrics/


Upcoming development releases

   -

   6.1.0: is in review.
   -

   YP 6.2 M1
   -

      Build Date w/c 2026-12-07
      -

      Release Date w/c 2026-12-21
      -

   YP 6.2 M2
   -

      Build Date w/c 2027-01-18
      -

      Release Date w/c 2027-02-01
      -

   YP 6.2 M3
   -

      Build Date w/c 2027-03-01
      -

      Release Date w/c 2027-03-15
      -

   YP 6.2.0
   -

      Build Date w/c 2027-04-26
      -

      Release Date w/c 2027-05-03


Upcoming dot releases:

   -

   YP 6.0.4
   -

      In QA
      -

      Release Date w/c 2026-10-12
      -

   YP 5.0.21
   -

      In QA
      -

      Release Date w/c 2026-10-19
      -

   YP 6.1.1
   -

      Build Date w/c 2026-11-16
      -

      Release Date w/c 2026-11-30
      -

   YP 6.0.5
   -

      Build Date w/c 2026-11-23
      -

      Release Date w/c 2026-12-07
      -

   YP 5.0.22
   -

      Build Date w/c 2026-11-30
      -

      Release Date w/c 2026-12-14
      -

   For future release dates, see
   https://wiki.yoctoproject.org/wiki/Release_calendar


The Yocto Project=E2=80=99s technical governance is through its Technical S=
teering
Committee, more information is available at:

https://wiki.yoctoproject.org/wiki/TSC

The Status reports are stored on the wiki at:
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

--0000000000002f750b065db9f5cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span id=3D"gmail-docs-internal-guid-33f29e70-7fff-38=
8e-8c28-80101ef4bbfa"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-=
serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;ver=
tical-align:baseline;white-space:pre-wrap">Current Dev Position: YP 6.2 M1 =
- Development</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top=
:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;v=
ertical-align:baseline;white-space:pre-wrap">Next Deadline: YP 6.2 M1: w/c =
2026-12-21=C2=A0</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Ar=
ial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre-wrap">Next Team Meetings:</sp=
an></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:9.5pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant:normal;vertical-align:baselin=
e;white-space:pre-wrap">Bug Triage meeting - Thursday 15th Oct. 7:30am PDT =
(</span><a href=3D"https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aV=
pHVVZ6dz09" style=3D"text-decoration:none"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant:normal;text-decoration:underline;ve=
rtical-align:baseline;white-space:pre-wrap">https://zoom.us/j/454367603?pwd=
=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</span></a><span style=3D"font-size:11pt=
;background-color:transparent;font-variant:normal;vertical-align:baseline;w=
hite-space:pre-wrap">)</span></p></li><li dir=3D"ltr" style=3D"list-style-t=
ype:disc;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);back=
ground-color:transparent;font-variant:normal;vertical-align:baseline;white-=
space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-c=
olor:transparent;font-variant:normal;vertical-align:baseline;white-space:pr=
e-wrap">Weekly Project Engineering Sync=C2=A0 - Tuesday 13rd Oct. 8am PDT (=
</span><a href=3D"https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjR=
rcmJsUT09" style=3D"text-decoration:none"><span style=3D"font-size:11pt;bac=
kground-color:transparent;font-variant:normal;text-decoration:underline;ver=
tical-align:baseline;white-space:pre-wrap">https://zoom.us/j/990892712?pwd=
=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</span></a><a href=3D"https://zoom.us/j/=
990892712" style=3D"text-decoration:none"><span style=3D"font-size:11pt;bac=
kground-color:transparent;font-variant:normal;text-decoration:underline;ver=
tical-align:baseline;white-space:pre-wrap">)</span></a></p></li><li dir=3D"=
ltr" style=3D"list-style-type:disc;font-size:9.5pt;font-family:Arial,sans-s=
erif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vert=
ical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"f=
ont-size:11pt;background-color:transparent;font-variant:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">Yocto Project Patch Review - Thursday 15t=
h Oct. 10am GMT and Monday 19th Oct. 9am PDT (</span><a href=3D"https://zoo=
m.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1" style=3D"text-d=
ecoration:none"><span style=3D"font-size:11pt;background-color:transparent;=
font-variant:normal;text-decoration:underline;vertical-align:baseline;white=
-space:pre-wrap">https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwT=
b6iWry4Eb.1</span></a><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">)</=
span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans=
-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;ve=
rtical-align:baseline;white-space:pre-wrap">Project data dashboard: </span>=
<a href=3D"https://dashboard.yoctoproject.org/" style=3D"text-decoration:no=
ne"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;background-c=
olor:transparent;font-variant:normal;text-decoration:underline;vertical-ali=
gn:baseline;white-space:pre-wrap">https://dashboard.yoctoproject.org/</span=
></a><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0=
,0,0);background-color:transparent;font-variant:normal;vertical-align:basel=
ine;white-space:pre-wrap">=C2=A0</span></p><br><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11p=
t;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Key Sta=
tus/Updates:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li d=
ir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">YP 6.1 is due for release after fina=
l review</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-=
size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">YP 6.0.=
4 is in QA.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;fo=
nt-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color=
:transparent;font-variant:normal;vertical-align:baseline;white-space:pre"><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" r=
ole=3D"presentation"><span style=3D"font-size:11pt;background-color:transpa=
rent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">YP 5=
.0.21 is queued for QA next.</span></p></li><li dir=3D"ltr" style=3D"list-s=
tyle-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0)=
;background-color:transparent;font-variant:normal;vertical-align:baseline;w=
hite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgro=
und-color:transparent;font-variant:normal;vertical-align:baseline;white-spa=
ce:pre-wrap">Blacksail and master are now on separate branches and have div=
erged.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-si=
ze:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tran=
sparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Patches=
 for 6.2 have started merging into master</span></p></li><li dir=3D"ltr" st=
yle=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;col=
or:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-ali=
gn:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size=
:11pt;background-color:transparent;font-variant:normal;vertical-align:basel=
ine;white-space:pre-wrap">There are changes to the pypi class so that PYPI_=
PACKAGE is the normalised name</span></p></li><li dir=3D"ltr" style=3D"list=
-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">There are issues where we could accept help:</span></p></li>=
<ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"lis=
t-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0=
,0,0);background-color:transparent;font-variant:normal;vertical-align:basel=
ine;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant:normal;vertical-align:baseline;whit=
e-space:pre-wrap">Matchbox-wm segfault/xserver restart</span></p></li><li d=
ir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial=
,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:norm=
al;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span sty=
le=3D"font-size:11pt;background-color:transparent;font-variant:normal;verti=
cal-align:baseline;white-space:pre-wrap">aarch64/x86-64 build host contamin=
ation/reproducibility issue - thanks for the work and fixes so far on this.=
</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:1=
1pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpar=
ent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pr=
esentation"><span style=3D"font-size:11pt;background-color:transparent;font=
-variant:normal;vertical-align:baseline;white-space:pre-wrap">Remaining </s=
pan><a href=3D"http://github.com" style=3D"text-decoration:none"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant:normal;text-d=
ecoration:underline;vertical-align:baseline;white-space:pre-wrap">github.co=
m</span></a><span style=3D"font-size:11pt;background-color:transparent;font=
-variant:normal;vertical-align:baseline;white-space:pre-wrap"> references i=
n bitbake-selftest</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-=
type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);back=
ground-color:transparent;font-variant:normal;vertical-align:baseline;white-=
space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-c=
olor:transparent;font-variant:normal;vertical-align:baseline;white-space:pr=
e-wrap">Thanks to everyone who attended the Dev Day or came and saw us in P=
rague. This was the largest Yocto Dev Day so far!</span></p></li></ul><br><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><=
span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);=
background-color:transparent;font-variant:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">Want to contribute? We would appreciate help with the f=
ollowing areas:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><l=
i dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Aria=
l,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:nor=
mal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span st=
yle=3D"font-size:11pt;background-color:transparent;font-variant:normal;vert=
ical-align:baseline;white-space:pre-wrap">We have several open issues for p=
seudo and limited maintainer time to work on them. Help from someone famili=
ar with systems programming in C would be greatly appreciated. </span><a hr=
ef=3D"https://bugzilla.yoctoproject.org/buglist.cgi?list_id=3D661406&amp;pr=
iority=3DHigh&amp;priority=3DMedium%2B&amp;product=3DPseudo&amp;query_forma=
t=3Dadvanced&amp;resolution=3D---" style=3D"text-decoration:none"><span sty=
le=3D"font-size:11pt;background-color:transparent;font-variant:normal;text-=
decoration:underline;vertical-align:baseline;white-space:pre-wrap">https://=
bugzilla.yoctoproject.org/buglist.cgi?list_id=3D661406&amp;priority=3DHigh&=
amp;priority=3DMedium%2B&amp;product=3DPseudo&amp;query_format=3Dadvanced&a=
mp;resolution=3D---</span></a></p></li><li dir=3D"ltr" style=3D"list-style-=
type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);back=
ground-color:transparent;font-variant:normal;vertical-align:baseline;white-=
space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-c=
olor:transparent;font-variant:normal;vertical-align:baseline;white-space:pr=
e-wrap">There are a large number of intermittent failures on our autobuilde=
r, any help with investigating, reproducing or solving these issues would b=
e welcome! </span><a href=3D"https://valkyrie.yocto.io/pub/non-release/abin=
t/" style=3D"text-decoration:none"><span style=3D"font-size:11pt;background=
-color:transparent;font-variant:normal;text-decoration:underline;vertical-a=
lign:baseline;white-space:pre-wrap">https://valkyrie.yocto.io/pub/non-relea=
se/abint/</span></a></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;=
font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;font-variant:normal;vertical-align:baseline;white-space:pre"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
 role=3D"presentation"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Ma=
ny recipes in openembedded-core would benefit from a new recipe maintainer.=
 Please look at </span><a href=3D"https://git.openembedded.org/openembedded=
-core/tree/meta/conf/distro/include/maintainers.inc" style=3D"text-decorati=
on:none"><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant:normal;text-decoration:underline;vertical-align:baseline;white-space:=
pre-wrap">https://git.openembedded.org/openembedded-core/tree/meta/conf/dis=
tro/include/maintainers.inc</span></a><span style=3D"font-size:11pt;backgro=
und-color:transparent;font-variant:normal;vertical-align:baseline;white-spa=
ce:pre-wrap"> and see if you can adopt any of the unassigned recipes.</span=
></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font=
-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font=
-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentati=
on"><span style=3D"font-size:11pt;background-color:transparent;font-variant=
:normal;vertical-align:baseline;white-space:pre-wrap">For more ways to cont=
ribute, see </span><a href=3D"https://docs.google.com/document/d/18oxKWxLor=
fF813h82mK6yKTIHeBp_-9owFuCWbzgjOk/edit?usp=3Dsharing" style=3D"text-decora=
tion:none"><span style=3D"font-size:11pt;background-color:transparent;font-=
variant:normal;text-decoration:underline;vertical-align:baseline;white-spac=
e:pre-wrap">https://docs.google.com/document/d/18oxKWxLorfF813h82mK6yKTIHeB=
p_-9owFuCWbzgjOk/edit?usp=3Dsharing</span></a></p></li></ul><br><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant:normal;vertical-align:baseline;white-space:=
pre-wrap">New to the project?</span></p><ul style=3D"margin-top:0px;margin-=
bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fo=
nt-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fo=
nt-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presenta=
tion"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt:normal;vertical-align:baseline;white-space:pre-wrap">We have a list of i=
ssues we think are good places to start contributing: </span><a href=3D"htt=
ps://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DNEWCOMER" style=3D=
"text-decoration:none"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant:normal;text-decoration:underline;vertical-align:baselin=
e;white-space:pre-wrap">https://bugzilla.yoctoproject.org/buglist.cgi?quick=
search=3DNEWCOMER</span></a></p></li></ul><br><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt=
;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent=
;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Tracking=
 Metrics:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;v=
ertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">WDD 2659 (last week 2644) </span><sp=
an style=3D"font-size:11pt;font-family:Consolas,sans-serif;background-color=
:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-wr=
ap">(</span><a href=3D"https://wiki.yoctoproject.org/charts/combo.html" sty=
le=3D"text-decoration:none"><span style=3D"font-size:11pt;background-color:=
transparent;font-variant:normal;text-decoration:underline;vertical-align:ba=
seline;white-space:pre-wrap">https://wiki.yoctoproject.org/charts/combo.htm=
l</span></a><span style=3D"font-size:11pt;font-family:Consolas,sans-serif;b=
ackground-color:transparent;font-variant:normal;vertical-align:baseline;whi=
te-space:pre-wrap">)</span></p></li><li dir=3D"ltr" style=3D"list-style-typ=
e:disc;font-size:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);back=
ground-color:transparent;font-variant:normal;vertical-align:baseline;white-=
space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-family:=
Arial,sans-serif;background-color:transparent;font-variant:normal;vertical-=
align:baseline;white-space:pre-wrap">OE-Core/Poky Patch Metrics</span></p><=
/li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D=
"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:r=
gb(0,0,0);background-color:transparent;font-variant:normal;vertical-align:b=
aseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11p=
t;background-color:transparent;font-variant:normal;vertical-align:baseline;=
white-space:pre-wrap">Total found: 1041 (last week 1057)</span></p></li><li=
 dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Ari=
al,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:no=
rmal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span s=
tyle=3D"font-size:11pt;background-color:transparent;font-variant:normal;ver=
tical-align:baseline;white-space:pre-wrap">Patches in the Pending State: 13=
5 (13%) [last week 135 (13%)]</span></p></li><li dir=3D"ltr" style=3D"list-=
style-type:circle;font-size:11pt;font-family:Consolas,sans-serif;color:rgb(=
0,0,0);background-color:transparent;font-variant:normal;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt" role=3D"presentation"><a href=3D"https://valkyrie.yoc=
to.io/pub/non-release/patchmetrics/" style=3D"text-decoration:none"><span s=
tyle=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:transp=
arent;font-variant:normal;text-decoration:underline;vertical-align:baseline=
;white-space:pre-wrap">https://valkyrie.yocto.io/pub/non-release/patchmetri=
cs/</span></a></p></li></ul></ul><br><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-fam=
ily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-var=
iant:normal;vertical-align:baseline;white-space:pre-wrap">Upcoming developm=
ent releases</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li d=
ir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">6.1.0: is in review.</span></p></li>=
<li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ar=
ial,sans-serif;background-color:transparent;font-variant:normal;vertical-al=
ign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-siz=
e:11pt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">YP=
 6.2 M1</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li d=
ir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial=
,sans-serif;background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:1=
1pt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Build=
 Date w/c </span><span style=3D"font-size:11pt;background-color:transparent=
;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">2026-12-=
07</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size=
:11pt;font-family:Arial,sans-serif;background-color:transparent;font-varian=
t:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><sp=
an style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;whit=
e-space:pre-wrap">Release Date w/c </span><span style=3D"font-size:11pt;bac=
kground-color:transparent;font-variant:normal;vertical-align:baseline;white=
-space:pre-wrap">2026-12-21</span></p></li></ul><li dir=3D"ltr" style=3D"li=
st-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;background-c=
olor:transparent;font-variant:normal;vertical-align:baseline;white-space:pr=
e"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t" role=3D"presentation"><span style=3D"font-size:11pt;font-variant:normal;=
vertical-align:baseline;white-space:pre-wrap">YP 6.2 M2</span></p></li><ul =
style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-st=
yle-type:circle;font-size:11pt;font-family:Arial,sans-serif;background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" =
role=3D"presentation"><span style=3D"font-size:11pt;font-variant:normal;ver=
tical-align:baseline;white-space:pre-wrap">Build Date w/c </span><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre-wrap">2027-01-18</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,s=
ans-serif;background-color:transparent;font-variant:normal;vertical-align:b=
aseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11p=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Release=
 Date w/c </span><span style=3D"font-size:11pt;background-color:transparent=
;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">2027-02-=
01</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-s=
ize:11pt;font-family:Arial,sans-serif;background-color:transparent;font-var=
iant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline=
;white-space:pre-wrap">YP 6.2 M3</span></p></li><ul style=3D"margin-top:0px=
;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-si=
ze:11pt;font-family:Arial,sans-serif;background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><=
span style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">Build Date w/c </span><span style=3D"font-size:11pt;bac=
kground-color:transparent;font-variant:normal;vertical-align:baseline;white=
-space:pre-wrap">2027-03-01</span></p></li><li dir=3D"ltr" style=3D"list-st=
yle-type:circle;font-size:11pt;font-family:Arial,sans-serif;background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" =
role=3D"presentation"><span style=3D"font-size:11pt;font-variant:normal;ver=
tical-align:baseline;white-space:pre-wrap">Release Date w/c </span><span st=
yle=3D"font-size:11pt;background-color:transparent;font-variant:normal;vert=
ical-align:baseline;white-space:pre-wrap">2027-03-15</span></p></li></ul><l=
i dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Aria=
l,sans-serif;background-color:transparent;font-variant:normal;vertical-alig=
n:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:=
11pt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">YP 6=
.2.0</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=
=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,s=
ans-serif;background-color:transparent;font-variant:normal;vertical-align:b=
aseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11p=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Build D=
ate w/c </span><span style=3D"font-size:11pt;background-color:transparent;f=
ont-variant:normal;vertical-align:baseline;white-space:pre-wrap">2027-04-26=
</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:1=
1pt;font-family:Arial,sans-serif;background-color:transparent;font-variant:=
normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span=
 style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;white-=
space:pre-wrap">Release Date w/c </span><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">2027-05-03</span></p></li></ul></ul><br><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap"=
>Upcoming dot releases:</span></p><ul style=3D"margin-top:0px;margin-bottom=
:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fam=
ily:Arial,sans-serif;background-color:transparent;font-variant:normal;verti=
cal-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fo=
nt-size:11pt;font-variant:normal;vertical-align:baseline;white-space:pre-wr=
ap">YP 6.0.4</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px">=
<li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:=
Arial,sans-serif;background-color:transparent;font-variant:normal;vertical-=
align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-s=
ize:11pt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">=
In QA</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-s=
ize:11pt;font-family:Arial,sans-serif;background-color:transparent;font-var=
iant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline=
;white-space:pre-wrap">Release Date w/c 2026-10-12</span></p></li></ul><li =
dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,=
sans-serif;background-color:transparent;font-variant:normal;vertical-align:=
baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11=
pt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">YP 5.0=
.21</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=
=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,s=
ans-serif;background-color:transparent;font-variant:normal;vertical-align:b=
aseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11p=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">In QA</=
span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11p=
t;font-family:Arial,sans-serif;background-color:transparent;font-variant:no=
rmal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span s=
tyle=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;white-sp=
ace:pre-wrap">Release Date w/c 2026-10-19</span></p></li></ul><li dir=3D"lt=
r" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-seri=
f;background-color:transparent;font-variant:normal;vertical-align:baseline;=
white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-v=
ariant:normal;vertical-align:baseline;white-space:pre-wrap">YP 6.1.1</span>=
</p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" sty=
le=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;ba=
ckground-color:transparent;font-variant:normal;vertical-align:baseline;whit=
e-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-varia=
nt:normal;vertical-align:baseline;white-space:pre-wrap">Build Date w/c 2026=
-11-16</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-=
size:11pt;font-family:Arial,sans-serif;background-color:transparent;font-va=
riant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline=
;white-space:pre-wrap">Release Date w/c 2026-11-30</span></p></li></ul><li =
dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,=
sans-serif;background-color:transparent;font-variant:normal;vertical-align:=
baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11=
pt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">YP 6.0=
.5</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D=
"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans=
-serif;background-color:transparent;font-variant:normal;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;f=
ont-variant:normal;vertical-align:baseline;white-space:pre-wrap">Build Date=
 w/c 2026-11-23</span></p></li><li dir=3D"ltr" style=3D"list-style-type:cir=
cle;font-size:11pt;font-family:Arial,sans-serif;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pres=
entation"><span style=3D"font-size:11pt;font-variant:normal;vertical-align:=
baseline;white-space:pre-wrap">Release Date w/c 2026-12-07</span></p></li><=
/ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-famil=
y:Arial,sans-serif;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font=
-size:11pt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap=
">YP 5.0.22</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><=
li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:A=
rial,sans-serif;background-color:transparent;font-variant:normal;vertical-a=
lign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-si=
ze:11pt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">B=
uild Date w/c 2026-11-30</span></p></li><li dir=3D"ltr" style=3D"list-style=
-type:circle;font-size:11pt;font-family:Arial,sans-serif;background-color:t=
ransparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" rol=
e=3D"presentation"><span style=3D"font-size:11pt;font-variant:normal;vertic=
al-align:baseline;white-space:pre-wrap">Release Date w/c 2026-12-14</span><=
/p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;f=
ont-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;f=
ont-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"present=
ation"><span style=3D"font-size:11pt;background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre-wrap">For future release=
 dates, see </span><a href=3D"https://wiki.yoctoproject.org/wiki/Release_ca=
lendar" style=3D"text-decoration:none"><span style=3D"font-size:11pt;backgr=
ound-color:transparent;font-variant:normal;text-decoration:underline;vertic=
al-align:baseline;white-space:pre-wrap">https://wiki.yoctoproject.org/wiki/=
Release_calendar</span></a></p></li></ul><br><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;=
font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;=
font-variant:normal;vertical-align:baseline;white-space:pre-wrap">The Yocto=
 Project=E2=80=99s technical governance is through its Technical Steering C=
ommittee, more information is available at:</span></p><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><a href=3D"https://w=
iki.yoctoproject.org/wiki/TSC" style=3D"text-decoration:none"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:transparen=
t;font-variant:normal;text-decoration:underline;vertical-align:baseline;whi=
te-space:pre-wrap">https://wiki.yoctoproject.org/wiki/TSC</span></a></p><br=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0=
);background-color:transparent;font-variant:normal;vertical-align:baseline;=
white-space:pre-wrap">The Status reports are stored on the wiki at: </span>=
<a href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status" style=3D"text-=
decoration:none"><span style=3D"font-size:11pt;font-family:Arial,sans-serif=
;background-color:transparent;font-variant:normal;text-decoration:underline=
;vertical-align:baseline;white-space:pre-wrap">https://wiki.yoctoproject.or=
g/wiki/Weekly_Status</span></a></p><br><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-f=
amily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-v=
ariant:normal;vertical-align:baseline;white-space:pre-wrap">[If anyone has =
suggestions for other information you=E2=80=99d like to see on this weekly =
status update, let us know!]</span></p></span><br class=3D"gmail-Apple-inte=
rchange-newline"></div><div dir=3D"ltr" class=3D"gmail_signature" data-smar=
tmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><p class=3D"Mso=
Normal" style=3D"background-image:initial;background-position:initial;backg=
round-repeat:initial"><span style=3D"font-size:12pt;font-family:Arial,sans-=
serif">Thanks,<span></span></span></p>

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

--0000000000002f750b065db9f5cc--

