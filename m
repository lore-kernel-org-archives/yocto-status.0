Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB164C54F57
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 14:50:32 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13199.1785250223256658836
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 07:50:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=enBoIZlx;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca913a601fbso2877818a12.3
        for <yocto-status@lists.yoctoproject.org>; Tue, 28 Jul 2026 07:50:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785250222; cv=none;
        d=google.com; s=arc-20260327;
        b=d9xy7OPYUY83qyBnirlxAlAwuog2Ix3JKj9snVdDluAmkEojEAufCctdiglhC4EaqS
         LWK0Bt/RCjWZRxBRNCDCq1PCzZnaTYbLzX6nkUA1lzkMtkkl0Y3CuOlfe48q4WsVlKXt
         /0bZ09eidga1XzL/KkIIxpkvrLPQ1NfnipwTXAIjW3IBKunJv2Fp/5j7eEcXwp/gD5zA
         PEtXr1AF46OLjtcS/XwT14BwqfBJ7KWWk7+wcYqEp/3Ov21QwAHste/wIitoEPG5j5ji
         H+NMWQSRV3t0MEEnqdBbOQKL97w8gMHZSdvUSv+5jy4jZJZLEVvDnHqeO+UQZjE7eW4w
         mmYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=SENijSCGyQrUNa0WI068OxHOLtjs2tTa6LMM+jGcgwM=;
        fh=KJUbmW4bhWZ6VJIXQlUVuiBocZMp6dxjkwNy5o/ZEOw=;
        b=YGqj4BTpS1mi98u2uu/GAC/rjImM6pjS3XQA6L+tAQis+gDBWvYezesaOaR1LVsJYG
         S1fiwUpj6t2JpmPZSZ89JhaOt20Q7BJz4xd3T5orL57JkNL2f2G5a2nQHMg6mC3hE/fD
         ukMwFdH6eVB73HKOgmK5KTYs0Zj4RWpavZwjBUS5vydcwzPSroTgXMwTDZjAfL1Q3/SX
         1iu/P1iNeg4poVu68gMEYHhW0/IdHMiZerAxCFiN8vNRbysRGuN8pHzMUq7DmlFTcwZN
         ePEGr3TmT1DWNlC8VrkVLKBqHJsHXgBsXLvsgwAxXkHqhNH/xN1b24PwabnF6FUxdRCp
         vEXA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785250222; x=1785855022; darn=lists.yoctoproject.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SENijSCGyQrUNa0WI068OxHOLtjs2tTa6LMM+jGcgwM=;
        b=enBoIZlxoJckKoUV0I/aXQWZvnE2PZDIRxDI3REpwoqjoQuCS6LdBkxVeMXsFx27fm
         fsPghidekDxyOmYNLP0gyPrQ1umQdae/5PA3lolrafeQI5HhMwKML8y6NKl/hh531isT
         rg7VyK2r8bcXgPDkbhP9vD34VThqZQqXZNFcdWQlr8zazUAhhtBl+INdhjd+s08xExX9
         jUsvQ23/92+cL9tB+mSdkb7g8+jSY2cWQDf9F7KxQe2SDbRc+vaWnrUqo5LNO/t9cD8/
         /Q/+/Df9YXgk/Hr/oPL1CwNMTQWLgGZ9s3RAtKlGanyIr3GDbeNhFPAdtYugL7wcpBHc
         n/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785250222; x=1785855022;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SENijSCGyQrUNa0WI068OxHOLtjs2tTa6LMM+jGcgwM=;
        b=YO3pl4Tcb31GsDsvixhfiG3wyBSTQ8URCZfvTOo+LQngXrIbs9tZpp7o9U67qS8xlo
         3Gx6F+F6RBenzVZQ0giUcCLYWuvun1bU1ij/Ts/9OFXXBtItOSvkqEJxXEbnDL/PW8U0
         lZ8uXRCd80M9DwGExBt82s0MLFiTfXS3mho/2rAcNhB1NZOisUl8UZItvgDkaNy5omob
         X+/4lkb5QLxf+fcSBNIOk+4WlwztCi8ukShK0BM+ob1me++qO25G2SUp8sbs2fZgNFfc
         OpPONhzsLLLN7SxtXN1iGxu3kNicch/ZooIxjluMmmMD7QgfA9VbA5mPAyrHmOECYf3G
         OZDg==
X-Forwarded-Encrypted: i=1; AHgh+RpAyjm/a3HWJIIOwwedeRF2Co9s/ehOzd+eQ0f3G6eQ0jkCPTdjUFCl9JlJT7qZxdVr7CUDYjvcmgQqgv4=@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyKjB8vUv508XW1304X4hMLm/2xkNsHvyFiu2I2M3PipCLP0fsw
	N6KGnHVM2ygN3LX+90DmxnyjnAKeioaLWAn2A+CjNo+u9ZI1roTdfy9mbnPmW300ioQJ6VO1VAE
	Fn8jziGVt9ZUoLDHhiShc8mgzTfLG5J8=
X-Gm-Gg: AR+sD13MUOaI9N2I4A2NVo8Vu/nlih68n54RuYfDddFxpaaiwy3uZxxJCXeN2Z1sN/d
	/ZOwDQ+sxM8EV/f/jVOe4wPR++WK6gQ9hAPjba+43wou7uWaHF4yvS1rAGLzjD03+glSNpiXd50
	BoYNmBgAxIagEH3kNKPPFyRkT2z/liJXKr02m4AqilhP7YjPmi7G/4vZxFeVhuy7rp2WHMe/x1V
	mwxdOQOoRMTsTCMXKNao2CgMlbiyjuS87rnIW8evFEONZgcZRQCRjZhjTpqCSIMO8HXM/RtGwBq
	BOnhcIWMYd9T/st+ynwYUX+45lIngcs6lYk9jnaJMSLoVoHf+PidpPkxaf8tJG7R+W9BqPpb6+U
	fPXX8XLWfG2FGi6TzMmTDTkFDYXt61gQ4pORrYo5cqd5nO9SIkNiPdg1rHbddlv1aPDzQYKlfdY
	2GyDjxV7LhQ9phvSMXxbLvZL7+yI/0oKkP7tcn1e21JVlMBEr/Q0fb
X-Received: by 2002:a05:6a21:4593:b0:3c3:a1e6:a624 with SMTP id
 adf61e73a8af0-3c8aafc2301mr3379321637.29.1785250222291; Tue, 28 Jul 2026
 07:50:22 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 28 Jul 2026 07:50:10 -0700
X-Gm-Features: AUfX_mz0UsW0twqxrCNr15ArIf8khjF74a2U0lZvGceUkTBQmjE95dKRB_cE0wM
Message-ID: <CAK5yBb8aCk8BGsN=T4jUJmUGf+E92b2Oj1f9Ts1M0ZDbOS_kwg@mail.gmail.com>
Subject: Yocto Project Status 28 July 2026 (WW31)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000055c3240657acf506"
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Tue, 28 Jul 2026 14:50:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/132

--00000000000055c3240657acf506
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 6.1 M3

Next Deadline: YP 6.1 M3: w/c 2026-08-31

Next Team Meetings:

   -

   Bug Triage meeting - Thursday 30th July 7:30am PDT (
   https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
   -

   Weekly Project Engineering Sync  - Tuesday 28th July 8am PDT (
   https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
   <https://zoom.us/j/990892712>
   -

   Yocto Project Patch Review - Thursday 30th July 10am GMT and Monday 3rd
   Aug. 9am PDT (
   https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1)


Project data dashboard: https://dashboard.yoctoproject.org/

Key Status/Updates:

   -

   YP 5.0.19 has been released
   -

   YP 6.1 M2 is out of QA and under review
   -

   Progress has been made with some of the AB-INT issues:
   -

      We identified a kernel issue likely causing the arm psplash boot hang=
s
      -

      The groff race issues were reported upstream and we have that section
      of the build disabled for groff-native now to avoid them
      -

      Several pseudo issues were patched in a recent update
      -

      One infrastructure issue on a worker was corrected
      -

   There are two AB-INT issues which are in a position where others could
   now help, as detailed in
   https://lists.openembedded.org/g/openembedded-core/message/242105:
   -

      Matchbox-wm segfault/xserver restart
      <https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13908>
      -

      aarch64/x86-64 build host contamination/reproducibility issue

We get a lot of comments about these being hard to reproduce or work on, in
both cases, these have specific well defined things which need to be done
and a basic understanding of what the issue relates to, if not the actual
fix.

   -

   Some invasive LICENSE changes have merged into master:
   -

      We now require the LICENSE field to match SPDX identifiers.
      -

      The build will issue warnings when this isn=E2=80=99t the case.
      -

      Non SPDX licenses will need to be of the form LicenseRef-XXX
      -

      CLOSED is no longer a valid value.
      -

      =E2=80=98WITH=E2=80=99 license exceptions are now supported

Big thanks to Joshua for getting us to the point where we can finally clean
this up!

   -

   Patches generated by the automatic upgrade helper (AUH) now include
   changelogs where these can be extracted from upstream. Initial results a=
re
   good, some manual tweaking of commit messages may be needed, feedback is
   welcome to improve the automation.
   -

   We continue to work on the backlog of patches which has slightly reduced=
.
   -

   Fixes merged to handle ptest reports for both glibc and musl in
   resulttool and whilst this improves the main reports, it does cause nois=
e
   in the regression reports due to poor comparison baselines.
   -

   Remaining intermittent build failures  of concern:
   -

      other qemu =E2=80=98hang=E2=80=99 type issues on ARM
      -

      sometimes yocto-check-layer is showing checksum mismatch issues
      -

      siggen reset issues (=E2=80=9CResourceWarning: unclosed transport=E2=
=80=9D)
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

   WDD 2689 (last week 2719) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   OE-Core/Poky Patch Metrics
   -

      Total patches found: 1021 (last week 1019)
      -

      Patches in the Pending State: 141 (14%) [last week 144 (14%)]
      -

      https://valkyrie.yocto.io/pub/non-release/patchmetrics/


Upcoming development releases:

   -

   6.1 M2: out of QA.
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

--00000000000055c3240657acf506
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span id=3D"gmail-docs-internal-guid-80c7c7dc-7fff-31=
b3-a771-f889cc6c4e01"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
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
ap">Bug Triage meeting - Thursday 30th July 7:30am PDT (</span><a href=3D"h=
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
ct Engineering Sync=C2=A0 - Tuesday 28th July 8am PDT (</span><a href=3D"ht=
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
ce:pre-wrap">Yocto Project Patch Review - Thursday 30th July 10am GMT and M=
onday 3rd Aug. 9am PDT (</span><a href=3D"https://zoom.us/j/97762397148?pwd=
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
-space:pre-wrap">YP 5.0.19 has been released</span></p></li><li dir=3D"ltr"=
 style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;=
color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-=
align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-s=
ize:11pt;background-color:transparent;font-variant:normal;vertical-align:ba=
seline;white-space:pre-wrap">YP 6.1 M2 is out of QA and under review</span>=
</p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-=
family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-=
variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentatio=
n"><span style=3D"font-size:11pt;background-color:transparent;font-variant:=
normal;vertical-align:baseline;white-space:pre-wrap">Progress has been made=
 with some of the AB-INT issues:</span></p></li><ul style=3D"margin-top:0px=
;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-si=
ze:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tran=
sparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">We iden=
tified a kernel issue likely causing the arm psplash boot hangs</span></p><=
/li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-fam=
ily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-var=
iant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre-wrap">The groff race issues w=
ere reported upstream and we have that section of the build disabled for gr=
off-native now to avoid them</span></p></li><li dir=3D"ltr" style=3D"list-s=
tyle-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">Several pseudo issues were patched in a recent update</span>=
</p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;fon=
t-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fon=
t-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentat=
ion"><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t:normal;vertical-align:baseline;white-space:pre-wrap">One infrastructure i=
ssue on a worker was corrected</span></p></li></ul><li dir=3D"ltr" style=3D=
"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb=
(0,0,0);background-color:transparent;font-variant:normal;vertical-align:bas=
eline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;=
background-color:transparent;font-variant:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">There are two AB-INT issues which are in a position whe=
re others could now help, as detailed in </span><a href=3D"https://lists.op=
enembedded.org/g/openembedded-core/message/242105" style=3D"text-decoration=
:none"><span style=3D"font-size:11pt;background-color:transparent;font-vari=
ant:normal;text-decoration:underline;vertical-align:baseline;white-space:pr=
e-wrap">https://lists.openembedded.org/g/openembedded-core/message/242105</=
span></a><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant:normal;vertical-align:baseline;white-space:pre-wrap">:</span></p></li=
><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"li=
st-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(=
0,0,0);background-color:transparent;font-variant:normal;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt" role=3D"presentation"><a href=3D"https://bugzilla.yoc=
toproject.org/show_bug.cgi?id=3D13908" style=3D"text-decoration:none"><span=
 style=3D"font-size:11pt;background-color:transparent;font-variant:normal;t=
ext-decoration:underline;vertical-align:baseline;white-space:pre-wrap">Matc=
hbox-wm segfault/xserver restart</span></a></p></li><li dir=3D"ltr" style=
=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-alig=
n:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:=
11pt;color:rgb(17,85,204);background-color:transparent;font-variant:normal;=
text-decoration:underline;vertical-align:baseline;white-space:pre-wrap">aar=
ch64/x86-64 build host contamination/reproducibility issue</span></p></li><=
/ul></ul><p dir=3D"ltr" style=3D"line-height:1.38;margin-left:36pt;margin-t=
op:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal=
;vertical-align:baseline;white-space:pre-wrap">We get a lot of comments abo=
ut these being hard to reproduce or work on, in both cases, these have spec=
ific well defined things which need to be done and a basic understanding of=
 what the issue relates to, if not the actual fix.</span></p><ul style=3D"m=
argin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:d=
isc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant:normal;vertical-align:baseline;white-space:=
pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap=
">Some invasive LICENSE changes have merged into master:</span></p></li><ul=
 style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-s=
tyle-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">We now require the LICENSE field to match SPDX identifiers.=
=C2=A0</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-=
size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">The bui=
ld will issue warnings when this isn=E2=80=99t the case.</span></p></li><li=
 dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Ari=
al,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:no=
rmal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span s=
tyle=3D"font-size:11pt;background-color:transparent;font-variant:normal;ver=
tical-align:baseline;white-space:pre-wrap">Non SPDX licenses will need to b=
e of the form LicenseRef-XXX</span></p></li><li dir=3D"ltr" style=3D"list-s=
tyle-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">CLOSED is no longer a valid value.=C2=A0</span></p></li><li =
dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Aria=
l,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:nor=
mal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span st=
yle=3D"font-size:11pt;background-color:transparent;font-variant:normal;vert=
ical-align:baseline;white-space:pre-wrap">=E2=80=98WITH=E2=80=99 license ex=
ceptions are now supported</span></p></li></ul></ul><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-siz=
e:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:trans=
parent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap"><s=
pan class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span></span=
><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0=
);background-color:transparent;font-variant:normal;vertical-align:baseline;=
white-space:pre-wrap">Big thanks to Joshua for getting us to the point wher=
e we can finally clean this up!</span></p><ul style=3D"margin-top:0px;margi=
n-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;=
font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;=
font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presen=
tation"><span style=3D"font-size:11pt;background-color:transparent;font-var=
iant:normal;vertical-align:baseline;white-space:pre-wrap">Patches generated=
 by the automatic upgrade helper (AUH) now include changelogs where these c=
an be extracted from upstream. Initial results are good, some manual tweaki=
ng of commit messages may be needed, feedback is welcome to improve the aut=
omation.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-=
size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">We cont=
inue to work on the backlog of patches which has slightly reduced.</span></=
p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-va=
riant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre-wrap">Fixes merged to handle =
ptest reports for both glibc and musl in resulttool and whilst this improve=
s the main reports, it does cause noise in the regression reports due to po=
or comparison baselines.</span></p></li><li dir=3D"ltr" style=3D"list-style=
-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);bac=
kground-color:transparent;font-variant:normal;vertical-align:baseline;white=
-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-=
color:transparent;font-variant:normal;vertical-align:baseline;white-space:p=
re-wrap">Remaining intermittent build failures=C2=A0 of concern:</span></p>=
</li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=
=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-alig=
n:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:=
11pt;background-color:transparent;font-variant:normal;vertical-align:baseli=
ne;white-space:pre-wrap">other qemu =E2=80=98hang=E2=80=99 type issues on A=
RM</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size=
:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transp=
arent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">sometim=
es yocto-check-layer is showing checksum mismatch issues</span></p></li><li=
 dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Ari=
al,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:no=
rmal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span s=
tyle=3D"font-size:11pt;background-color:transparent;font-variant:normal;ver=
tical-align:baseline;white-space:pre-wrap">siggen reset issues (=E2=80=9CRe=
sourceWarning: unclosed transport=E2=80=9D)</span></p></li><li dir=3D"ltr" =
style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical=
-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-=
size:11pt;background-color:transparent;font-variant:normal;vertical-align:b=
aseline;white-space:pre-wrap">intermittent ptest failures in many recipes</=
span></p></li></ul></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial=
,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:norm=
al;vertical-align:baseline;white-space:pre-wrap">Want to contribute? We wou=
ld appreciate help with the following areas:</span></p><ul style=3D"margin-=
top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;fo=
nt-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color=
:transparent;font-variant:normal;vertical-align:baseline;white-space:pre"><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" r=
ole=3D"presentation"><span style=3D"font-size:11pt;background-color:transpa=
rent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">We h=
ave several open issues for pseudo and limited maintainer time to work on t=
hem. Help from someone familiar with systems programming in C would be grea=
tly appreciated. </span><a href=3D"https://bugzilla.yoctoproject.org/buglis=
t.cgi?list_id=3D661406&amp;priority=3DHigh&amp;priority=3DMedium%2B&amp;pro=
duct=3DPseudo&amp;query_format=3Dadvanced&amp;resolution=3D---" style=3D"te=
xt-decoration:none"><span style=3D"font-size:11pt;background-color:transpar=
ent;font-variant:normal;text-decoration:underline;vertical-align:baseline;w=
hite-space:pre-wrap">https://bugzilla.yoctoproject.org/buglist.cgi?list_id=
=3D661406&amp;priority=3DHigh&amp;priority=3DMedium%2B&amp;product=3DPseudo=
&amp;query_format=3Dadvanced&amp;resolution=3D---</span></a></p></li><li di=
r=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sa=
ns-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;=
vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
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
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">WDD 268=
9 (last week 2719) </span><span style=3D"font-size:11pt;font-family:Consola=
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
021 (last week 1019)</span></p></li><li dir=3D"ltr" style=3D"list-style-typ=
e:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-co=
lor:transparent;font-variant:normal;vertical-align:baseline;white-space:pre=
-wrap">Patches in the Pending State: 141 (14%) [last week 144 (14%)]</span>=
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
white-space:pre-wrap">Upcoming development releases:</span></p><ul style=3D=
"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type=
:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-variant:normal;vertical-align:baseline;white-spac=
e:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color=
:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-wr=
ap">6.1 M2: out of QA.</span></p></li><ul style=3D"margin-top:0px;margin-bo=
ttom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;fo=
nt-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fo=
nt-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presenta=
tion"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt:normal;vertical-align:baseline;white-space:pre-wrap">Release Date: w/c 2=
026-08-03</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc=
;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-co=
lor:transparent;font-variant:normal;vertical-align:baseline;white-space:pre=
"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tran=
sparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">6=
.1 M3:</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li di=
r=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,=
sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:norma=
l;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre-wrap">Build Date: w/c 2026-08-31</span></=
p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-=
family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-=
variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentatio=
n"><span style=3D"font-size:11pt;background-color:transparent;font-variant:=
normal;vertical-align:baseline;white-space:pre-wrap">Release Date: w/c 2026=
-09-14</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;fo=
nt-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color=
:transparent;font-variant:normal;vertical-align:baseline;white-space:pre"><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" r=
ole=3D"presentation"><span style=3D"font-size:11pt;background-color:transpa=
rent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">6.1.=
0:</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D=
"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans=
-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;ve=
rtical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D=
"font-size:11pt;background-color:transparent;font-variant:normal;vertical-a=
lign:baseline;white-space:pre-wrap">Build Date (M4): w/c 2026-10-12</span><=
/p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font=
-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font=
-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentati=
on"><span style=3D"font-size:11pt;background-color:transparent;font-variant=
:normal;vertical-align:baseline;white-space:pre-wrap">Release Date: w/c 202=
6-11-02</span></p></li></ul></ul><br><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-fam=
ily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-var=
iant:normal;vertical-align:baseline;white-space:pre-wrap">Upcoming dot rele=
ases:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-ser=
if;background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-=
variant:normal;vertical-align:baseline;white-space:pre-wrap">YP 6.0.3</span=
></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" st=
yle=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;b=
ackground-color:transparent;font-variant:normal;vertical-align:baseline;whi=
te-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-vari=
ant:normal;vertical-align:baseline;white-space:pre-wrap">Build Date w/c 202=
6-08-10</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font=
-size:11pt;font-family:Arial,sans-serif;background-color:transparent;font-v=
ariant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
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

--00000000000055c3240657acf506--

