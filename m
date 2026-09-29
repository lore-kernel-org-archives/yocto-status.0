Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE27CA5FAE
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 14:56:37 +0000 (UTC)
Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.152.1790693790799190391
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 29 Sep 2026 07:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YnpgDzba;
 spf=pass (domain: gmail.com, ip: 74.125.229.43, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e62211987so4365372eec.2
        for <yocto-status@lists.yoctoproject.org>; Tue, 29 Sep 2026 07:56:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790693790; cv=none;
        d=google.com; s=arc-20260327;
        b=hSsk3crjRZ5qVZYRBh16/oE6DngVTb2dEqq+L+cODmxiBPStr3QS9sw+1UTnPHru11
         nzTCk8kzS7m1lu9EdwMWsU35rtK2YE+AY2SWDl2y8XxEF9GPnrrerACVUDILrtpaixVZ
         H4qb2a3gjrQAxcoJ8Lqq3ZsjK+kM1dKXd57t31TnXnl9cZ1BB6K1DW/3GMrNwuTkyg1/
         pGGMwbAs3lsnB5665O/SGtdL4xbaZYoSK7r0ysxnjVMG0MKX52XocHeyRTVdvHbr+afg
         cgDKo664V727lZ6RMiePsXSOtr47VPSRTYub3nE7Z+rCEh3Ik+n+GPBr8nkMytTVU23W
         Y2wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=n1FEM26jF0YLpodpZXQFV8fPia5uLOo+4TL0RL8IPyE=;
        fh=l66Yh0FSeaSptysG7jpAIUNW4y7TkPV4+Amnni2sXww=;
        b=sucdUhi7i4iL7FlUCtVVfvmGTdSCmS5puH6kDkTv+kzSWAWIHQ8c/xjcrHM0i8eoRL
         gJN/rlqP5AvztEzkwvZPHqTMO9ieID1nJmGNL8nUI5N3Fi+3AeHv+av6G9PdaIL+k0Ty
         WqMPDCmYsiNt6ns5ZzVz/57MheqQ880GUiXaggbYojoLTuuMylen5+YP5086GGqSTfjq
         hwbY057nFskqgVPLAoV2NEx5mYSB9TdbgYw2nCjbJa55FBBuNEpSyHMwxux+wSo2LZtq
         m1tXM7v21TlDz1ynGWC9UZmkLWESVMELf11JlEkQrOYChIZ5yL+oK+SUYHjzskHppB22
         Bb+w==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790693790; x=1791298590; darn=lists.yoctoproject.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=n1FEM26jF0YLpodpZXQFV8fPia5uLOo+4TL0RL8IPyE=;
        b=YnpgDzba2H+5r9iOnqY7Y/oLZFzbiYxK6uiLRDfZkwn3Cv2uRUvoO3R8MQMOnmIbl9
         dTAgnXEnf2YOeKs3+UA3ShowSwFzQ2kzMhoGsN7mKgB3mn0x9+K95KYDuKcC/K14gsoK
         zqdQow3R0ebflPzzsPI1XcN4Ng9nSVzrAenQ6GfV9bvbTzOEhhn5WAXw19vXB9gcN4Ka
         BEq4IETHZIwB3D5uW2mUI+LB896wRWcsZPF0ILDypzpfrcQZccHNCEoAzH7YovBiEHRZ
         ZlB99aPZmXXfgiDGDAIy8PcdqkpytiylyL/hAJ092G1vtMjFNnEn72Y0A/aKs6ADQzls
         tQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790693790; x=1791298590;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n1FEM26jF0YLpodpZXQFV8fPia5uLOo+4TL0RL8IPyE=;
        b=0qZomoS0g/UV3lqbEUtlcOILoHfgZdc7KlMOqawkMbdi/KPU/WKoOBWJ+RgveucOtB
         I+rVL2zhyMG2ZOhkGT2GjWzXYmaOukpX/gIC8NjaAd8DES6lMGKgUAr0DzdjWPfwq2xj
         jx3WfSSzfaGnmCQugvrp/596f9Gq5KFRLevNgGPZ0tLsB5d9MGPGfQm5qmf/Q81K/bB0
         ugdVcCyYkBdzDyFh36pgg6rnO2Nri+9ff8n/21refSueMy6WdVBmZGDuUCXMm0b+Nn53
         BfJQV941jjdgYkYXeYXns5PTHb0H7SVArVKmg6Daq5Y6k/y47EAUzwe6ewO0c4UyVjec
         l+Aw==
X-Forwarded-Encrypted: i=1; AKwUvByYq12dcohK9OfAQi4I6WLzudl1biXkfM8GEEGImKd7SGbjVHiHixruma2NvXBLZWOXfdzi8bVNwYfA2cc=@lists.yoctoproject.org
X-Gm-Message-State: AFq9FYLWS1SvPjSvTwcVK/f0KcO/72qRkJywX6PLA8MAcEmQH1pbt3lI
	e9Yf5u5Fo3d+rboII3Qo996Q8ykYeOFQZc2lnZdVqB5u1Au9LhNDFJWJBqFLj3gD736i8v0LY1c
	GgWVUPxo/nSO73k95N491atfTGApLYZI=
X-Gm-Gg: AYBFou12ZhPjhx+UOYveSdmKzPn2SW4jcW3JYqBahUG+CALBmn+tom4KzvQGr0quh0M
	OTkCkDS415iqMZBsqe4iOOl/C0UoWEeVtIiicWGdFttXjYhI3/RFDv1nQg4z3qb9SS6MnIuVxlf
	0z9/U7tPBjUUBKk8BUQ6vjPyiMYt8aHcY/gei5g29KybCzBDpTqhoVA4ykQR/zC6YbFlcrK3ZFe
	BJEcuIUrTaN2+PIAbfOCIBKGYuw88xW7e6J1V/trcOc8wY/V05Bbwj8i6nwDxh/cmbQbaGe3Gsn
	tojuWuu29J/etk9j1pfz2/HttDhDpee+uAKRMlCK8imh+TQHiVm+heVPTvyoCPxCPpRcoZBKWrU
	z4AKvUtYw68l1LH/1pY/Yip1XtfkgBZqAT3B1T5PvBv3ROPrCFbt4E1XE8yTcDlzDyTqdqHSiFG
	Ov/7cZl/FH3s2jZSVFGoGZEp9VINPvd/rie21rjPFcxDkA6mgAKqU0v2u80IHM98y+/p8zBb4Nv
	KHazXfcE5wHOADw/+JayItQXIykEgA7njaTcQOU
X-Received: by 2002:a05:7300:7fa7:b0:33e:84c3:a05b with SMTP id
 5a478bee46e88-3427217a1acmr17749502eec.30.1790693789560; Tue, 29 Sep 2026
 07:56:29 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 29 Sep 2026 07:56:04 -0700
X-Gm-Features: AclHuK9cJog8pRazj1FiwJcsZzTQKMMNtiE8_N5Mef6OBO3BSK3Y0GlNUj6IWIw
Message-ID: <CAK5yBb-2hBSpscLQNGW8j2RcqZr94JY=6y-eiBWZs6D9c8E0Zw@mail.gmail.com>
Subject: Yocto Project Status 29 September 2026 (WW40)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000003a7494065ca063cc"
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Tue, 29 Sep 2026 14:56:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/141

--0000000000003a7494065ca063cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 6.1 M4 - Stabilisation (Bug Fixing)

Next Deadline: YP 6.1 M4: w/c 2026-10-12

Next Team Meetings:

   -

   Bug Triage meeting - Thursday 1st Oct. 7:30am PDT (
   https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
   -

   Weekly Project Engineering Sync  - Tuesday 29th Sept. 8am PDT (
   https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
   <https://zoom.us/j/990892712>
   -

   Yocto Project Patch Review - Thursday 1st Oct. 10am GMT and Monday 5th
   Oct. 9am PDT (
   https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1)


Project data dashboard: https://dashboard.yoctoproject.org/

Key Status/Updates:

   -

   YP 6.1 M3 was released
   -

   YP 6.1 is due for build imminently
   -

   Blacksail and master are now on separate branches and have diverged.
   -

   We are not aware of anyone focusing on specific 6.1 stabilization work
   so we will likely build 6.1 very soon.
   -

   We=E2=80=99ve continued progress on the build architecture reproducibili=
ty
   issues, thanks all!
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

   Bitbake=E2=80=99s network disabling has recently been enhanced to includ=
e
   landlock support. This means the network isolation for tasks can be more
   effective on certain kernel/distro combinations using newer technology.
   -

   Next week is Open Source Summit EU and Yocto Project Developer Day in
   Prague! Contact Paul or Megan if you are attending and want to meet up w=
ith
   other Yocto Project folks, especially if you=E2=80=99re new to our commu=
nity.
   -

      Regular meetings on Tuesday and Thursday next week will be canceled,
      including the Tech call (Tue 6th), Patch review call (Thu 8th) and Bu=
g
      triage call (Thu 8th). The Monday patch review call will be going ahe=
ad.


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

   WDD 2643 (last week 2640) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   OE-Core/Poky Patch Metrics
   -

      Total patches found: 1053 (last week 1055)
      -

      Patches in the Pending State: 135 (13%) [last week 137 (13%)]
      -

      https://valkyrie.yocto.io/pub/non-release/patchmetrics/


Upcoming development releases

   -

   6.1 M3: was released.
   -

   6.1.0:
   -

      Build Date (M4): w/c 2026-10-12
      -

      Release Date: w/c 2026-11-02


Upcoming dot releases:

   -

   YP 6.0.4
   -

      Build Date w/c 2026-09-28
      -

      Release Date w/c 2026-10-12
      -

   YP 5.0.21
   -

      Build Date w/c 2026-10-05
      -

      Release Date w/c 2026-10-19
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

--0000000000003a7494065ca063cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span id=3D"gmail-docs-internal-guid-5ba960ca-7fff-44=
54-3dfd-f50a612a52c7"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-=
serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;ver=
tical-align:baseline;white-space:pre-wrap">Current Dev Position: YP 6.1 M4 =
- Stabilisation (Bug Fixing)</span></p><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-f=
amily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-v=
ariant:normal;vertical-align:baseline;white-space:pre-wrap">Next Deadline: =
YP 6.1 M4: w/c 2026-10-12</span></p><br><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-=
family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-=
variant:normal;vertical-align:baseline;white-space:pre-wrap">Next Team Meet=
ings:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:9.5pt;font-family:Arial,sans-se=
rif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;verti=
cal-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fo=
nt-size:11pt;background-color:transparent;font-variant:normal;vertical-alig=
n:baseline;white-space:pre-wrap">Bug Triage meeting - Thursday 1st Oct. 7:3=
0am PDT (</span><a href=3D"https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3=
Y0bFd5aVpHVVZ6dz09" style=3D"text-decoration:none"><span style=3D"font-size=
:11pt;background-color:transparent;font-variant:normal;text-decoration:unde=
rline;vertical-align:baseline;white-space:pre-wrap">https://zoom.us/j/45436=
7603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</span></a><span style=3D"font-s=
ize:11pt;background-color:transparent;font-variant:normal;vertical-align:ba=
seline;white-space:pre-wrap">)</span></p></li><li dir=3D"ltr" style=3D"list=
-style-type:disc;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0=
,0);background-color:transparent;font-variant:normal;vertical-align:baselin=
e;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;back=
ground-color:transparent;font-variant:normal;vertical-align:baseline;white-=
space:pre-wrap">Weekly Project Engineering Sync=C2=A0 - Tuesday 29th Sept. =
8am PDT (</span><a href=3D"https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck=
81bkcrYjRrcmJsUT09" style=3D"text-decoration:none"><span style=3D"font-size=
:11pt;background-color:transparent;font-variant:normal;text-decoration:unde=
rline;vertical-align:baseline;white-space:pre-wrap">https://zoom.us/j/99089=
2712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</span></a><a href=3D"https://zo=
om.us/j/990892712" style=3D"text-decoration:none"><span style=3D"font-size:=
11pt;background-color:transparent;font-variant:normal;text-decoration:under=
line;vertical-align:baseline;white-space:pre-wrap">)</span></a></p></li><li=
 dir=3D"ltr" style=3D"list-style-type:disc;font-size:9.5pt;font-family:Aria=
l,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:nor=
mal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span st=
yle=3D"font-size:11pt;background-color:transparent;font-variant:normal;vert=
ical-align:baseline;white-space:pre-wrap">Yocto Project Patch Review - Thur=
sday 1st Oct. 10am GMT and Monday 5th Oct. 9am PDT (</span><a href=3D"https=
://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1" style=3D"=
text-decoration:none"><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant:normal;text-decoration:underline;vertical-align:baseline=
;white-space:pre-wrap">https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEona=
TaONwTb6iWry4Eb.1</span></a><span style=3D"font-size:11pt;background-color:=
transparent;font-variant:normal;vertical-align:baseline;white-space:pre-wra=
p">)</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Aria=
l,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:nor=
mal;vertical-align:baseline;white-space:pre-wrap">Project data dashboard: <=
/span><a href=3D"https://dashboard.yoctoproject.org/" style=3D"text-decorat=
ion:none"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;backgr=
ound-color:transparent;font-variant:normal;text-decoration:underline;vertic=
al-align:baseline;white-space:pre-wrap">https://dashboard.yoctoproject.org/=
</span></a><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre-wrap">=C2=A0</span></p><br><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap"=
>Key Status/Updates:</span></p><ul style=3D"margin-top:0px;margin-bottom:0p=
x"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family=
:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varian=
t:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><sp=
an style=3D"font-size:11pt;background-color:transparent;font-variant:normal=
;vertical-align:baseline;white-space:pre-wrap">YP 6.1 M3 was released</span=
></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font=
-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font=
-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentati=
on"><span style=3D"font-size:11pt;background-color:transparent;font-variant=
:normal;vertical-align:baseline;white-space:pre-wrap">YP 6.1 is due for bui=
ld imminently</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;=
font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;font-variant:normal;vertical-align:baseline;white-space:pre"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
 role=3D"presentation"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Bl=
acksail and master are now on separate branches and have diverged.</span></=
p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-va=
riant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre-wrap">We are not aware of any=
one focusing on specific 6.1 stabilization work so we will likely build 6.1=
 very soon.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;fo=
nt-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color=
:transparent;font-variant:normal;vertical-align:baseline;white-space:pre"><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" r=
ole=3D"presentation"><span style=3D"font-size:11pt;background-color:transpa=
rent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">We=
=E2=80=99ve continued progress on the build architecture reproducibility is=
sues, thanks all!</span></p></li><li dir=3D"ltr" style=3D"list-style-type:d=
isc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant:normal;vertical-align:baseline;white-space:=
pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap=
">There are issues where we could accept help:</span></p></li><ul style=3D"=
margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:=
circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgro=
und-color:transparent;font-variant:normal;vertical-align:baseline;white-spa=
ce:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-w=
rap">Matchbox-wm segfault/xserver restart</span></p></li><li dir=3D"ltr" st=
yle=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;c=
olor:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-a=
lign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-si=
ze:11pt;background-color:transparent;font-variant:normal;vertical-align:bas=
eline;white-space:pre-wrap">aarch64/x86-64 build host contamination/reprodu=
cibility issue - thanks for the work and fixes so far on this.</span></p></=
li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-fami=
ly:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><=
span style=3D"font-size:11pt;background-color:transparent;font-variant:norm=
al;vertical-align:baseline;white-space:pre-wrap">Remaining </span><a href=
=3D"http://github.com" style=3D"text-decoration:none"><span style=3D"font-s=
ize:11pt;background-color:transparent;font-variant:normal;text-decoration:u=
nderline;vertical-align:baseline;white-space:pre-wrap">github.com</span></a=
><span style=3D"font-size:11pt;background-color:transparent;font-variant:no=
rmal;vertical-align:baseline;white-space:pre-wrap"> references in bitbake-s=
elftest</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;f=
ont-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" =
role=3D"presentation"><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Bit=
bake=E2=80=99s network disabling has recently been enhanced to include land=
lock support. This means the network isolation for tasks can be more effect=
ive on certain kernel/distro combinations using newer technology.</span></p=
></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fam=
ily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-var=
iant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre-wrap">Next week is Open Sourc=
e Summit EU and Yocto Project Developer Day in Prague! Contact Paul or Mega=
n if you are attending and want to meet up with other Yocto Project folks, =
especially if you=E2=80=99re new to our community.</span></p></li><ul style=
=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-t=
ype:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);bac=
kground-color:transparent;font-variant:normal;vertical-align:baseline;white=
-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-=
color:transparent;font-variant:normal;vertical-align:baseline;white-space:p=
re-wrap">Regular meetings on Tuesday and Thursday next week will be cancele=
d, including the Tech call (Tue 6th), Patch review call (Thu 8th) and Bug t=
riage call (Thu 8th). The Monday patch review call will be going ahead.</sp=
an></p></li></ul></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal=
;vertical-align:baseline;white-space:pre-wrap">Want to contribute? We would=
 appreciate help with the following areas:</span></p><ul style=3D"margin-to=
p:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font=
-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:t=
ransparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" rol=
e=3D"presentation"><span style=3D"font-size:11pt;background-color:transpare=
nt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">We hav=
e several open issues for pseudo and limited maintainer time to work on the=
m. Help from someone familiar with systems programming in C would be greatl=
y appreciated. </span><a href=3D"https://bugzilla.yoctoproject.org/buglist.=
cgi?list_id=3D661406&amp;priority=3DHigh&amp;priority=3DMedium%2B&amp;produ=
ct=3DPseudo&amp;query_format=3Dadvanced&amp;resolution=3D---" style=3D"text=
-decoration:none"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;text-decoration:underline;vertical-align:baseline;whi=
te-space:pre-wrap">https://bugzilla.yoctoproject.org/buglist.cgi?list_id=3D=
661406&amp;priority=3DHigh&amp;priority=3DMedium%2B&amp;product=3DPseudo&am=
p;query_format=3Dadvanced&amp;resolution=3D---</span></a></p></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;v=
ertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">There are a large number of intermit=
tent failures on our autobuilder, any help with investigating, reproducing =
or solving these issues would be welcome! </span><a href=3D"https://valkyri=
e.yocto.io/pub/non-release/abint/" style=3D"text-decoration:none"><span sty=
le=3D"font-size:11pt;background-color:transparent;font-variant:normal;text-=
decoration:underline;vertical-align:baseline;white-space:pre-wrap">https://=
valkyrie.yocto.io/pub/non-release/abint/</span></a></p></li><li dir=3D"ltr"=
 style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;=
color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-=
align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-s=
ize:11pt;background-color:transparent;font-variant:normal;vertical-align:ba=
seline;white-space:pre-wrap">Many recipes in openembedded-core would benefi=
t from a new recipe maintainer. Please look at </span><a href=3D"https://gi=
t.openembedded.org/openembedded-core/tree/meta/conf/distro/include/maintain=
ers.inc" style=3D"text-decoration:none"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant:normal;text-decoration:underline;verti=
cal-align:baseline;white-space:pre-wrap">https://git.openembedded.org/opene=
mbedded-core/tree/meta/conf/distro/include/maintainers.inc</span></a><span =
style=3D"font-size:11pt;background-color:transparent;font-variant:normal;ve=
rtical-align:baseline;white-space:pre-wrap"> and see if you can adopt any o=
f the unassigned recipes.</span></p></li><li dir=3D"ltr" style=3D"list-styl=
e-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);ba=
ckground-color:transparent;font-variant:normal;vertical-align:baseline;whit=
e-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background=
-color:transparent;font-variant:normal;vertical-align:baseline;white-space:=
pre-wrap">For more ways to contribute, see </span><a href=3D"https://docs.g=
oogle.com/document/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9owFuCWbzgjOk/edit?usp=
=3Dsharing" style=3D"text-decoration:none"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant:normal;text-decoration:underline;ve=
rtical-align:baseline;white-space:pre-wrap">https://docs.google.com/documen=
t/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9owFuCWbzgjOk/edit?usp=3Dsharing</span><=
/a></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-s=
erif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vert=
ical-align:baseline;white-space:pre-wrap">New to the project?</span></p><ul=
 style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-s=
tyle-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0)=
;background-color:transparent;font-variant:normal;vertical-align:baseline;w=
hite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgro=
und-color:transparent;font-variant:normal;vertical-align:baseline;white-spa=
ce:pre-wrap">We have a list of issues we think are good places to start con=
tributing: </span><a href=3D"https://bugzilla.yoctoproject.org/buglist.cgi?=
quicksearch=3DNEWCOMER" style=3D"text-decoration:none"><span style=3D"font-=
size:11pt;background-color:transparent;font-variant:normal;text-decoration:=
underline;vertical-align:baseline;white-space:pre-wrap">https://bugzilla.yo=
ctoproject.org/buglist.cgi?quicksearch=3DNEWCOMER</span></a></p></li></ul><=
br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0=
,0);background-color:transparent;font-variant:normal;vertical-align:baselin=
e;white-space:pre-wrap">Tracking Metrics:</span></p><ul style=3D"margin-top=
:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-=
size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">WDD 264=
3 (last week 2640) </span><span style=3D"font-size:11pt;font-family:Consola=
s,sans-serif;background-color:transparent;font-variant:normal;vertical-alig=
n:baseline;white-space:pre-wrap">(</span><a href=3D"https://wiki.yoctoproje=
ct.org/charts/combo.html" style=3D"text-decoration:none"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant:normal;text-decoratio=
n:underline;vertical-align:baseline;white-space:pre-wrap">https://wiki.yoct=
oproject.org/charts/combo.html</span></a><span style=3D"font-size:11pt;font=
-family:Consolas,sans-serif;background-color:transparent;font-variant:norma=
l;vertical-align:baseline;white-space:pre-wrap">)</span></p></li><li dir=3D=
"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Consolas,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;v=
ertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">OE-Core=
/Poky Patch Metrics</span></p></li><ul style=3D"margin-top:0px;margin-botto=
m:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-=
family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-=
variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentatio=
n"><span style=3D"font-size:11pt;background-color:transparent;font-variant:=
normal;vertical-align:baseline;white-space:pre-wrap">Total patches found: 1=
053 (last week 1055)</span></p></li><li dir=3D"ltr" style=3D"list-style-typ=
e:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-co=
lor:transparent;font-variant:normal;vertical-align:baseline;white-space:pre=
-wrap">Patches in the Pending State: 135 (13%) [last week 137 (13%)]</span>=
</p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;fon=
t-family:Consolas,sans-serif;color:rgb(0,0,0);background-color:transparent;=
font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presen=
tation"><a href=3D"https://valkyrie.yocto.io/pub/non-release/patchmetrics/"=
 style=3D"text-decoration:none"><span style=3D"font-size:11pt;font-family:A=
rial,sans-serif;background-color:transparent;font-variant:normal;text-decor=
ation:underline;vertical-align:baseline;white-space:pre-wrap">https://valky=
rie.yocto.io/pub/non-release/patchmetrics/</span></a></p></li></ul></ul><br=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0=
);background-color:transparent;font-variant:normal;vertical-align:baseline;=
white-space:pre-wrap">Upcoming development releases</span></p><ul style=3D"=
margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:=
disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgroun=
d-color:transparent;font-variant:normal;vertical-align:baseline;white-space=
:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:=
transparent;font-variant:normal;vertical-align:baseline;white-space:pre-wra=
p">6.1 M3: was released.</span></p></li><li dir=3D"ltr" style=3D"list-style=
-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);bac=
kground-color:transparent;font-variant:normal;vertical-align:baseline;white=
-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-=
color:transparent;font-variant:normal;vertical-align:baseline;white-space:p=
re-wrap">6.1.0:</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0p=
x"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-fami=
ly:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><=
span style=3D"font-size:11pt;background-color:transparent;font-variant:norm=
al;vertical-align:baseline;white-space:pre-wrap">Build Date (M4): w/c 2026-=
10-12</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-s=
ize:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Release=
 Date: w/c 2026-11-02</span></p></li></ul></ul><br><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size=
:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transp=
arent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Upc=
oming dot releases:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px=
"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:=
Arial,sans-serif;background-color:transparent;font-variant:normal;vertical-=
align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-s=
ize:11pt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">=
YP 6.0.4</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li =
dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Aria=
l,sans-serif;background-color:transparent;font-variant:normal;vertical-alig=
n:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:=
11pt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Buil=
d Date w/c 2026-09-28</span></p></li><li dir=3D"ltr" style=3D"list-style-ty=
pe:circle;font-size:11pt;font-family:Arial,sans-serif;background-color:tran=
sparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">Release Date w/c 2026-10-12</span></=
p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fo=
nt-family:Arial,sans-serif;background-color:transparent;font-variant:normal=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;white-space:=
pre-wrap">YP 5.0.21</span></p></li><ul style=3D"margin-top:0px;margin-botto=
m:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-=
family:Arial,sans-serif;background-color:transparent;font-variant:normal;ve=
rtical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D=
"font-size:11pt;font-variant:normal;vertical-align:baseline;white-space:pre=
-wrap">Build Date w/c 2026-10-05</span></p></li><li dir=3D"ltr" style=3D"li=
st-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;background=
-color:transparent;font-variant:normal;vertical-align:baseline;white-space:=
pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-variant:norma=
l;vertical-align:baseline;white-space:pre-wrap">Release Date w/c 2026-10-19=
</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-siz=
e:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:trans=
parent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">For fut=
ure release dates, see </span><a href=3D"https://wiki.yoctoproject.org/wiki=
/Release_calendar" style=3D"text-decoration:none"><span style=3D"font-size:=
11pt;background-color:transparent;font-variant:normal;text-decoration:under=
line;vertical-align:baseline;white-space:pre-wrap">https://wiki.yoctoprojec=
t.org/wiki/Release_calendar</span></a></p></li></ul><br><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font=
-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:t=
ransparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap=
">The Yocto Project=E2=80=99s technical governance is through its Technical=
 Steering Committee, more information is available at:</span></p><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><a href=3D=
"https://wiki.yoctoproject.org/wiki/TSC" style=3D"text-decoration:none"><sp=
an style=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:tr=
ansparent;font-variant:normal;text-decoration:underline;vertical-align:base=
line;white-space:pre-wrap">https://wiki.yoctoproject.org/wiki/TSC</span></a=
></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:r=
gb(0,0,0);background-color:transparent;font-variant:normal;vertical-align:b=
aseline;white-space:pre-wrap">The Status reports are stored on the wiki at:=
 </span><a href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status" style=
=3D"text-decoration:none"><span style=3D"font-size:11pt;font-family:Arial,s=
ans-serif;background-color:transparent;font-variant:normal;text-decoration:=
underline;vertical-align:baseline;white-space:pre-wrap">https://wiki.yoctop=
roject.org/wiki/Weekly_Status</span></a></p><br><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11=
pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpare=
nt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">[If an=
yone has suggestions for other information you=E2=80=99d like to see on thi=
s weekly status update, let us know!]</span></p></span><br class=3D"gmail-A=
pple-interchange-newline"></div><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><p cla=
ss=3D"MsoNormal" style=3D"background-image:initial;background-position:init=
ial;background-repeat:initial"><span style=3D"font-size:12pt;font-family:Ar=
ial,sans-serif">Thanks,<span></span></span></p>

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

--0000000000003a7494065ca063cc--

