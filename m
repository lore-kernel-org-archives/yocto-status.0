Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C1BC5B56A
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 14:48:19 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56114.1786459695795873286
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 07:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IP2HToSv;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6b0ab918216so74275eaf.3
        for <yocto-status@lists.yoctoproject.org>; Tue, 11 Aug 2026 07:48:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786459695; cv=none;
        d=google.com; s=arc-20260327;
        b=eIVkb2kHpLHKaQMfU6Y8lnORziLM6kFKDmkCiQlkHav/+DFw8VXKJ7KeuTCY55GUI+
         fvTCYeYiW4GK4l0LSzzoOKX5Dx9ieFmWgc3Dzp3Q52rhpgwcfTSzhLvh1+X4ethX+0Ur
         FKcLpe9Gan29zT6WGHZpxY0x6XXpbEXbLlY41nX2MdOvREc7rgF/177KU3Zq4ssVuDrv
         BDFx9kNUOxV+xczqiRcskGAzcWdgZ5cohk5SEvRLvBqP3wJWcweyS/rhpOmy6u/Pl4m3
         gN2VWdYb1ujhJEmD3B2OgqZDn5HkleAIYR5JzYT3nfK7fqOrXeZHsPYOjN55veGqJ4mi
         /nAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=gAndZuON6NeKOiLtXDR3Vm7eHkLau4hn1k2iaT1Xe5g=;
        fh=F6q5rNnH/htQhPnCwjl88lCUi7jypiyr9VH8f/Xj8pI=;
        b=GEsNDXeCosHRWrPmbxLXwfQuemUDR+tWX7CNtVBAjz5Zw7Aym9XWDPjIJyinf4KQbC
         EryscxOlDr2O44RfZykMv9sA5YtClaOQ5gr2rf9K8iizl2sgqj8976b+ZR8OWyRGHEEm
         xdXhx/rbRC3CKODbuJLydae8mKcRVmnHzZER5zxzDJKmNb0o/oHtunv8nymTTAt6pLfa
         6GVGMX9JQ8oEbetF5Hn1sa+AyUgwDEAjJOluyCoPvpWa3/iAPvdROMSgxJdToaVBdGQg
         QYwFJjHQAVTC+RrNOBn2+TyN6exrMeD3zTUilU4gdUzj7xVMyN+I7sG4WBtRapJhVm2P
         JShA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786459695; x=1787064495; darn=lists.yoctoproject.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gAndZuON6NeKOiLtXDR3Vm7eHkLau4hn1k2iaT1Xe5g=;
        b=IP2HToSvWhYq7BusurK1xwDQIUVvP3b7MoBiISc5QEnqrDM7qC6Hb8UepX/3kt71cM
         R9dyIFa4IbpJWsc+AUXIBOdBfcF9LnfCm7XqFtT8Fpb4+lGh3fDJGUpkbLhWNCDOLBkJ
         e3Ioadiowh4ztK98H+YOc7N7Delj+PHdiBvhTdh5FDtXBsK8nXJmeMytb3RITKz5wg3O
         298mxwbZtZoFkwb7LBdzGdfWNd0/SjLlJwrv7hIqQwBSR87P6d7ig0tjllJZNmk4K7ua
         ptBdlzRWHUuPptw5IT+g4ynQB4dZxdr0VDDJ5JUzXBvi9AHwOEBmMmUPTfecU7hvXdAK
         vA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786459695; x=1787064495;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gAndZuON6NeKOiLtXDR3Vm7eHkLau4hn1k2iaT1Xe5g=;
        b=eNgGF1AKG1l9PrI7eQxft1K69aXIGLG203kDNGlw/lhEKzq4tezDG1be3b2uzmrgSB
         lFWg6Hprrr1fzDT2IFvUDBY12/tUDXED+e6TCxJWiOBsHj5G6wQDe3sPW9m6hVlfABUE
         qfoVSsXOZj+lvH4G7qt5mLMnNSZgpishGCqTpx6IEML60JVboKYTvrMTbbQdayqemkMy
         Wg5ZyDSiodH/t+MrhuRwrJK/xjN1XABqUlkyjLqvHcOjg1pDEY4wbbMSzXXlBODPZx0d
         dv/ony6BbMnGL+ng9TKddUCGSej/ReroXYAqW4BD+70Es0xo54Ui906ebJHaZxFFJgty
         jKsw==
X-Forwarded-Encrypted: i=1; AHgh+RrJ+3urVEWwrI16dwojL5EhjJEtiS/VCOfhoAmfEYgbLn8evShNh9rdDLzPneS+hlnhal14yqrbUa5uaKc=@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yz6BEgpGU8o5IHciFgsd3r8F82XsbcNuggT5NiG7lXxrl4Cqe7A
	ihNkBa0B+5jsqf7ejrJ1byduiY9a9lWl/hl8oi4/aVNQuNZWKFDcie0yVR8/+VJAevl1RQkzcmG
	uq1phJ3yNMNr+1ncepHCYXC4vPXgy3pE=
X-Gm-Gg: AR+sD13ucjvzT99SSxbwpphY7op67UqA4cDYMGbQEQ38+Bp8kKM3gY2PU6mrXJH9sOj
	Mi/uY8IGL0ImLyvvRQFGC5Nrf9qGUarD+F4kUEaZreJbEf0aWBXI0iKKOSuyQ47xLCYrrzrbJgy
	VxQOqXpxC/2yUcp3FBvhuHJPK8H8gnGc8nNVGUF8clvrDiCnyscOh7SLDZqR+d8L0iXNzWNusgK
	v4Aufn9YflxdMymagonPHEx3zPt1CR8PlSWuPcAAlsKJguc8RBhP6kLn8DmEOGzTn817Ml0ZJm7
	gHDxlqL9+kwLRIGwHXdwILyQaoxP2PQH8kasAQRq5TwfbFohvqTzFC8q4quB66ellbMbesQnEfG
	/1t6G9BhZA4UqwzBmvl7WKUvRLKMIGCUKHqmfEEtf7+JYvN+IS06UaMeBWWtp7iFvQFiSOprfon
	C1KwniTis0qmR4IKmReNnK+takOzuePUN6Ml/NcFbNBQ8wUUrVeedkG8Xz6PA7NYWeylWeWVfY0
	7VdIwSEWaETW//bmV7M0z4mTdM=
X-Received: by 2002:a05:6820:4b03:b0:6a3:c1a2:bd4 with SMTP id
 006d021491bc7-6b0acbbee01mr147028eaf.20.1786459694559; Tue, 11 Aug 2026
 07:48:14 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 11 Aug 2026 07:48:01 -0700
X-Gm-Features: AUfX_myR3s86Ol6Jm6PtUfXUg_CtteoHQ3UlsTQotOnSN_xdAXbDeyWZyqzrcVs
Message-ID: <CAK5yBb_tawHj4dS3n61zSkW7CGeStApOK4NaTXzRJDb8Y+CXSA@mail.gmail.com>
Subject: Yocto Project Status 11 August 2026 (WW33)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000007ff6410658c68f9c"
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Tue, 11 Aug 2026 14:48:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/134

--0000000000007ff6410658c68f9c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 6.1 M3

Next Deadline: YP 6.1 M3: w/c 2026-08-31

Next Team Meetings:

   -

   Bug Triage meeting - Thursday 13rd Aug. 7:30am PDT (
   https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
   -

   Weekly Project Engineering Sync  - Tuesday 11th Aug. 8am PDT (
   https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
   <https://zoom.us/j/990892712>
   -

   Yocto Project Patch Review - Thursday 13rd Aug. 10am GMT and Monday 17th
   Aug. 9am PDT (
   https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1)


Project data dashboard: https://dashboard.yoctoproject.org/

Key Status/Updates:

   -

   YP 6.1 M2 has been released
   -

   YP 6.1 M3 is due in three weeks and this will be the feature freeze
   point for YP 6.1.
   -

   We would like to remind everyone that AI-generated code submitted to
   Yocto Project must include disclosure of the use of AI tools, in line wi=
th
   our policy in the contributor guide (
   https://docs.yoctoproject.org/contributor-guide/submit-changes.html#acce=
ptance-of-ai-generated-code).
   Joshua has sent patches adding AGENTS.md <http://agents.md> files to
   bitbake and openembedded-core to prompt agents to follow this policy. We
   are discussing further updates to our policy on AI assisted submissions =
as
   this is a rapidly evolving area.
   -

   Alex Stewart is stepping down as maintainer of opkg - huge thanks to him
   for his work on the project over the last 5 years, and thanks to Nationa=
l
   Instruments/Emerson for their continued support of opkg. Maintainership =
is
   being handed over to Erick Shepherd (also from NI/Emerson), there is als=
o a
   call for input and anyone interested in being a co-maintainer:
   https://lists.yoctoproject.org/g/opkg/topic/120687514
   -

   The NPM fetcher has been re-enabled in bitbake with security
   improvements and additional test cases
   -

   The upgrade to sbom-cve-check 1.3.3 has more correct handling of
   Ubuntu/Red Hat specific CVEs, which may require new patches or CVE_STATU=
S
   assignments. The fallout in OE-core has been handled, other layers may s=
ee
   an uptick in reported CVEs.
   -

   The SDK_TOOLCHAIN_LANGS variable has been replaced with a more general
   SDK_FEATURES variable to support improved SDK configurability. Uses of t=
he
   old variable will need to be updated, `go` and `rust` langs are still
   supported as SDK features.
   -

   There are two AB-INT issues which are in a position where others could
   now help, as detailed in
   https://lists.openembedded.org/g/openembedded-core/message/242105:
   -

      Matchbox-wm segfault/xserver restart
      -

      aarch64/x86-64 build host contamination/reproducibility issue

We get a lot of comments about these being hard to reproduce or work on, in
both cases, these have specific well defined things which need to be done
and a basic understanding of what the issue relates to, if not the actual
fix.

   -

   Remaining intermittent build failures of concern:
   -

      other qemu =E2=80=98hang=E2=80=99 type issues on ARM
      -

      sometimes yocto-check-layer is showing checksum mismatch issues
      -

      intermittent ptest failures in many recipes


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

   WDD 2694 (last week 2694) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   OE-Core/Poky Patch Metrics
   -

      Total patches found: 1028 (last week 1029)
      -

      Patches in the Pending State: 139 (14%) [last week 141 (14%)]
      -

      https://valkyrie.yocto.io/pub/non-release/patchmetrics/


Upcoming development releases:

   -

   6.1 M2: is released,
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

--0000000000007ff6410658c68f9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span id=3D"gmail-docs-internal-guid-9c56c850-7fff-4a=
fd-bf32-fac60c7b4313"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-=
serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;ver=
tical-align:baseline;white-space:pre-wrap">Current Dev Position: YP 6.1 M3<=
/span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align:=
baseline;white-space:pre-wrap">Next Deadline: YP 6.1 M3: w/c 2026-08-31</sp=
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
ap">Bug Triage meeting - Thursday 13rd Aug. 7:30am PDT (</span><a href=3D"h=
ttps://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09" style=3D=
"text-decoration:none"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant:normal;text-decoration:underline;vertical-align:baselin=
e;white-space:pre-wrap">https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0b=
Fd5aVpHVVZ6dz09</span></a><span style=3D"font-size:11pt;background-color:tr=
ansparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap"=
>)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:9=
.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpa=
rent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D=
"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"p=
resentation"><span style=3D"font-size:11pt;background-color:transparent;fon=
t-variant:normal;vertical-align:baseline;white-space:pre-wrap">Weekly Proje=
ct Engineering Sync=C2=A0 - Tuesday 11th Aug. 8am PDT (</span><a href=3D"ht=
tps://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09" style=3D"=
text-decoration:none"><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant:normal;text-decoration:underline;vertical-align:baseline=
;white-space:pre-wrap">https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bk=
crYjRrcmJsUT09</span></a><a href=3D"https://zoom.us/j/990892712" style=3D"t=
ext-decoration:none"><span style=3D"font-size:11pt;background-color:transpa=
rent;font-variant:normal;text-decoration:underline;vertical-align:baseline;=
white-space:pre-wrap">)</span></a></p></li><li dir=3D"ltr" style=3D"list-st=
yle-type:disc;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0)=
;background-color:transparent;font-variant:normal;vertical-align:baseline;w=
hite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgro=
und-color:transparent;font-variant:normal;vertical-align:baseline;white-spa=
ce:pre-wrap">Yocto Project Patch Review - Thursday 13rd Aug. 10am GMT and M=
onday 17th Aug. 9am PDT (</span><a href=3D"https://zoom.us/j/97762397148?pw=
d=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1" style=3D"text-decoration:none"><span=
 style=3D"font-size:11pt;background-color:transparent;font-variant:normal;t=
ext-decoration:underline;vertical-align:baseline;white-space:pre-wrap">http=
s://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1</span></a=
><span style=3D"font-size:11pt;background-color:transparent;font-variant:no=
rmal;vertical-align:baseline;white-space:pre-wrap">)</span></p></li></ul><b=
r><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre-wrap">Project data dashboard: </span><a href=3D"https://da=
shboard.yoctoproject.org/" style=3D"text-decoration:none"><span style=3D"fo=
nt-size:11pt;font-family:Arial,sans-serif;background-color:transparent;font=
-variant:normal;text-decoration:underline;vertical-align:baseline;white-spa=
ce:pre-wrap">https://dashboard.yoctoproject.org/</span></a><span style=3D"f=
ont-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-w=
rap">=C2=A0</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal=
;vertical-align:baseline;white-space:pre-wrap">Key Status/Updates:</span></=
p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"l=
ist-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0=
,0,0);background-color:transparent;font-variant:normal;vertical-align:basel=
ine;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant:normal;vertical-align:baseline;whit=
e-space:pre-wrap">YP 6.1 M2 has been released</span></p></li><li dir=3D"ltr=
" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical=
-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-=
size:11pt;background-color:transparent;font-variant:normal;vertical-align:b=
aseline;white-space:pre-wrap">YP 6.1 M3 is due in three weeks and this will=
 be the feature freeze point for YP 6.1.</span></p></li><li dir=3D"ltr" sty=
le=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-alig=
n:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:=
11pt;background-color:transparent;font-variant:normal;vertical-align:baseli=
ne;white-space:pre-wrap">We would like to remind everyone that AI-generated=
 code submitted to Yocto Project must include disclosure of the use of AI t=
ools, in line with our policy in the contributor guide (</span><a href=3D"h=
ttps://docs.yoctoproject.org/contributor-guide/submit-changes.html#acceptan=
ce-of-ai-generated-code" style=3D"text-decoration:none"><span style=3D"font=
-size:11pt;background-color:transparent;font-variant:normal;text-decoration=
:underline;vertical-align:baseline;white-space:pre-wrap">https://docs.yocto=
project.org/contributor-guide/submit-changes.html#acceptance-of-ai-generate=
d-code</span></a><span style=3D"font-size:11pt;background-color:transparent=
;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">). Joshu=
a has sent patches adding </span><a href=3D"http://agents.md" style=3D"text=
-decoration:none"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;text-decoration:underline;vertical-align:baseline;whi=
te-space:pre-wrap">AGENTS.md</span></a><span style=3D"font-size:11pt;backgr=
ound-color:transparent;font-variant:normal;vertical-align:baseline;white-sp=
ace:pre-wrap"> files to bitbake and openembedded-core to prompt agents to f=
ollow this policy. We are discussing further updates to our policy on AI as=
sisted submissions as this is a rapidly evolving area.</span></p></li><li d=
ir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">Alex Stewart is stepping down as mai=
ntainer of opkg - huge thanks to him for his work on the project over the l=
ast 5 years, and thanks to National Instruments/Emerson for their continued=
 support of opkg. Maintainership is being handed over to Erick Shepherd (al=
so from NI/Emerson), there is also a call for input and anyone interested i=
n being a co-maintainer: </span><a href=3D"https://lists.yoctoproject.org/g=
/opkg/topic/120687514" style=3D"text-decoration:none"><span style=3D"font-s=
ize:11pt;background-color:transparent;font-variant:normal;text-decoration:u=
nderline;vertical-align:baseline;white-space:pre-wrap">https://lists.yoctop=
roject.org/g/opkg/topic/120687514</span></a></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align:=
baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11=
pt;background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre-wrap">The NPM fetcher has been re-enabled in bitbake with =
security improvements and additional test cases</span></p></li><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre-wrap">The upgrade to sbom-cve-check 1.3.3 has mor=
e correct handling of Ubuntu/Red Hat specific CVEs, which may require new p=
atches or CVE_STATUS assignments. The fallout in OE-core has been handled, =
other layers may see an uptick in reported CVEs.</span></p></li><li dir=3D"=
ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-se=
rif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;verti=
cal-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fo=
nt-size:11pt;background-color:transparent;font-variant:normal;vertical-alig=
n:baseline;white-space:pre-wrap">The SDK_TOOLCHAIN_LANGS variable has been =
replaced with a more general SDK_FEATURES variable to support improved SDK =
configurability. Uses of the old variable will need to be updated, `go` and=
 `rust` langs are still supported as SDK features.</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;v=
ertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">There are two AB-INT issues which ar=
e in a position where others could now help, as detailed in </span><a href=
=3D"https://lists.openembedded.org/g/openembedded-core/message/242105" styl=
e=3D"text-decoration:none"><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant:normal;text-decoration:underline;vertical-align:bas=
eline;white-space:pre-wrap">https://lists.openembedded.org/g/openembedded-c=
ore/message/242105</span></a><span style=3D"font-size:11pt;background-color=
:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-wr=
ap">:</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=
=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">Matchbox-wm segfault/xserver restart=
</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:1=
1pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpar=
ent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pr=
esentation"><span style=3D"font-size:11pt;background-color:transparent;font=
-variant:normal;vertical-align:baseline;white-space:pre-wrap">aarch64/x86-6=
4 build host contamination/reproducibility issue</span></p></li></ul></ul><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-left:36pt;margin-top:0pt;mar=
gin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;=
color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-=
align:baseline;white-space:pre-wrap">We get a lot of comments about these b=
eing hard to reproduce or work on, in both cases, these have specific well =
defined things which need to be done and a basic understanding of what the =
issue relates to, if not the actual fix.</span></p><ul style=3D"margin-top:=
0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-s=
ize:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Remaini=
ng intermittent build failures of concern:</span></p></li><ul style=3D"marg=
in-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circ=
le;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-=
color:transparent;font-variant:normal;vertical-align:baseline;white-space:p=
re"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tr=
ansparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap"=
>other qemu =E2=80=98hang=E2=80=99 type issues on ARM</span></p></li><li di=
r=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,=
sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:norma=
l;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre-wrap">sometimes yocto-check-layer is show=
ing checksum mismatch issues</span></p></li><li dir=3D"ltr" style=3D"list-s=
tyle-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">intermittent ptest failures in many recipes</span></p></li><=
/ul></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;col=
or:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">Want to contribute? We would appreciate h=
elp with the following areas:</span></p><ul style=3D"margin-top:0px;margin-=
bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fo=
nt-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fo=
nt-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presenta=
tion"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt:normal;vertical-align:baseline;white-space:pre-wrap">We have several ope=
n issues for pseudo and limited maintainer time to work on them. Help from =
someone familiar with systems programming in C would be greatly appreciated=
. </span><a href=3D"https://bugzilla.yoctoproject.org/buglist.cgi?list_id=
=3D661406&amp;priority=3DHigh&amp;priority=3DMedium%2B&amp;product=3DPseudo=
&amp;query_format=3Dadvanced&amp;resolution=3D---" style=3D"text-decoration=
:none"><span style=3D"font-size:11pt;background-color:transparent;font-vari=
ant:normal;text-decoration:underline;vertical-align:baseline;white-space:pr=
e-wrap">https://bugzilla.yoctoproject.org/buglist.cgi?list_id=3D661406&amp;=
priority=3DHigh&amp;priority=3DMedium%2B&amp;product=3DPseudo&amp;query_for=
mat=3Dadvanced&amp;resolution=3D---</span></a></p></li><li dir=3D"ltr" styl=
e=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant:normal;vertical-align:baselin=
e;white-space:pre-wrap">There are a large number of intermittent failures o=
n our autobuilder, any help with investigating, reproducing or solving thes=
e issues would be welcome! </span><a href=3D"https://valkyrie.yocto.io/pub/=
non-release/abint/" style=3D"text-decoration:none"><span style=3D"font-size=
:11pt;background-color:transparent;font-variant:normal;text-decoration:unde=
rline;vertical-align:baseline;white-space:pre-wrap">https://valkyrie.yocto.=
io/pub/non-release/abint/</span></a></p></li><li dir=3D"ltr" style=3D"list-=
style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0=
);background-color:transparent;font-variant:normal;vertical-align:baseline;=
white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgr=
ound-color:transparent;font-variant:normal;vertical-align:baseline;white-sp=
ace:pre-wrap">Many recipes in openembedded-core would benefit from a new re=
cipe maintainer. Please look at </span><a href=3D"https://git.openembedded.=
org/openembedded-core/tree/meta/conf/distro/include/maintainers.inc" style=
=3D"text-decoration:none"><span style=3D"font-size:11pt;background-color:tr=
ansparent;font-variant:normal;text-decoration:underline;vertical-align:base=
line;white-space:pre-wrap">https://git.openembedded.org/openembedded-core/t=
ree/meta/conf/distro/include/maintainers.inc</span></a><span style=3D"font-=
size:11pt;background-color:transparent;font-variant:normal;vertical-align:b=
aseline;white-space:pre-wrap"> and see if you can adopt any of the unassign=
ed recipes.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;fo=
nt-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color=
:transparent;font-variant:normal;vertical-align:baseline;white-space:pre"><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" r=
ole=3D"presentation"><span style=3D"font-size:11pt;background-color:transpa=
rent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">For =
more ways to contribute, see </span><a href=3D"https://docs.google.com/docu=
ment/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9owFuCWbzgjOk/edit?usp=3Dsharing" sty=
le=3D"text-decoration:none"><span style=3D"font-size:11pt;background-color:=
transparent;font-variant:normal;text-decoration:underline;vertical-align:ba=
seline;white-space:pre-wrap">https://docs.google.com/document/d/18oxKWxLorf=
F813h82mK6yKTIHeBp_-9owFuCWbzgjOk/edit?usp=3Dsharing</span></a></p></li></u=
l><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(=
0,0,0);background-color:transparent;font-variant:normal;vertical-align:base=
line;white-space:pre-wrap">New to the project?</span></p><ul style=3D"margi=
n-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;=
font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;font-variant:normal;vertical-align:baseline;white-space:pre"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
 role=3D"presentation"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">We=
 have a list of issues we think are good places to start contributing: </sp=
an><a href=3D"https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DN=
EWCOMER" style=3D"text-decoration:none"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant:normal;text-decoration:underline;verti=
cal-align:baseline;white-space:pre-wrap">https://bugzilla.yoctoproject.org/=
buglist.cgi?quicksearch=3DNEWCOMER</span></a></p></li></ul><br><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant:normal;vertical-align:baseline;white-space:=
pre-wrap">Tracking Metrics:</span></p><ul style=3D"margin-top:0px;margin-bo=
ttom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font=
-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font=
-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentati=
on"><span style=3D"font-size:11pt;background-color:transparent;font-variant=
:normal;vertical-align:baseline;white-space:pre-wrap">WDD 2694 (last week 2=
694) </span><span style=3D"font-size:11pt;font-family:Consolas,sans-serif;b=
ackground-color:transparent;font-variant:normal;vertical-align:baseline;whi=
te-space:pre-wrap">(</span><a href=3D"https://wiki.yoctoproject.org/charts/=
combo.html" style=3D"text-decoration:none"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant:normal;text-decoration:underline;ve=
rtical-align:baseline;white-space:pre-wrap">https://wiki.yoctoproject.org/c=
harts/combo.html</span></a><span style=3D"font-size:11pt;font-family:Consol=
as,sans-serif;background-color:transparent;font-variant:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">)</span></p></li><li dir=3D"ltr" style=3D=
"list-style-type:disc;font-size:11pt;font-family:Consolas,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align:=
baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11=
pt;font-family:Arial,sans-serif;background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre-wrap">OE-Core/Poky Patch Metr=
ics</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=
=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">Total patches found: 1028 (last week=
 1029)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-=
size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Patches=
 in the Pending State: 139 (14%) [last week 141 (14%)]</span></p></li><li d=
ir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Conso=
las,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><a hre=
f=3D"https://valkyrie.yocto.io/pub/non-release/patchmetrics/" style=3D"text=
-decoration:none"><span style=3D"font-size:11pt;font-family:Arial,sans-seri=
f;background-color:transparent;font-variant:normal;text-decoration:underlin=
e;vertical-align:baseline;white-space:pre-wrap">https://valkyrie.yocto.io/p=
ub/non-release/patchmetrics/</span></a></p></li></ul></ul><br><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant:normal;vertical-align:baseline;white-space:=
pre-wrap">Upcoming development releases:</span></p><ul style=3D"margin-top:=
0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-s=
ize:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">6.1 M2:=
 is released,</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;=
font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;font-variant:normal;vertical-align:baseline;white-space:pre"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
 role=3D"presentation"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">6.=
1 M3:</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=
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
ariant:normal;vertical-align:baseline;white-space:pre-wrap">YP 6.0.3</span>=
</p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" sty=
le=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;ba=
ckground-color:transparent;font-variant:normal;vertical-align:baseline;whit=
e-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-varia=
nt:normal;vertical-align:baseline;white-space:pre-wrap">Build Date w/c 2026=
-08-10</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-=
size:11pt;font-family:Arial,sans-serif;background-color:transparent;font-va=
riant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline=
;white-space:pre-wrap">Release Date w/c 2026-08-24</span></p></li></ul><li =
dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,=
sans-serif;background-color:transparent;font-variant:normal;vertical-align:=
baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11=
pt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">YP 5.0=
.20</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=
=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,s=
ans-serif;background-color:transparent;font-variant:normal;vertical-align:b=
aseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11p=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Build D=
ate w/c 2026-08-17</span></p></li><li dir=3D"ltr" style=3D"list-style-type:=
circle;font-size:11pt;font-family:Arial,sans-serif;background-color:transpa=
rent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D=
"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"p=
resentation"><span style=3D"font-size:11pt;font-variant:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">Release Date w/c 2026-08-31</span></p></l=
i></ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-va=
riant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre-wrap">For future release date=
s, see </span><a href=3D"https://wiki.yoctoproject.org/wiki/Release_calenda=
r" style=3D"text-decoration:none"><span style=3D"font-size:11pt;background-=
color:transparent;font-variant:normal;text-decoration:underline;vertical-al=
ign:baseline;white-space:pre-wrap">https://wiki.yoctoproject.org/wiki/Relea=
se_calendar</span></a></p></li></ul><br><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-=
family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-=
variant:normal;vertical-align:baseline;white-space:pre-wrap">The Yocto Proj=
ect=E2=80=99s technical governance is through its Technical Steering Commit=
tee, more information is available at:</span></p><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt"><a href=3D"https://wiki.yo=
ctoproject.org/wiki/TSC" style=3D"text-decoration:none"><span style=3D"font=
-size:11pt;font-family:Arial,sans-serif;background-color:transparent;font-v=
ariant:normal;text-decoration:underline;vertical-align:baseline;white-space=
:pre-wrap">https://wiki.yoctoproject.org/wiki/TSC</span></a></p><br><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">The Status reports are stored on the wiki at: </span><a href=
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

--0000000000007ff6410658c68f9c--

