Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C3DC83F34
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 14:51:54 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.15152.1753195909107220115
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 22 Jul 2025 07:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=io2ydINa;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3137c20213cso5192234a91.3;
        Tue, 22 Jul 2025 07:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753195908; x=1753800708; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yj7S9bRmONmrMbgsH13pfDFE3Pd6SjZh575L5mQgjAk=;
        b=io2ydINaOx2tsS/I3yGwvQFTsUw9IPptoh36EeY8BRYvUcDKiMwcN6L8SfEV+cALXa
         WWq/GEofvFACIFyZEb7nXkC4jcaVfTNDMHSao3pW6oe3w6sO7ANx0ZS6LhQ6Z+D3yc1G
         CcJKgcAoQ3nZhd3GD8tK4gbQU0mGFxu+q/G2y1E4JXHF5+4+J9lW2w4qcKoasHACg5U2
         B1ctPNZNG70cYzxwycGDxZIlx4ppTZYoDG0KH+fUy2xX8mN5gIyHGgfefY7ofaNFCZVT
         13wue5ManvtU9R+RExR6Ga3pl30NUAzM6c3oCXfrizJCG9/TgvWcUbNEJFl6sE/LQKlu
         wUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753195908; x=1753800708;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yj7S9bRmONmrMbgsH13pfDFE3Pd6SjZh575L5mQgjAk=;
        b=fzENsgYQ8a4DqSdS+c85+MTCskWHrivY9LCbvnKOppN4g21PJPTzqcuswLrik9LDuv
         9xRRKDR8o28tKpIMKlrm3+7QaRNZtF1iglJpxaRQkpUIUbdhTdmOMNz7ixc1wcua5mf+
         wII2tjg9srcpfaUKzCUPZ1XC6B2jbqFvqw1ssIxcKiyp3daf+EV62mmqQvceOhovGXAP
         6fYr2tuGTvRSKkjoWkO1Ihcpc/39Sq/xpRwBAWVJVkZDzbQvfFMCHI5haZHpO/0tXAhM
         vjhqu7NnXabo5LWePioClTlI7bPs2/J25jdsU/Un3CHK/aqUqbR7pANyyDJZdHy2j06e
         Eyqg==
X-Forwarded-Encrypted: i=1; AJvYcCUQt1qU4ybmLaEt4RMgGHT6E5kHRTZ14M9VcMfFgdN+V3rVdF5OKFJY4fSJ4rRZ0Bzscau+jlDsCF9pcfE=@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yw9hI62RSTlDVTjzYAKKm56r0GB0LGgoiamVPqf5Dg0uRxM5nQK
	4r+TgGmPQMEMTirf7klU+dSmf3QYKV9+WTKA3wqm0Idv+6jF6brUfmz4e0p/L4u+75uzyKFh1n9
	OV9zbWdbfXqFDd+USoP5ZXj7N1RJy3Tbs3KboIpA=
X-Gm-Gg: ASbGncu5c03T2ZG03UXvWUBSokwnykg42pK+D/nrcTmcxO4dMPBIOTrqHGMa5w405NU
	TdSmCmuwMJmVuchP+mAYTav58b/2CZlHpPB3cSCjQlave3dGCCVp1qtQj/e2IRgVZJuC/F+CoHz
	MxrUMLFgbuotumcebsL6ZI64WUsXA/09tpx7AwVghuD2zs2SGUcUgtBrN7xnMkPjjUSGYS+YDbP
	fDqwF1S+F5gcYCCvD62MI2qW4rrRrntS1urv9U7cA==
X-Google-Smtp-Source: AGHT+IFH26IMb5P+hREh/8wLmRoD9JsOMl/XSlROb+D8VgEGFLjpvlNoudteMTak26e2jhkJgbkg1DpjzEv0udafv2o=
X-Received: by 2002:a17:90a:d888:b0:31c:c085:fde6 with SMTP id
 98e67ed59e1d1-31cc085fe32mr28957563a91.0.1753195907722; Tue, 22 Jul 2025
 07:51:47 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 22 Jul 2025 07:51:36 -0700
X-Gm-Features: Ac12FXyPbRGzVvRMzdqQieRp2tuR37ectx5HxeUZKGZNyddfeiBhumM5jgJJ0S4
Message-ID: <CAK5yBb9EvxSXJ55S8bxq4FqF8RK=8GsJam6T3VXTskjiKS-bOA@mail.gmail.com>
Subject: Yocto Project Status 22 July. 2025 (WW29)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000004d33a0063a85bb24"
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Tue, 22 Jul 2025 14:51:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/73

--0000000000004d33a0063a85bb24
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 5.3 M2

Next Deadline: YP 5.3 M2 Build date 2025-07-21

Next Team Meetings:

   -

   Bug Triage meeting - Thursday July 24th 7:30 am PDT (
   https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
   -

   Weekly Project Engineering Sync  - Tuesday July 22nd 8 am PDT (
   https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
   <https://zoom.us/j/990892712>
   -

   Yocto Project Patch Review - Thursday July 24th 10am GMT and Monday July
   30th 9am PDT (
   https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1
   <https://zoom.us/j/97762397148?pwd=3D1xkiC9hp9SjEonaTaONwTb6iWry4Eb.1>)


Project data dashboard: https://dashboard.yoctoproject.org/

Key Status/Updates:

   -

   YP 5.3 M2 is due to build this week.
   -

   YP 5.2.2 was released
   -

   YP 5.0.11 is due to be released
   -

   Patches continue to merge into master for upgrades and fixes.
   -

   We have a reproducibility regression in lldb which needs fixing urgently
   due to CI failures.
   -

   We were able to root cause and resolve the 5.3 M1 QA reported gtk-play
   regression.
   -

   The clang build time (41min -> 76min) and size (350MB -> 535MB)
   increases continue to cause significant concern. We do have some mitigat=
ion
   patches in progress.
   -

   The main mirroring issues left are around =E2=80=9Cdownloadfilename=E2=
=80=9D support in
   urls which likely needs to be rewritten.
   -

   cmake 4.X merged, thanks to everyone who helped with fixes.
   -

   Fixes for bitbake for python 3.14 around multiprocessing have been
   proposed. There are also bitbake profiling fixes for python 3.12+ and so=
me
   small performance tweaks.
   -

   For M3, the following changes have been mentioned as possibilities:
   -

      Bitbake-setup (although this is feeling not ready and too late for
      the next LTS)
      -

      wic split from OE-Core
      -

      RISC-V tune changes (final part)
      -

      switch classextend to use [filter] support from bitbake


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
   https://dashboard.yoctoproject.org/bugtriage/#newcomer-container
   -

   There are bugs that are currently unassigned for YP 5.3. See:
   https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium+_5.3_Unassigned_Enh=
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
   -

   Ongoing project development plans are being developed in this document:
   https://docs.google.com/document/d/1xsnN_HcaMhqg6Dn1P_19AnumDaUMQSdFZ_I4=
rjD830A/edit?usp=3Dsharing

We need to continue to develop this as it will allow us to potentially find
ways to fund specific work items.

Tracking Metrics:

   -

   WDD 2799 (last week 2824) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   OE-Core/Poky Patch Metrics
   -

      Total patches found: 1096 (last week 1099)
      -

      Patches in the Pending State: 156 (14%) [last week 156 (14%)]
      -

      https://autobuilder.yocto.io/pub/non-release/patchmetrics/


YP 5.3 Milestone Dates:

   -

   YP 5.3 M2 Build Date 2025-07-21
   -

   YP 5.3 M2 Release Date 2025-08-01
   -

   YP 5.3 M3 Build Date 2025-09-01
   -

   YP 5.3 M3 Release Date 2025-09-12
   -

   YP 5.3 M4 Build Date 2025-10-06
   -

   YP 5.3 M4 Release Date 2025-10-31


Upcoming dot releases:.

   -

   YP 5.2.2 was released.
   -

   YP 5.0.11 is ready for release.
   -

   YP 4.0.29 Build Date 2025-08-11
   -

   YP 4.0.29 Release Date 2025-08-25
   -

   YP 5.2.3 Build Date 2025-08-18
   -

   YP 5.2.3 Release Date 2025-08-29
   -

   YP 5.0.12 Build Date 2025-08-25
   -

   YP 5.0.12 Release Date 2025-09-05
   -

   YP 4.0.30 Build Date 2025-09-22
   -

   YP 4.0.30 Release Date 2025-10-03
   -

   YP 5.2.4 Build Date 2025-09-29
   -

   YP 5.2.4 Release Date 2025-10-10
   -

   YP 5.0.13 Build Date 2025-10-13
   -

   YP 5.0.13 Release Date 2025-10-24
   -

   YP 4.0.31 Build Date 2025-11-03
   -

   YP 4.031 Release Date 2025-11-14
   -

   YP 5.0.14 Build Date 2025-11-17
   -

   YP 5.0.14 Release Date 2025-11-28
   -

   YP 4.0.32 Build Date 2025-12-15
   -

   YP 4.0.32 Release Date 2025-12-24
   -

   YP 5.0.15 Build Date 2026-01-05
   -

   YP 5.0.15 Release Date 2026-01-16


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

--0000000000004d33a0063a85bb24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span id=3D"gmail-docs-internal-guid-2f845f36-7fff-bb=
4f-b12b-2ad40b1f3277"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-=
serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical=
-align:baseline">Current Dev Position: YP 5.3 M2</span></p><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"f=
ont-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fo=
nt-variant-alternates:normal;vertical-align:baseline">Next Deadline: YP 5.3=
 M2 Build date 2025-07-21</span></p><br><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-=
family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;font-variant-alternat=
es:normal;vertical-align:baseline">Next Team Meetings:</span></p><ul style=
=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-t=
ype:disc;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;font-variant-alternates:normal;vertical-align:baseline;white-space=
:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;font=
-variant-alternates:normal;vertical-align:baseline">Bug Triage meeting - Th=
ursday July 24th 7:30 am PDT (</span><a href=3D"https://zoom.us/j/454367603=
?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09" style=3D"text-decoration-line:none=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;text-decoration-line:underline;vertical-align:baseline">https://zoom.us/j/=
454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</span></a><span style=3D"f=
ont-size:11pt;background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:ba=
seline">)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font=
-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;font=
-variant-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">Weekly Project Engineering Sync=
=C2=A0 - Tuesday July 22nd 8 am PDT (</span><a href=3D"https://zoom.us/j/99=
0892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09" style=3D"text-decoration-li=
ne:none"><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates=
:normal;text-decoration-line:underline;vertical-align:baseline">https://zoo=
m.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</span></a><a href=
=3D"https://zoom.us/j/990892712" style=3D"text-decoration-line:none"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-variant-alternates:normal;text-de=
coration-line:underline;vertical-align:baseline">)</span></a></p></li><li d=
ir=3D"ltr" style=3D"list-style-type:disc;font-size:9.5pt;font-family:Arial,=
sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;font-variant-alternates:normal;ver=
tical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"=
font-size:11pt;background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:b=
aseline">Yocto Project Patch Review - Thursday July 24th 10am GMT and Monda=
y July 30th 9am PDT (</span><a href=3D"https://zoom.us/j/97762397148?pwd=3D=
1xkiC9hp9SjEonaTaONwTb6iWry4Eb.1" style=3D"text-decoration-line:none"><span=
 style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;font-variant-alternates:normal;text-d=
ecoration-line:underline;vertical-align:baseline">https://zoom.us/j/9776239=
7148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1</span></a><span style=3D"font-=
size:11pt;background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;font-variant-alternates:normal;vertical-align:baseli=
ne">)</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Ari=
al,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;=
vertical-align:baseline">Project data dashboard: </span><a href=3D"https://=
dashboard.yoctoproject.org/" style=3D"text-decoration-line:none"><span styl=
e=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-=
alternates:normal;text-decoration-line:underline;vertical-align:baseline">h=
ttps://dashboard.yoctoproject.org/</span></a><span style=3D"font-size:11pt;=
font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alt=
ernates:normal;vertical-align:baseline">=C2=A0</span></p><br><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
font-variant-alternates:normal;vertical-align:baseline">Key Status/Updates:=
</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" s=
tyle=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;co=
lor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:b=
aseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11p=
t;background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;font-variant-alternates:normal;vertical-align:baseline">YP 5=
.3 M2 is due to build this week.</span></p></li><li dir=3D"ltr" style=3D"li=
st-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,=
0,0);background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-variant-alternates:normal;vertical-align:baseline;wh=
ite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;font-variant-alternates:normal;vertical-align:baseline">YP 5.2.2 was r=
eleased</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-s=
ize:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-va=
riant-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pr=
esentation"><span style=3D"font-size:11pt;background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alterna=
tes:normal;vertical-align:baseline">YP 5.0.11 is due to be released</span><=
/p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-f=
amily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;font-variant-alternate=
s:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><sp=
an style=3D"font-size:11pt;background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;font-variant-alternates:normal;vert=
ical-align:baseline">Patches continue to merge into master for upgrades and=
 fixes.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-s=
ize:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-va=
riant-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pr=
esentation"><span style=3D"font-size:11pt;background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alterna=
tes:normal;vertical-align:baseline">We have a reproducibility regression in=
 lldb which needs fixing urgently due to CI failures.</span></p></li><li di=
r=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sa=
ns-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;font-variant-alternates:normal;verti=
cal-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fo=
nt-size:11pt;background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;vertical-align:bas=
eline">We were able to root cause and resolve the 5.3 M1 QA reported gtk-pl=
ay regression.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc=
;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
font-variant-alternates:normal;vertical-align:baseline;white-space:pre"><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" rol=
e=3D"presentation"><span style=3D"font-size:11pt;background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-=
alternates:normal;vertical-align:baseline">The clang build time (41min -&gt=
; 76min) and size (350MB -&gt; 535MB) increases continue to cause significa=
nt concern. We do have some mitigation patches in progress.</span></p></li>=
<li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ar=
ial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline">The main mirroring issues left are around =E2=80=9Cdownloadfil=
ename=E2=80=9D support in urls which likely needs to be rewritten.</span></=
p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates=
:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><spa=
n style=3D"font-size:11pt;background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;font-variant-alternates:normal;verti=
cal-align:baseline">cmake 4.X merged, thanks to everyone who helped with fi=
xes.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size=
:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varia=
nt-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"prese=
ntation"><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates=
:normal;vertical-align:baseline">Fixes for bitbake for python 3.14 around m=
ultiprocessing have been proposed. There are also bitbake profiling fixes f=
or python 3.12+ and some small performance tweaks.</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;font-variant-alternates:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line">For M3, the following changes have been mentioned as possibilities:</=
span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr=
" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-al=
ign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-siz=
e:11pt;background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline"=
>Bitbake-setup (although this is feeling not ready and too late for the nex=
t LTS)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-=
size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-v=
ariant-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D=
"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"p=
resentation"><span style=3D"font-size:11pt;background-color:transparent;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;font-variant-altern=
ates:normal;vertical-align:baseline">wic split from OE-Core</span></p></li>=
<li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:=
Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norm=
al;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span sty=
le=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-a=
lign:baseline">RISC-V tune changes (final part)</span></p></li><li dir=3D"l=
tr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-s=
erif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-=
align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-s=
ize:11pt;background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;font-variant-alternates:normal;vertical-align:baselin=
e">switch classextend to use [filter] support from bitbake</span></p></li><=
/ul></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;col=
or:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:ba=
seline">Ways to contribute:</span></p><ul style=3D"margin-top:0px;margin-bo=
ttom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font=
-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alterna=
tes:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><=
span style=3D"font-size:11pt;background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;ve=
rtical-align:baseline">As people are likely aware, the project has a number=
 of components which are either unmaintained, or have people with little to=
 no time trying to keep them alive. These components include: devtool, toas=
ter, wic, oeqa, autobuilder, CROPs containers, pseudo and more. Many have o=
pen bugs. Help is welcome in trying to better look after these components!<=
/span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:9.5p=
t;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentat=
ion"><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:nor=
mal;vertical-align:baseline">There is an issue open upstream with the opens=
sl project related to making path relocation of openssl easier (as used in =
our buildtools tarball and SDK). We=E2=80=99d love assistance in moving thi=
s forward and getting some kind of upstream feature merged to make this eas=
ier: </span><a href=3D"https://github.com/openssl/openssl/pull/19260" style=
=3D"text-decoration-line:none"><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;text-decoration-line:underline;vertical-align=
:baseline">https://github.com/openssl/openssl/pull/19260</span></a></p></li=
><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:A=
rial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norma=
l;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-al=
ign:baseline">There are bugs identified as possible for newcomers to the pr=
oject: </span><a href=3D"https://dashboard.yoctoproject.org/bugtriage/#newc=
omer-container" style=3D"text-decoration-line:none"><span style=3D"font-siz=
e:11pt;background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-variant-alternates:normal;text-decoration-line:und=
erline;vertical-align:baseline">https://dashboard.yoctoproject.org/bugtriag=
e/#newcomer-container</span></a></p></li><li dir=3D"ltr" style=3D"list-styl=
e-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;font-variant-alternates:normal;vertical-align:baseline;white-spa=
ce:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fo=
nt-variant-alternates:normal;vertical-align:baseline">There are bugs that a=
re currently unassigned for YP 5.3. See: </span><a href=3D"https://wiki.yoc=
toproject.org/wiki/Bug_Triage#Medium+_5.3_Unassigned_Enhancements/Bugs" sty=
le=3D"text-decoration-line:none"><span style=3D"font-size:11pt;background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;font-variant-alternates:normal;text-decoration-line:underline;vertical-ali=
gn:baseline">https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium+_5.3_Unas=
signed_Enhancements/Bugs</span></a></p></li><li dir=3D"ltr" style=3D"list-s=
tyle-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0)=
;background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;font-variant-alternates:normal;vertical-align:baseline;white-=
space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;font-variant-alternates:normal;vertical-align:baseline">We=E2=80=99d welco=
me new maintainers for recipes in OE-Core. Please see the list at: </span><=
a href=3D"http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/i=
nclude/maintainers.inc" style=3D"text-decoration-line:none"><span style=3D"=
font-size:11pt;background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-variant-alternates:normal;text-decoration-=
line:underline;vertical-align:baseline">http://git.yoctoproject.org/cgit.cg=
i/poky/tree/meta/conf/distro/include/maintainers.inc</span></a><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline"> and discuss with the existing maintainer, or ask on the OE-Co=
re mailing list. We will likely move a chunk of these to =E2=80=9CUnassigne=
d=E2=80=9D soon to help facilitate this.</span></p></li><li dir=3D"ltr" sty=
le=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;vertical-align:bas=
eline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;font-variant-alternates:normal;vertical-align:baseline">Help i=
s very much welcome in trying to resolve our autobuilder intermittent issue=
s. You can see the list of failures we=E2=80=99re continuing to see by sear=
ching for the =E2=80=9CAB-INT=E2=80=9D tag in bugzilla: </span><a href=3D"h=
ttps://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DAB-INT" style=3D=
"text-decoration-line:none"><span style=3D"font-size:11pt;background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;font=
-variant-alternates:normal;text-decoration-line:underline;vertical-align:ba=
seline">https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DAB-INT<=
/span></a><span style=3D"font-size:11pt;background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;font-variant-alternate=
s:normal;vertical-align:baseline">.</span></p></li><li dir=3D"ltr" style=3D=
"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb=
(0,0,0);background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;font-variant-alternates:normal;vertical-align:baseline">Help us res=
olve CVE issues: </span><a href=3D"https://autobuilder.yocto.io/pub/non-rel=
ease/patchmetrics/" style=3D"text-decoration-line:none"><span style=3D"font=
-size:11pt;background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;font-variant-alternates:normal;text-decoration-line=
:underline;vertical-align:baseline">CVE metrics</span></a><span style=3D"fo=
nt-size:11pt;background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;vertical-align:bas=
eline">=C2=A0</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;=
font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;vertical-align:baseline;white-space:pre"><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
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
t might get fixed.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:=
disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;font-variant-alternates:normal;vertical-align:baseline;white-space:pre"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
 role=3D"presentation"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;font-vari=
ant-alternates:normal;vertical-align:baseline">Further help on optimizing b=
uild disk usage would be most welcome.</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;font-variant-alternates:normal;vertical-align:basel=
ine;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;font-variant-alternates:normal;vertical-align:baseline">Ongoing =
project development plans are being developed in this document: </span><a h=
ref=3D"https://docs.google.com/document/d/1xsnN_HcaMhqg6Dn1P_19AnumDaUMQSdF=
Z_I4rjD830A/edit?usp=3Dsharing" style=3D"text-decoration-line:none"><span s=
tyle=3D"font-size:11pt;background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;font-variant-alternates:normal;text-dec=
oration-line:underline;vertical-align:baseline">https://docs.google.com/doc=
ument/d/1xsnN_HcaMhqg6Dn1P_19AnumDaUMQSdFZ_I4rjD830A/edit?usp=3Dsharing</sp=
an></a></p></li></ul><p dir=3D"ltr" style=3D"line-height:1.38;margin-left:3=
6pt;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates=
:normal;vertical-align:baseline">We need to continue to develop this as it =
will allow us to potentially find ways to fund specific work items.</span><=
/p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb=
(0,0,0);background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline=
">Tracking Metrics:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px=
"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:=
Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norm=
al;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span sty=
le=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-a=
lign:baseline">WDD 2799 (last week 2824) </span><span style=3D"font-size:11=
pt;font-family:Consolas,sans-serif;background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:nor=
mal;vertical-align:baseline">(</span><a href=3D"https://wiki.yoctoproject.o=
rg/charts/combo.html" style=3D"text-decoration-line:none"><span style=3D"fo=
nt-size:11pt;background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;text-decoration-li=
ne:underline;vertical-align:baseline">https://wiki.yoctoproject.org/charts/=
combo.html</span></a><span style=3D"font-size:11pt;font-family:Consolas,san=
s-serif;background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline=
">)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:=
11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-var=
iant-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pre=
sentation"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;font-variant-alternates:normal;vertical-align:baseline">OE-Core/Pok=
y Patch Metrics</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0p=
x"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-fami=
ly:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:n=
ormal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-variant-alternates:normal;vertica=
l-align:baseline">Total patches found: 1096 (last week 1099)</span></p></li=
><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family=
:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:nor=
mal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span st=
yle=3D"font-size:11pt;background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-=
align:baseline">Patches in the Pending State: 156 (14%) [last week 156 (14%=
)]</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size=
:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-va=
riant-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pr=
esentation"><a href=3D"https://autobuilder.yocto.io/pub/non-release/patchme=
trics/" style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;f=
ont-family:Arial,sans-serif;background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;font-variant-alternates:normal;tex=
t-decoration-line:underline;vertical-align:baseline">https://autobuilder.yo=
cto.io/pub/non-release/patchmetrics/</span></a></p></li></ul></ul><br><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span=
 style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;font-variant-alternates:normal;vertical-align:baseline">YP 5.3 Mil=
estone Dates:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li =
dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,=
sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;font-variant-alternates:normal;ver=
tical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"=
font-size:11pt;background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:b=
aseline">YP 5.3 M2 Build Date 2025-07-21</span><span style=3D"font-size:11p=
t;background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;font-variant-alternates:normal;vertical-align:baseline"><spa=
n class=3D"gmail-Apple-tab-span" style=3D"text-wrap-mode: nowrap;">	</span>=
</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11p=
t;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentat=
ion"><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:nor=
mal;vertical-align:baseline">YP 5.3 M2 Release Date 2025-08-01</span></p></=
li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family=
:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:nor=
mal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span st=
yle=3D"font-size:11pt;background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-=
align:baseline">YP 5.3 M3 Build Date 2025-09-01</span><span style=3D"font-s=
ize:11pt;background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;font-variant-alternates:normal;vertical-align:baselin=
e"><span class=3D"gmail-Apple-tab-span" style=3D"text-wrap-mode: nowrap;">	=
</span></span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-s=
ize:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-va=
riant-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pr=
esentation"><span style=3D"font-size:11pt;background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alterna=
tes:normal;vertical-align:baseline">YP 5.3 M3 Release Date 2025-09-12</span=
></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font=
-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alterna=
tes:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><=
span style=3D"font-size:11pt;background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;ve=
rtical-align:baseline">YP 5.3 M4 Build Date 2025-10-06</span><span style=3D=
"font-size:11pt;background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:=
baseline"><span class=3D"gmail-Apple-tab-span" style=3D"text-wrap-mode: now=
rap;">	</span></span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc=
;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
font-variant-alternates:normal;vertical-align:baseline;white-space:pre"><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" rol=
e=3D"presentation"><span style=3D"font-size:11pt;background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-=
alternates:normal;vertical-align:baseline">YP 5.3 M4 Release Date 2025-10-3=
1</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;font-variant-alternates:normal;vert=
ical-align:baseline">Upcoming dot releases:.</span></p><ul style=3D"margin-=
top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;fo=
nt-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fon=
t-variant-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">YP 5.2.2 was released.</span></p>=
</li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fami=
ly:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:n=
ormal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-variant-alternates:normal;vertica=
l-align:baseline">YP 5.0.11 is ready for release.</span></p></li><li dir=3D=
"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-s=
erif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-=
align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-s=
ize:11pt;background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;font-variant-alternates:normal;vertical-align:baselin=
e">YP 4.0.29 Build Date 2025-08-11</span><span style=3D"font-size:11pt;back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;font-variant-alternates:normal;vertical-align:baseline"><span clas=
s=3D"gmail-Apple-tab-span" style=3D"text-wrap-mode: nowrap;">	</span></span=
></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font=
-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alterna=
tes:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><=
span style=3D"font-size:11pt;background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;ve=
rtical-align:baseline">YP 4.0.29 Release Date 2025-08-25</span></p></li><li=
 dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial=
,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;ve=
rtical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D=
"font-size:11pt;background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:=
baseline">YP 5.2.3 Build Date 2025-08-18</span><span style=3D"font-size:11p=
t;background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;font-variant-alternates:normal;vertical-align:baseline"><spa=
n class=3D"gmail-Apple-tab-span" style=3D"text-wrap-mode: nowrap;">	</span>=
</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11p=
t;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentat=
ion"><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:nor=
mal;vertical-align:baseline">YP 5.2.3 Release Date 2025-08-29</span></p></l=
i><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:=
Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norm=
al;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span sty=
le=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-a=
lign:baseline">YP 5.0.12 Build Date 2025-08-25</span><span style=3D"font-si=
ze:11pt;background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline=
"><span class=3D"gmail-Apple-tab-span" style=3D"text-wrap-mode: nowrap;">	<=
/span></span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-si=
ze:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-var=
iant-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pre=
sentation"><span style=3D"font-size:11pt;background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;font-variant-alternat=
es:normal;vertical-align:baseline">YP 5.0.12 Release Date 2025-09-05</span>=
</p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-=
family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;font-variant-alternat=
es:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><s=
pan style=3D"font-size:11pt;background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;font-variant-alternates:normal;ver=
tical-align:baseline">YP 4.0.30 Build Date 2025-09-22</span><span style=3D"=
font-size:11pt;background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:b=
aseline"><span class=3D"gmail-Apple-tab-span" style=3D"text-wrap-mode: nowr=
ap;">	</span></span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;=
font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;vertical-align:baseline;white-space:pre"><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">YP 4.0.30 Release Date 2025-10-03=
</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11p=
t;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentat=
ion"><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:nor=
mal;vertical-align:baseline">YP 5.2.4 Build Date 2025-09-29</span><span sty=
le=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-a=
lign:baseline"><span class=3D"gmail-Apple-tab-span" style=3D"text-wrap-mode=
: nowrap;">	</span></span></p></li><li dir=3D"ltr" style=3D"list-style-type=
:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;font-variant-alternates:normal;vertical-align:baseline;white-space:pre=
"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-var=
iant-alternates:normal;vertical-align:baseline">YP 5.2.4 Release Date 2025-=
10-10</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-siz=
e:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;font-vari=
ant-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pres=
entation"><span style=3D"font-size:11pt;background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;font-variant-alternate=
s:normal;vertical-align:baseline">YP 5.0.13 Build Date 2025-10-13</span></p=
></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fam=
ily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:=
normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span=
 style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;font-variant-alternates:normal;vertic=
al-align:baseline">YP 5.0.13 Release Date 2025-10-24</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;font-variant-alternates:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line">YP 4.0.31 Build Date 2025-11-03</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;font-variant-alternates:normal;vertical-align:basel=
ine;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;font-variant-alternates:normal;vertical-align:baseline">YP 4.031=
 Release Date 2025-11-14</span></p></li><li dir=3D"ltr" style=3D"list-style=
-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;font-variant-alternates:normal;vertical-align:baseline;white-spac=
e:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fon=
t-variant-alternates:normal;vertical-align:baseline">YP 5.0.14 Build Date 2=
025-11-17</span><span style=3D"font-size:11pt;background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alt=
ernates:normal;vertical-align:baseline"><span class=3D"gmail-Apple-tab-span=
" style=3D"text-wrap-mode: nowrap;">	</span></span></p></li><li dir=3D"ltr"=
 style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;=
color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-variant-alternates:normal;vertical-align=
:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;vertical-align:baseline">YP=
 5.0.14 Release Date 2025-11-28</span></p></li><li dir=3D"ltr" style=3D"lis=
t-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0=
,0);background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;vertical-align:baseline;whi=
te-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;font-variant-alternates:normal;vertical-align:baseline">YP 4.0.32 Build=
 Date 2025-12-15</span><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;font-vari=
ant-alternates:normal;vertical-align:baseline"><span class=3D"gmail-Apple-t=
ab-span" style=3D"text-wrap-mode: nowrap;">	</span></span></p></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;font-variant-alternates:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line">YP 4.0.32 Release Date 2025-12-24</span></p></li><li dir=3D"ltr" styl=
e=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;font-variant-alternates:normal;vertical-align:baseline">YP 5.0.=
15 Build Date 2026-01-05</span><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;vertical-align:baseline"><span class=3D"gmail=
-Apple-tab-span" style=3D"text-wrap-mode: nowrap;">	</span></span></p></li>=
<li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ar=
ial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline">YP 5.0.15 Release Date 2026-01-16</span></p></li></ul><br><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><spa=
n style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;font-variant-alternates:normal;vertical-align:baseline">The Yocto=
 Project=E2=80=99s technical governance is through its Technical Steering C=
ommittee, more information is available at:</span></p><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><a href=3D"https://w=
iki.yoctoproject.org/wiki/TSC" style=3D"text-decoration-line:none"><span st=
yle=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varian=
t-alternates:normal;text-decoration-line:underline;vertical-align:baseline"=
>https://wiki.yoctoproject.org/wiki/TSC</span></a></p><br><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fo=
nt-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fon=
t-variant-alternates:normal;vertical-align:baseline">The Status reports are=
 now stored on the wiki at: </span><a href=3D"https://wiki.yoctoproject.org=
/wiki/Weekly_Status" style=3D"text-decoration-line:none"><span style=3D"fon=
t-size:11pt;font-family:Arial,sans-serif;background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;font-variant-alternat=
es:normal;text-decoration-line:underline;vertical-align:baseline">https://w=
iki.yoctoproject.org/wiki/Weekly_Status</span></a></p><br><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fo=
nt-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fon=
t-variant-alternates:normal;vertical-align:baseline">[If anyone has suggest=
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

--0000000000004d33a0063a85bb24--

