Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.535.1794325874050518423
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 10 Nov 2026 07:51:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Ebeh0PV+;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso3373714eec.0
        for <yocto-status@lists.yoctoproject.org>; Tue, 10 Nov 2026 07:51:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794325873; cv=none;
        d=google.com; s=arc-20260327;
        b=hLUhqgSqPePICSSvRTF3A7P1AAtfFbaaqAbIbLWzLBjtVgzP4mLsxNf/sTwUbTrDkV
         b/6muZoGO0ne5GVv+rNNixYJ6P77Uhh/EHbVhaMCIdfTFb05f3n1rJERkkP1HfuFFEzJ
         ScXdGWa6SOntP5hHJIVPMPic7y7jmFKXShvvGti3SwIqd7KCVYO1c43h3F6WbeyRiu2Q
         heuRLkssxn66g2Vgije7NZN1kQzkAGXosAlNwV1nIA6jSL+SA6Kg4IaeA9dGk03LUaWc
         8BgZbtEwTKyTBG85IJLRgwsTNIIVtL/XjAkhcnKRVN4Tr+BpVMRKlyt7GQkizqda1Mz+
         St3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ZhgqZme8WqqELM6HtHO7gcPKKcL715dd+tkrtM7hGo8=;
        fh=KGvgXWXxMhoWSwoux4H77uqUe93UhgBFWIv47jRocFw=;
        b=BUtx9gKyBR77rZjL5ySMwSW3L/thk7IIVlfAjgpPo70OL1xfN4lECYQSeHaJp0frsn
         YuDj/xGGOOXvkqQj+Qf86xSHVIxJZTp8i3ULxacuZI5ltP4n+iLcVw94P3ilmgNSuY5s
         dEu2kni4uThlJGgQ8sqLfC6XwYWp9AAUGBZuBdvYtWUhURi2GZr9Z5heDaVNJ9Wkm6ly
         KcqSoWA+t8xUp9nl2lDTsGQikZlbJb8zuVE1ox5SYQZIN8J4e+bVVwy6SZvvrizhW1u7
         yZlm45fHGgR9/39TJEM15xBv/qdoZ8DxMfcTMTiVIoMLUsz56lWWfqccdzqwoJZbCOAy
         Ck3Q==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794325873; x=1794930673; darn=lists.yoctoproject.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZhgqZme8WqqELM6HtHO7gcPKKcL715dd+tkrtM7hGo8=;
        b=Ebeh0PV+t/MeVSnXRHWB2FJsH1XcMFkvEHdVFFtfX225W66ASCgeD/Ss5Tb0hh2dvW
         lmml46GhGImj+vFvTyyW889iXMM5YWHliN4efHIVT7Wte/Wiyt/pKOx/srvdzom/k4mS
         ciFg/MyAHao7Cq9bo9tOAgkfq/FqbA5o7lRjx7hmWsqG+M0sGQkell5n8ZXUY2bf5Vuv
         a9AExMnJxvcOme9fNE814iGQIBLy9wEgUkIGG1WjQ+aZIbMKTNavujMwmlxu0vRfnn/A
         qErkCDpexnNfJKPxr749g4p7ijpvMeEjcxytLCqyhgZrUR5EsEF7Jw9j45T3QmQ8xadl
         kBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794325873; x=1794930673;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZhgqZme8WqqELM6HtHO7gcPKKcL715dd+tkrtM7hGo8=;
        b=Tle3jjnxSHurmDeOlLGahBgLd/Bgj0LSQjMaKTjndz5oKzBEnsBNjylj7FxQ1h0Bjc
         3R5xVle8d+wc6lajXcVyWVI6POzdmF2ulAyEBZoW3stIvApTcSQ97wtv9cZgE1HjZ/o7
         fljlbDSkZRwHKl3LcNfhtxPgpjUBT4NLc84eFqqOC2MaAxux04oj2e9VU4ZZBLf0H23r
         uYYS0w3MvyCbR1VAy7bse3vgakkmi4a7iWkqp/6XKoGf0DrUQcUzoS74nLk+4uYAX2e0
         9uVo8aGTweH6QzKVkbDDUhAHSGnfOpqzrktwCz8/Y+5fBD3l2jf1jP300GujScYAbQLB
         DhiA==
X-Forwarded-Encrypted: i=1; AL+hErFDCirOL3Or9RsBI/ndrRRyvgJcv11vdQAoqzGMFT2AJU0ZKEIRRf5sJQVz1SAOcinqLAdRWnvobDpi2pA=@lists.yoctoproject.org
X-Gm-Message-State: APuU4Z96wGuXRV/SqbXOy+tP6Rcdnul6ljs/n+eEKNiKrl1BRbnu90Ht
	zBHB/TwhRrlqNVRRS98sleFir4egjTgsXh2xbP5RZKaew0RhlEr6hTMAnZh+t6jnqYGVrZm5rK+
	076n0e+G0OOet10U6MX4TPUuX6UDLtKI=
X-Gm-Gg: AYBFou1t9uxNvRfk+xtC4DXAKfCTzavLXnI4DdSXvbmdkQGX5c8Ko7rlcHGvIwmekWN
	7ZW9nV0GDqK0OVsOaS2tuSOFVPIlCwH4cmlvWbrN/uJ+G3Ue+lkaCcZzQxiLxtTekAeXM2s9ioA
	E9g5ZLXc4nL6kb/aUjkBjibWqRsXnQ9Peth0M29Gb/c9FOcXSkyVf4B9ytSRz5RLg5KM9PmAIDt
	T9/Nyxz5Syy4vdk6URZlYqUvNh8vwtxBYEGLBrseZU5aFxDWksuw/IpTIa7CXQwh3ntEeQ0xsiq
	L7cxoqDux6cOAIXbfxCcb0FG6zrKtP7iNpYF1Z4gkYqJzRqJKvxhu47VDT31qj7IBuYpIayxiHh
	34cMy4K7EicmW9503cYTJRMF8fB9+JEb1m1ceT+44LExnwkRS1koc+RSTqCupYnK1ce4bi3dzEG
	zjjgw7U9R9gQR2zb7zxU9p1+XrJr88dQWuHR9Plm6ciAJh4hxGcq7NxMcohSuQld/m6QzNv5yRR
	ZpkMREHmroBeK1Om8Vuq0EmsRptUKY5zgmszf/TDnlSh6IEltX7K5txiD4c3VdMvrpBTUDgHAYJ
	zXqThN89n6CvwVvbgQ/Nlg==
X-Received: by 2002:a05:7301:f8f:b0:375:c862:31c with SMTP id
 5a478bee46e88-375c86209a3mr1686603eec.40.1794325872834; Tue, 10 Nov 2026
 07:51:12 -0800 (PST)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 10 Nov 2026 08:51:01 -0700
X-Gm-Features: AclHuK-c9hmYaWfbjrR7SX3-clkB9yjpR2mRvUV9FtYEsdfzrS_nXF7UbYwJPPA
Message-ID: <CAK5yBb_f8rGeuWSjVn7EsB6m4JP6tPwuU_cwYb7-cofjjCc9sQ@mail.gmail.com>
Subject: Yocto Project Status 10 November 2026 (WW46)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000042ff33065fee0cfb"
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <yocto-status@lists.yoctoproject.org>; Tue, 10 Nov 2026 15:51:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/147

--00000000000042ff33065fee0cfb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 6.2 M1 - Development

Next Deadline: YP 6.2 M1: w/c 2026-12-14

Next Team Meetings:

   -

   Bug Triage meeting - Thursday 12th Nov. 7:30am PDT (
   https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
   -

   Weekly Project Engineering Sync  - Tuesday 10th Nov. 8am PDT (
   https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
   <https://zoom.us/j/990892712>
   -

   Yocto Project Patch Review - Thursday 12th Nov. 10am GMT and Monday 16th
   Nov.. 9am PDT (
   https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1)


Project data dashboard: https://dashboard.yoctoproject.org/

Key Status/Updates:

   -

   There is a proposal and proof of concept for changes to layer
   configuration and setup out for discussion/review:

https://lists.openembedded.org/g/openembedded-architecture/message/2463

   -

   The proposed layer changes will likely be more invasive than many of the
   recent changes but also incorporate a number of new features and
   improvements which will make them useful to everyone and allow various
   cleanups of existing code.
   -

   There is also a discussion about recipe specific hosttools:

https://lists.openembedded.org/g/openembedded-architecture/message/2467

   -

   The Yocto Project wiki has undergone significant cleanup, mostly with
   removal of obsolete pages/information. We plan to migrate the remaining
   data to a different solution. If anyone is able to help with review of
   content, please let us know.
   -

   The project has adopted an updated policy on AI-generated contributions:
   https://docs.yoctoproject.org/contributor-guide/ai-assisted-contribution=
-policy.html
   -

   There was a widely reported security issue with musl+openssh. The
   project has published details on the situation here:

https://lists.yoctoproject.org/g/yocto-security/message/1728

   -

   We had some positive response to our request for help with the issues
   highlighted from the bug triage team last week. Further help is requeste=
d
   with the following devtool & recipetool issues:
   -

      go recipes are not devtool upgradeable (#14944)
      -

      recipetool create should add tag=3D for git SRC_URI (#15816)
      -

   We have moved a couple of planned releases forward by a week to avoid
   needing to make a release during the end of the year holidays.
   -

      6.1.1:    2026-11-23
      -

      6.0.5:    2026-11-30
      -

      5.0.22:   2026-12-07
      -

      6.2 M1:   2026-12-14


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

   WDD 2636 (last week 2629) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   OE-Core/Poky Patch Metrics
   -

      Total found: 1047 (last week 1040)
      -

      Patches in the Pending State: 135 (13%) [last week 135 (13%)]
      -

      https://valkyrie.yocto.io/pub/non-release/patchmetrics/


Upcoming development releases

   -

   YP 6.2 M1
   -

      Build Date w/c 2026-11-30
      -

      Release Date w/c 2026-12-14
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

   YP 6.1.1
   -

      Build Date w/c 2026-11-09
      -

      Release Date w/c 2026-11-23
      -

   YP 6.0.5
   -

      Build Date w/c 2026-11-16
      -

      Release Date w/c 2026-11-30
      -

   YP 5.0.22
   -

      Build Date w/c 2026-11-23
      -

      Release Date w/c 2026-12-07
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

--00000000000042ff33065fee0cfb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-8b2e25f4-7fff-95ab-d9=
8c-5826440c003b"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical=
-align:baseline;white-space:pre-wrap">Current Dev Position: YP 6.2 M1 - Dev=
elopment</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre-wrap">Next Deadline: YP 6.2 M1: w/c 2026-=
12-14</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-se=
rif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;verti=
cal-align:baseline;white-space:pre-wrap">Next Team Meetings:</span></p><ul =
style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-st=
yle-type:disc;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0)=
;background-color:transparent;font-variant:normal;vertical-align:baseline;w=
hite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgro=
und-color:transparent;font-variant:normal;vertical-align:baseline;white-spa=
ce:pre-wrap">Bug Triage meeting - Thursday 12th Nov. 7:30am PDT (</span><a =
href=3D"https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09"=
 style=3D"text-decoration:none"><span style=3D"font-size:11pt;background-co=
lor:transparent;font-variant:normal;text-decoration:underline;vertical-alig=
n:baseline;white-space:pre-wrap">https://zoom.us/j/454367603?pwd=3DZGxoa2ZX=
L3FkM3Y0bFd5aVpHVVZ6dz09</span></a><span style=3D"font-size:11pt;background=
-color:transparent;font-variant:normal;vertical-align:baseline;white-space:=
pre-wrap">)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;fo=
nt-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" =
role=3D"presentation"><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Wee=
kly Project Engineering Sync=C2=A0 - Tuesday 10th Nov. 8am PDT (</span><a h=
ref=3D"https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09" =
style=3D"text-decoration:none"><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant:normal;text-decoration:underline;vertical-align=
:baseline;white-space:pre-wrap">https://zoom.us/j/990892712?pwd=3DcHU1MjhoM=
2x6ck81bkcrYjRrcmJsUT09</span></a><a href=3D"https://zoom.us/j/990892712" s=
tyle=3D"text-decoration:none"><span style=3D"font-size:11pt;background-colo=
r:transparent;font-variant:normal;text-decoration:underline;vertical-align:=
baseline;white-space:pre-wrap">)</span></a></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:9.5pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant:normal;vertical-align:baselin=
e;white-space:pre-wrap">Yocto Project Patch Review - Thursday 12th Nov. 10a=
m GMT and Monday 16th Nov.. 9am PDT (</span><a href=3D"https://zoom.us/j/97=
762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1" style=3D"text-decoration=
:none"><span style=3D"font-size:11pt;background-color:transparent;font-vari=
ant:normal;text-decoration:underline;vertical-align:baseline;white-space:pr=
e-wrap">https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb=
.1</span></a><span style=3D"font-size:11pt;background-color:transparent;fon=
t-variant:normal;vertical-align:baseline;white-space:pre-wrap">)</span></p>=
</li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;co=
lor:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-al=
ign:baseline;white-space:pre-wrap">Project data dashboard: </span><a href=
=3D"https://dashboard.yoctoproject.org/" style=3D"text-decoration:none"><sp=
an style=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:tr=
ansparent;font-variant:normal;text-decoration:underline;vertical-align:base=
line;white-space:pre-wrap">https://dashboard.yoctoproject.org/</span></a><s=
pan style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);b=
ackground-color:transparent;font-variant:normal;vertical-align:baseline;whi=
te-space:pre-wrap">=C2=A0</span></p><br><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-=
family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-=
variant:normal;vertical-align:baseline;white-space:pre-wrap">Key Status/Upd=
ates:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre-wrap">There is a proposal and proof of concept fo=
r changes to layer configuration and setup out for discussion/review:=C2=A0=
</span></p></li></ul><p dir=3D"ltr" style=3D"line-height:1.38;margin-left:3=
6pt;margin-top:0pt;margin-bottom:0pt"><a href=3D"https://lists.openembedded=
.org/g/openembedded-architecture/message/2463" style=3D"text-decoration:non=
e"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;background-co=
lor:transparent;font-variant:normal;text-decoration:underline;vertical-alig=
n:baseline;white-space:pre-wrap">https://lists.openembedded.org/g/openembed=
ded-architecture/message/2463</span></a></p><ul style=3D"margin-top:0px;mar=
gin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11p=
t;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pres=
entation"><span style=3D"font-size:11pt;background-color:transparent;font-v=
ariant:normal;vertical-align:baseline;white-space:pre-wrap">The proposed la=
yer changes will likely be more invasive than many of the recent changes bu=
t also incorporate a number of new features and improvements which will mak=
e them useful to everyone and allow various cleanups of existing code.</spa=
n></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fon=
t-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fon=
t-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentat=
ion"><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t:normal;vertical-align:baseline;white-space:pre-wrap">There is also a disc=
ussion about recipe specific hosttools:</span></p></li></ul><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-left:36pt;margin-top:0pt;margin-bottom:0pt=
"><a href=3D"https://lists.openembedded.org/g/openembedded-architecture/mes=
sage/2467" style=3D"text-decoration:none"><span style=3D"font-size:11pt;fon=
t-family:Arial,sans-serif;background-color:transparent;font-variant:normal;=
text-decoration:underline;vertical-align:baseline;white-space:pre-wrap">htt=
ps://lists.openembedded.org/g/openembedded-architecture/message/2467</span>=
</a></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" styl=
e=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant:normal;vertical-align:baselin=
e;white-space:pre-wrap">The Yocto Project wiki has undergone significant cl=
eanup, mostly with removal of obsolete pages/information. We plan to migrat=
e the remaining data to a different solution. If anyone is able to help wit=
h review of content, please let us know.</span></p></li><li dir=3D"ltr" sty=
le=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-alig=
n:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:=
11pt;background-color:transparent;font-variant:normal;vertical-align:baseli=
ne;white-space:pre-wrap">The project has adopted an updated policy on AI-ge=
nerated contributions: </span><a href=3D"https://docs.yoctoproject.org/cont=
ributor-guide/ai-assisted-contribution-policy.html" style=3D"text-decoratio=
n:none"><span style=3D"font-size:11pt;background-color:transparent;font-var=
iant:normal;text-decoration:underline;vertical-align:baseline;white-space:p=
re-wrap">https://docs.yoctoproject.org/contributor-guide/ai-assisted-contri=
bution-policy.html</span></a></p></li><li dir=3D"ltr" style=3D"list-style-t=
ype:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-co=
lor:transparent;font-variant:normal;vertical-align:baseline;white-space:pre=
-wrap">There was a widely reported security issue with musl+openssh. The pr=
oject has published details on the situation here:</span></p></li></ul><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-left:36pt;margin-top:0pt;margin=
-bottom:0pt"><a href=3D"https://lists.yoctoproject.org/g/yocto-security/mes=
sage/1728" style=3D"text-decoration:none"><span style=3D"font-size:11pt;fon=
t-family:Arial,sans-serif;background-color:transparent;font-variant:normal;=
text-decoration:underline;vertical-align:baseline;white-space:pre-wrap">htt=
ps://lists.yoctoproject.org/g/yocto-security/message/1728</span></a></p><ul=
 style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-s=
tyle-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0)=
;background-color:transparent;font-variant:normal;vertical-align:baseline;w=
hite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgro=
und-color:transparent;font-variant:normal;vertical-align:baseline;white-spa=
ce:pre-wrap">We had some positive response to our request for help with the=
 issues highlighted from the bug triage team last week. Further help is req=
uested with the following devtool &amp; recipetool issues:</span></p></li><=
ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list=
-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,=
0,0);background-color:transparent;font-variant:normal;vertical-align:baseli=
ne;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;bac=
kground-color:transparent;font-variant:normal;vertical-align:baseline;white=
-space:pre-wrap">go recipes are not devtool upgradeable (#14944)</span></p>=
</li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-va=
riant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre-wrap">recipetool create shoul=
d add tag=3D for git SRC_URI (#15816)</span></p></li></ul><li dir=3D"ltr" s=
tyle=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;co=
lor:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-al=
ign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-siz=
e:11pt;background-color:transparent;font-variant:normal;vertical-align:base=
line;white-space:pre-wrap">We have moved a couple of planned releases forwa=
rd by a week to avoid needing to make a release during the end of the year =
holidays.</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li=
 dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Ari=
al,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:no=
rmal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span s=
tyle=3D"font-size:11pt;background-color:transparent;font-variant:normal;ver=
tical-align:baseline;white-space:pre-wrap">6.1.1:=C2=A0 =C2=A0 2026-11-23</=
span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11p=
t;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pres=
entation"><span style=3D"font-size:11pt;background-color:transparent;font-v=
ariant:normal;vertical-align:baseline;white-space:pre-wrap">6.0.5:=C2=A0 =
=C2=A0 2026-11-30</span></p></li><li dir=3D"ltr" style=3D"list-style-type:c=
ircle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-variant:normal;vertical-align:baseline;white-spac=
e:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color=
:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-wr=
ap">5.0.22: =C2=A0 2026-12-07</span></p></li><li dir=3D"ltr" style=3D"list-=
style-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0=
,0);background-color:transparent;font-variant:normal;vertical-align:baselin=
e;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;back=
ground-color:transparent;font-variant:normal;vertical-align:baseline;white-=
space:pre-wrap">6.2 M1: =C2=A0 2026-12-14</span></p></li></ul></ul><br><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><spa=
n style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);bac=
kground-color:transparent;font-variant:normal;vertical-align:baseline;white=
-space:pre-wrap">Want to contribute? We would appreciate help with the foll=
owing areas:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li d=
ir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">We have several open issues for pseu=
do and limited maintainer time to work on them. Help from someone familiar =
with systems programming in C would be greatly appreciated. </span><a href=
=3D"https://bugzilla.yoctoproject.org/buglist.cgi?list_id=3D661406&amp;prio=
rity=3DHigh&amp;priority=3DMedium%2B&amp;product=3DPseudo&amp;query_format=
=3Dadvanced&amp;resolution=3D---" style=3D"text-decoration:none"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant:normal;text-d=
ecoration:underline;vertical-align:baseline;white-space:pre-wrap">https://b=
ugzilla.yoctoproject.org/buglist.cgi?list_id=3D661406&amp;priority=3DHigh&a=
mp;priority=3DMedium%2B&amp;product=3DPseudo&amp;query_format=3Dadvanced&am=
p;resolution=3D---</span></a></p></li><li dir=3D"ltr" style=3D"list-style-t=
ype:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-co=
lor:transparent;font-variant:normal;vertical-align:baseline;white-space:pre=
-wrap">There are a large number of intermittent failures on our autobuilder=
, any help with investigating, reproducing or solving these issues would be=
 welcome! </span><a href=3D"https://valkyrie.yocto.io/pub/non-release/abint=
/" style=3D"text-decoration:none"><span style=3D"font-size:11pt;background-=
color:transparent;font-variant:normal;text-decoration:underline;vertical-al=
ign:baseline;white-space:pre-wrap">https://valkyrie.yocto.io/pub/non-releas=
e/abint/</span></a></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;f=
ont-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" =
role=3D"presentation"><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Man=
y recipes in openembedded-core would benefit from a new recipe maintainer. =
Please look at </span><a href=3D"https://git.openembedded.org/openembedded-=
core/tree/meta/conf/distro/include/maintainers.inc" style=3D"text-decoratio=
n:none"><span style=3D"font-size:11pt;background-color:transparent;font-var=
iant:normal;text-decoration:underline;vertical-align:baseline;white-space:p=
re-wrap">https://git.openembedded.org/openembedded-core/tree/meta/conf/dist=
ro/include/maintainers.inc</span></a><span style=3D"font-size:11pt;backgrou=
nd-color:transparent;font-variant:normal;vertical-align:baseline;white-spac=
e:pre-wrap"> and see if you can adopt any of the unassigned recipes.</span>=
</p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-=
family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-=
variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentatio=
n"><span style=3D"font-size:11pt;background-color:transparent;font-variant:=
normal;vertical-align:baseline;white-space:pre-wrap">For more ways to contr=
ibute, see </span><a href=3D"https://docs.google.com/document/d/18oxKWxLorf=
F813h82mK6yKTIHeBp_-9owFuCWbzgjOk/edit?usp=3Dsharing" style=3D"text-decorat=
ion:none"><span style=3D"font-size:11pt;background-color:transparent;font-v=
ariant:normal;text-decoration:underline;vertical-align:baseline;white-space=
:pre-wrap">https://docs.google.com/document/d/18oxKWxLorfF813h82mK6yKTIHeBp=
_-9owFuCWbzgjOk/edit?usp=3Dsharing</span></a></p></li></ul><br><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
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
l-align:baseline;white-space:pre-wrap">WDD 2636 (last week 2629) </span><sp=
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
white-space:pre-wrap">Total found: 1047 (last week 1040)</span></p></li><li=
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
ans-serif;background-color:transparent;font-variant:normal;vertical-align:b=
aseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11p=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">YP 6.2 =
M1</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D=
"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans=
-serif;background-color:transparent;font-variant:normal;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;f=
ont-variant:normal;vertical-align:baseline;white-space:pre-wrap">Build Date=
 w/c </span><span style=3D"font-size:11pt;background-color:transparent;font=
-variant:normal;vertical-align:baseline;white-space:pre-wrap">2026-11-30</s=
pan></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt=
;font-family:Arial,sans-serif;background-color:transparent;font-variant:nor=
mal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span st=
yle=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;white-spa=
ce:pre-wrap">Release Date w/c </span><span style=3D"font-size:11pt;backgrou=
nd-color:transparent;font-variant:normal;vertical-align:baseline;white-spac=
e:pre-wrap">2026-12-14</span></p></li></ul><li dir=3D"ltr" style=3D"list-st=
yle-type:disc;font-size:11pt;font-family:Arial,sans-serif;background-color:=
transparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" ro=
le=3D"presentation"><span style=3D"font-size:11pt;font-variant:normal;verti=
cal-align:baseline;white-space:pre-wrap">YP 6.2 M2</span></p></li><ul style=
=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-t=
ype:circle;font-size:11pt;font-family:Arial,sans-serif;background-color:tra=
nsparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">Build Date w/c </span><span style=3D=
"font-size:11pt;background-color:transparent;font-variant:normal;vertical-a=
lign:baseline;white-space:pre-wrap">2027-01-18</span></p></li><li dir=3D"lt=
r" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-se=
rif;background-color:transparent;font-variant:normal;vertical-align:baselin=
e;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font=
-variant:normal;vertical-align:baseline;white-space:pre-wrap">Release Date =
w/c </span><span style=3D"font-size:11pt;background-color:transparent;font-=
variant:normal;vertical-align:baseline;white-space:pre-wrap">2027-02-01</sp=
an></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11=
pt;font-family:Arial,sans-serif;background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span =
style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">YP 6.2 M3</span></p></li><ul style=3D"margin-top:0px;margin-=
bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;=
font-family:Arial,sans-serif;background-color:transparent;font-variant:norm=
al;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span sty=
le=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;white-spac=
e:pre-wrap">Build Date w/c </span><span style=3D"font-size:11pt;background-=
color:transparent;font-variant:normal;vertical-align:baseline;white-space:p=
re-wrap">2027-03-01</span></p></li><li dir=3D"ltr" style=3D"list-style-type=
:circle;font-size:11pt;font-family:Arial,sans-serif;background-color:transp=
arent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">Release Date w/c </span><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">2027-03-15</span></p></li></ul><li d=
ir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,s=
ans-serif;background-color:transparent;font-variant:normal;vertical-align:b=
aseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11p=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">YP 6.2.=
0</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"=
ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-=
serif;background-color:transparent;font-variant:normal;vertical-align:basel=
ine;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;fo=
nt-variant:normal;vertical-align:baseline;white-space:pre-wrap">Build Date =
w/c </span><span style=3D"font-size:11pt;background-color:transparent;font-=
variant:normal;vertical-align:baseline;white-space:pre-wrap">2027-04-26</sp=
an></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;=
font-family:Arial,sans-serif;background-color:transparent;font-variant:norm=
al;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span sty=
le=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;white-spac=
e:pre-wrap">Release Date w/c </span><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant:normal;vertical-align:baseline;white-space=
:pre-wrap">2027-05-03</span></p></li></ul></ul><br><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size=
:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transp=
arent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Upc=
oming dot releases:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px=
"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:=
Arial,sans-serif;background-color:transparent;font-variant:normal;vertical-=
align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-s=
ize:11pt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">=
YP 6.1.1</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li =
dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Aria=
l,sans-serif;background-color:transparent;font-variant:normal;vertical-alig=
n:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:=
11pt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Buil=
d Date w/c 2026-11-09</span></p></li><li dir=3D"ltr" style=3D"list-style-ty=
pe:circle;font-size:11pt;font-family:Arial,sans-serif;background-color:tran=
sparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">Release Date w/c 2026-11-23</span></=
p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fo=
nt-family:Arial,sans-serif;background-color:transparent;font-variant:normal=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;white-space:=
pre-wrap">YP 6.0.5</span></p></li><ul style=3D"margin-top:0px;margin-bottom=
:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-f=
amily:Arial,sans-serif;background-color:transparent;font-variant:normal;ver=
tical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"=
font-size:11pt;font-variant:normal;vertical-align:baseline;white-space:pre-=
wrap">Build Date w/c 2026-11-16</span></p></li><li dir=3D"ltr" style=3D"lis=
t-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;background-=
color:transparent;font-variant:normal;vertical-align:baseline;white-space:p=
re"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt" role=3D"presentation"><span style=3D"font-size:11pt;font-variant:normal=
;vertical-align:baseline;white-space:pre-wrap">Release Date w/c 2026-11-30<=
/span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-size=
:11pt;font-family:Arial,sans-serif;background-color:transparent;font-varian=
t:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><sp=
an style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;whit=
e-space:pre-wrap">YP 5.0.22</span></p></li><ul style=3D"margin-top:0px;marg=
in-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11=
pt;font-family:Arial,sans-serif;background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span =
style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">Build Date w/c 2026-11-23</span></p></li><li dir=3D"ltr" sty=
le=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;ba=
ckground-color:transparent;font-variant:normal;vertical-align:baseline;whit=
e-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-varia=
nt:normal;vertical-align:baseline;white-space:pre-wrap">Release Date w/c 20=
26-12-07</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;=
font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;font-variant:normal;vertical-align:baseline;white-space:pre"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
 role=3D"presentation"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Fo=
r future release dates, see </span><a href=3D"https://wiki.yoctoproject.org=
/wiki/Release_calendar" style=3D"text-decoration:none"><span style=3D"font-=
size:11pt;background-color:transparent;font-variant:normal;text-decoration:=
underline;vertical-align:baseline;white-space:pre-wrap">https://wiki.yoctop=
roject.org/wiki/Release_calendar</span></a></p></li></ul><br><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-co=
lor:transparent;font-variant:normal;vertical-align:baseline;white-space:pre=
-wrap">The Yocto Project=E2=80=99s technical governance is through its Tech=
nical Steering Committee, more information is available at:</span></p><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><a hr=
ef=3D"https://wiki.yoctoproject.org/wiki/TSC" style=3D"text-decoration:none=
"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;background-col=
or:transparent;font-variant:normal;text-decoration:underline;vertical-align=
:baseline;white-space:pre-wrap">https://wiki.yoctoproject.org/wiki/TSC</spa=
n></a></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;co=
lor:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-al=
ign:baseline;white-space:pre-wrap">The Status reports are stored on the wik=
i at: </span><a href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status" s=
tyle=3D"text-decoration:none"><span style=3D"font-size:11pt;font-family:Ari=
al,sans-serif;background-color:transparent;font-variant:normal;text-decorat=
ion:underline;vertical-align:baseline;white-space:pre-wrap">https://wiki.yo=
ctoproject.org/wiki/Weekly_Status</span></a></p><br><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-siz=
e:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:trans=
parent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">[I=
f anyone has suggestions for other information you=E2=80=99d like to see on=
 this weekly status update, let us know!]</span></p></span><br class=3D"gma=
il-Apple-interchange-newline"><div><span style=3D"font-family:Arial,sans-se=
rif;font-size:12pt;background-color:transparent">Thanks,</span></div><div d=
ir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><di=
v dir=3D"ltr"><div dir=3D"ltr">

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

--00000000000042ff33065fee0cfb--
