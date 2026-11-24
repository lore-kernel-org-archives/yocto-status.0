Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20547.1795535553745469037
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 24 Nov 2026 07:52:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=MF7ZyvUY;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33fb4680717so12234855eec.1
        for <yocto-status@lists.yoctoproject.org>; Tue, 24 Nov 2026 07:52:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795535553; cv=none;
        d=google.com; s=arc-20260327;
        b=pedK1bsCErxaGag3CcoOBlT/xvRaH8CMp+vxWfa9KDpVkAdTX3pDlB9hT5P3q283O0
         2e5X6JgdpjByr9gnmllgyWIix9jiZawvGxwNLnV1/lLmwwNRYkStkArrfNvhBYBFXt8G
         Q+QbokseBBmPSJDuxOFNhjUEQvGshWgUp/lm2bHDMiVw0qNLq3Uoi9cBnYJTAnTrs42i
         9498ifWV8FLWYf7pHOdgcMks1qbfyfg8PM/GRZtXFlya9LRHr8jYosryI7lhVHIFgpl0
         6JlF1zMb0xkHeKyJI7nXckC/Sn9oNK+Fp2jCD7vgI6Hi6uDlgHxdtB1i/5lBiAvIsuTe
         wlcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=CxqVV//0oZvLV3qBh9g4BIEcpgeiZ9+jIrv3coYcEKU=;
        fh=HoqePVF9NMJ2sLiQ76+c3nSP6VrYgJ24i/i1kafWJc0=;
        b=m3o5bJTF034Ml3hLMyY+I4V0bpidE1jeTSyhYJ0QfDnA40Ov7fovkvZnK3pLka+3y9
         i7GyFeLDhSdcvpFneBW0V4vPatjAuoxzE7v+iJquhFuPy+qtyXAFg10NBmRl2ETBBOQq
         m2RN7MsVUuvJa62MQ0KylrwPnB3W58PG5QgOKgn2tpqZBNMWfzxH11N9N7puZG2RTScm
         lQPHStOYZLzfruQj7ssvRhuZ2BQIczGjxFE+yIUksItMght+caKRhsWLkJGNJ/XpUhi+
         anDApxClp56ROcM8RROpie+Y+0Wj6vi//U4Ypg8gWOe3wRks75iiFFEAhfWrTVV5mS3S
         r2sA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795535553; x=1796140353; darn=lists.yoctoproject.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CxqVV//0oZvLV3qBh9g4BIEcpgeiZ9+jIrv3coYcEKU=;
        b=MF7ZyvUY0OQMVl7W5bmWyNLX20iHCu51ZGMcvZUGlwu6L4ggWpr8H9E7z0tEc11GdQ
         0I07tsTpo2EJNaq83EHrJu2aiAZ0M9+gTGW9GjlYtq+657ChafLzCbVTC+NgGCPrSSq2
         vDWZGqbv5A+KantKEBZAaoiXNcF1hLaeJgKEg0HLVMmYgU6XrqzbS8kWzZe0GIGHA0o3
         5fwc1WZUlxEQWw/X7yoJTUj34bF5n7cKEDO8/seVFPWlgl/xSTn9kMLDpNMf5DHiQng6
         yCz0emSF0fjAbppx63nrfcSO94gvlBzvIP41tzaA9ZDznjqxtX2moMtrr7XIcm+VJKQa
         VNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795535553; x=1796140353;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CxqVV//0oZvLV3qBh9g4BIEcpgeiZ9+jIrv3coYcEKU=;
        b=rOj+GQ7LySR4i8oh3XiEYx6ahDcUdLson/QmWpp33ULoUuiTE8XJR7CdEDA9wqL79e
         A6ToxWQ2wOCyHAx/KY2EZJx+ztXgcGVpwCesTYDMmH01qJxnjTVUHcxjuYFB0oFJq2+G
         ypzs7ZZbgRmPa4ka9Ro5ktiuCM45z+weQGGFHvIodHvM/2+uUp+mNGjnIaXcZyLtTSf9
         JsBLxLiR3RbiW4CPPg/OsxyyAV/8cWJFZHw480G9s2fCYGaZV7DM6DdNq3PUC1T/ga6d
         xAtRxCCBHAdcoCimWGf7zPr88TG7mo9zqc5Qn3yktAKIC77cy17ehhP4pQoQ0tSQqCJR
         1J1g==
X-Forwarded-Encrypted: i=1; AL+hErG1FlFeD3oWHVOuylzUmJC5+P2oYh7zTUHMZW5wxoPznVGlnLqi8UGHTw9qFN/GmNat3bld10+3fW6mb7w=@lists.yoctoproject.org
X-Gm-Message-State: APuU4Z8tR2SHrw26RQomqyqZ/CqFk63kLJMgYiv8njwk7/Hxuu+N4ogX
	Gdwom20QibvJ/J6ivo1jOMZEU5RJJmjNz1TslCH5EKmQbWCAxpG/2+eE98Uw2c2ofbrEF6hDfdI
	gPTqN2Nw3vcyzL8zEWM4XiGaxbcydFuY=
X-Gm-Gg: AZFdTZfBgGMgbe/rZicqaIN2QghYHjfG1uG1cpNaJeBFDWX4uVzrBJKKlwlEukP0Ht8
	akCMGKhvlQWCI7ZH5/eA6XeKgMfKCn4T5inAOLDBAn6LnePrBm5danxmd4x9wXXXv4NM7cCC56b
	b3cXu4HuDFkRZ0vD/gIPTNvJQHbdDVJyLJuuFCLhvgcn92+icCNgswcr6+wZ+t2X3v/QPU7Ehrl
	rUjVyJveR/Za9uY3X4v/zwF/bJL9maehGVLwbWAhaiTpyjULkm1Ge72unumm2slrNwvugfaB/4y
	lTQQUQ9VW6FS2XXxMaMOM1GbZPzGuxNL2GghVPbez64uTGhEVWLRbBF3DZtzxNlk2r1B4zq9Eyh
	rZZIRYkSp5PmSwS/ccwSHdLzBCdmC0DpIMjzED9oJcbln43E6RJy4og4VwPGMYFa4QVfbiqmFUD
	xEM/pXyK1N7n5B6SpykFtnItcMV/cVdl29TXRD8PS5gxS7V9saUaFOwBSi/9LI+UU39UjlLLw9N
	pZfOw8goqug8+w1FrrHEUq8musOrZdIFcJTBBa8dfq1zHPKxylVFhK5EVQMvqzPkJqlsnj5jpMM
	T/t4rkUNr8AyDbmOJWC5ZQ==
X-Received: by 2002:a05:693c:80cd:b0:385:b8f4:756a with SMTP id
 5a478bee46e88-385b8f47b36mr15769035eec.12.1795535552707; Tue, 24 Nov 2026
 07:52:32 -0800 (PST)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 24 Nov 2026 08:52:20 -0700
X-Gm-Features: Aa3M54oFzNKZMOa9dSWAQ6ph_NOIpErU0In_AAdnfc0CBvB8PLaEBCLijXDs3Rg
Message-ID: <CAK5yBb9O=Xfo84bhAD_y205C58-COwMWiYLFTCJmO8QXp+VYtg@mail.gmail.com>
Subject: Yocto Project Status 24 November 2026 (WW48)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000cd0379066107b2f7"
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <yocto-status@lists.yoctoproject.org>; Tue, 24 Nov 2026 15:52:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/149

--000000000000cd0379066107b2f7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 6.2 M1 - Development

Next Deadline: YP 6.2 M1: w/c 2026-11-30

Next Team Meetings:

   -

   Bug Triage meeting - Thursday 26th Nov. 7:30am PDT (
   https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
   -

   Weekly Project Engineering Sync  - Tuesday 24th Nov. 8am PDT (
   https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
   <https://zoom.us/j/990892712>
   -

   Yocto Project Patch Review - Thursday 26th Nov. 10am GMT and Monday 30th
   Nov.. 9am PDT (
   https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1)


Project data dashboard: https://dashboard.yoctoproject.org/

Key Status/Updates:

   -

   YP 6.1.1 is under review after QA, YP 6.0.5 is in QA
   -

   YP 6.2 M1 is due to be built next week.
   -

   There is a proposal and proof of concept for changes to layer
   configuration and setup under discussion:

https://lists.openembedded.org/g/openembedded-architecture/message/2463

The branches have been updated with fixes and improvements and we believe
this is close to being ready to merge. We may hold M1 until the layer
changes merge.

   -

   The proposed layer changes will likely be more invasive than many of the
   recent changes but also incorporate a number of new features and
   improvements which will make them useful to everyone and allow various
   cleanups of existing code.
   -

   The multiconfig deadlock fixes have merged and look promising after
   various people have tested.
   -

   There are several good changes in OE-Core including python 3.15, RISC-V
   tune profile improvements and OE-Core lib function doc improvements
   -

   The fetcher now has the start of basic PURL support.
   -

   The npm fetcher/recipetool integration after the fetcher checksum
   requirements change has started to be fixed, thanks Stefano.
   -

   There was a fix to glibc to improve memory usage on aarch64 systems
   -

   The layer index has continued to see significant fixes and improvements,
   thanks Tim and Piotr
   -

   Pseudo is preparing for a 2.0 release series and wider testing/review
   would be welcomed.
   -

   There is also a discussion about recipe specific hosttools:

https://lists.openembedded.org/g/openembedded-architecture/message/2467

   -

   Next week, Tuesday 1st to Thursday 3rd December is the online Yocto
   Project Summit 2026.12. Registration is still open for anyone who wants =
to
   attend: https://www.yoctoproject.org/event/virtual-summit-2026-12/


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

   WDD 2571 (last week 2644) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   OE-Core/Poky Patch Metrics
   -

      Total found: 1046 (last week 1049)
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

   YP 6.1.1 is in review.
   -

      Release Date w/c 2026-11-23
      -

   YP 6.0.5 is in QA.
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

--000000000000cd0379066107b2f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span id=3D"gmail-docs-internal-guid-e953bf7c-7fff-d2=
4a-21b0-79fdb6e92f31"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-=
serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;ver=
tical-align:baseline;white-space:pre-wrap">Current Dev Position: YP 6.2 M1 =
- Development</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top=
:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;v=
ertical-align:baseline;white-space:pre-wrap">Next Deadline: YP 6.2 M1: w/c =
2026-11-30</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sa=
ns-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;=
vertical-align:baseline;white-space:pre-wrap">Next Team Meetings:</span></p=
><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"li=
st-style-type:disc;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0=
,0,0);background-color:transparent;font-variant:normal;vertical-align:basel=
ine;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant:normal;vertical-align:baseline;whit=
e-space:pre-wrap">Bug Triage meeting - Thursday 26th Nov. 7:30am PDT (</spa=
n><a href=3D"https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6=
dz09" style=3D"text-decoration:none"><span style=3D"font-size:11pt;backgrou=
nd-color:transparent;font-variant:normal;text-decoration:underline;vertical=
-align:baseline;white-space:pre-wrap">https://zoom.us/j/454367603?pwd=3DZGx=
oa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</span></a><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:di=
sc;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant:normal;vertical-align:baseline;white-space:=
pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap=
">Weekly Project Engineering Sync=C2=A0 - Tuesday 24th Nov. 8am PDT (</span=
><a href=3D"https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsU=
T09" style=3D"text-decoration:none"><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant:normal;text-decoration:underline;vertical-=
align:baseline;white-space:pre-wrap">https://zoom.us/j/990892712?pwd=3DcHU1=
MjhoM2x6ck81bkcrYjRrcmJsUT09</span></a><a href=3D"https://zoom.us/j/9908927=
12" style=3D"text-decoration:none"><span style=3D"font-size:11pt;background=
-color:transparent;font-variant:normal;text-decoration:underline;vertical-a=
lign:baseline;white-space:pre-wrap">)</span></a></p></li><li dir=3D"ltr" st=
yle=3D"list-style-type:disc;font-size:9.5pt;font-family:Arial,sans-serif;co=
lor:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-al=
ign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-siz=
e:11pt;background-color:transparent;font-variant:normal;vertical-align:base=
line;white-space:pre-wrap">Yocto Project Patch Review - Thursday 26th Nov. =
10am GMT and Monday 30th Nov.. 9am PDT (</span><a href=3D"https://zoom.us/j=
/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1" style=3D"text-decorat=
ion:none"><span style=3D"font-size:11pt;background-color:transparent;font-v=
ariant:normal;text-decoration:underline;vertical-align:baseline;white-space=
:pre-wrap">https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry=
4Eb.1</span></a><span style=3D"font-size:11pt;background-color:transparent;=
font-variant:normal;vertical-align:baseline;white-space:pre-wrap">)</span><=
/p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical=
-align:baseline;white-space:pre-wrap">Project data dashboard: </span><a hre=
f=3D"https://dashboard.yoctoproject.org/" style=3D"text-decoration:none"><s=
pan style=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:t=
ransparent;font-variant:normal;text-decoration:underline;vertical-align:bas=
eline;white-space:pre-wrap">https://dashboard.yoctoproject.org/</span></a><=
span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);=
background-color:transparent;font-variant:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">=C2=A0</span></p><br><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font=
-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font=
-variant:normal;vertical-align:baseline;white-space:pre-wrap">Key Status/Up=
dates:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"=
ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-se=
rif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;verti=
cal-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fo=
nt-size:11pt;background-color:transparent;font-variant:normal;vertical-alig=
n:baseline;white-space:pre-wrap">YP 6.1.1 is under review after QA, YP 6.0.=
5 is in QA</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;fon=
t-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:=
transparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" ro=
le=3D"presentation"><span style=3D"font-size:11pt;background-color:transpar=
ent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">YP 6.=
2 M1 is due to be built next week.</span></p></li><li dir=3D"ltr" style=3D"=
list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(=
0,0,0);background-color:transparent;font-variant:normal;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;b=
ackground-color:transparent;font-variant:normal;vertical-align:baseline;whi=
te-space:pre-wrap">There is a proposal and proof of concept for changes to =
layer configuration and setup under discussion:=C2=A0</span></p></li></ul><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-left:36pt;margin-top:0pt;mar=
gin-bottom:0pt"><a href=3D"https://lists.openembedded.org/g/openembedded-ar=
chitecture/message/2463" style=3D"text-decoration:none"><span style=3D"font=
-size:11pt;font-family:Arial,sans-serif;background-color:transparent;font-v=
ariant:normal;text-decoration:underline;vertical-align:baseline;white-space=
:pre-wrap">https://lists.openembedded.org/g/openembedded-architecture/messa=
ge/2463</span></a></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-left:=
36pt;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-f=
amily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-v=
ariant:normal;vertical-align:baseline;white-space:pre-wrap">The branches ha=
ve been updated with fixes and improvements and we believe this is close to=
 being ready to merge. We may hold M1 until the layer changes merge.</span>=
</p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D=
"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb=
(0,0,0);background-color:transparent;font-variant:normal;vertical-align:bas=
eline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;=
background-color:transparent;font-variant:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">The proposed layer changes will likely be more invasive=
 than many of the recent changes but also incorporate a number of new featu=
res and improvements which will make them useful to everyone and allow vari=
ous cleanups of existing code.</span></p></li><li dir=3D"ltr" style=3D"list=
-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">The multiconfig deadlock fixes have merged and look promisin=
g after various people have tested.</span></p></li><li dir=3D"ltr" style=3D=
"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb=
(0,0,0);background-color:transparent;font-variant:normal;vertical-align:bas=
eline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;=
background-color:transparent;font-variant:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">There are several good changes in OE-Core including pyt=
hon 3.15, RISC-V tune profile improvements and OE-Core lib function doc imp=
rovements</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font=
-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:t=
ransparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" rol=
e=3D"presentation"><span style=3D"font-size:11pt;background-color:transpare=
nt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">The fe=
tcher now has the start of basic PURL support.</span></p></li><li dir=3D"lt=
r" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-seri=
f;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font=
-size:11pt;background-color:transparent;font-variant:normal;vertical-align:=
baseline;white-space:pre-wrap">The npm fetcher/recipetool integration after=
 the fetcher checksum requirements change has started to be fixed, thanks S=
tefano.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-s=
ize:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">There w=
as a fix to glibc to improve memory usage on aarch64 systems</span></p></li=
><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:A=
rial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:=
normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span=
 style=3D"font-size:11pt;background-color:transparent;font-variant:normal;v=
ertical-align:baseline;white-space:pre-wrap">The layer index has continued =
to see significant fixes and improvements, thanks Tim and Piotr</span></p><=
/li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-famil=
y:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varia=
nt:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><s=
pan style=3D"font-size:11pt;background-color:transparent;font-variant:norma=
l;vertical-align:baseline;white-space:pre-wrap">Pseudo is preparing for a 2=
.0 release series and wider testing/review would be welcomed.</span></p></l=
i><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:=
Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant=
:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><spa=
n style=3D"font-size:11pt;background-color:transparent;font-variant:normal;=
vertical-align:baseline;white-space:pre-wrap">There is also a discussion ab=
out recipe specific hosttools:</span></p></li></ul><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-left:36pt;margin-top:0pt;margin-bottom:0pt"><a href=
=3D"https://lists.openembedded.org/g/openembedded-architecture/message/2467=
" style=3D"text-decoration:none"><span style=3D"font-size:11pt;font-family:=
Arial,sans-serif;background-color:transparent;font-variant:normal;text-deco=
ration:underline;vertical-align:baseline;white-space:pre-wrap">https://list=
s.openembedded.org/g/openembedded-architecture/message/2467</span></a></p><=
ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list=
-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">Next week, Tuesday 1st to Thursday 3rd December is the onlin=
e Yocto Project Summit 2026.12. Registration is still open for anyone who w=
ants to attend: </span><a href=3D"https://www.yoctoproject.org/event/virtua=
l-summit-2026-12/" style=3D"text-decoration:none"><span style=3D"font-size:=
11pt;background-color:transparent;font-variant:normal;text-decoration:under=
line;vertical-align:baseline;white-space:pre-wrap">https://www.yoctoproject=
.org/event/virtual-summit-2026-12/</span></a></p></li></ul><br><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant:normal;vertical-align:baseline;white-space:=
pre-wrap">Want to contribute? We would appreciate help with the following a=
reas:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre-wrap">We have several open issues for pseudo and =
limited maintainer time to work on them. Help from someone familiar with sy=
stems programming in C would be greatly appreciated. </span><a href=3D"http=
s://bugzilla.yoctoproject.org/buglist.cgi?list_id=3D661406&amp;priority=3DH=
igh&amp;priority=3DMedium%2B&amp;product=3DPseudo&amp;query_format=3Dadvanc=
ed&amp;resolution=3D---" style=3D"text-decoration:none"><span style=3D"font=
-size:11pt;background-color:transparent;font-variant:normal;text-decoration=
:underline;vertical-align:baseline;white-space:pre-wrap">https://bugzilla.y=
octoproject.org/buglist.cgi?list_id=3D661406&amp;priority=3DHigh&amp;priori=
ty=3DMedium%2B&amp;product=3DPseudo&amp;query_format=3Dadvanced&amp;resolut=
ion=3D---</span></a></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;=
font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;font-variant:normal;vertical-align:baseline;white-space:pre"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
 role=3D"presentation"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Th=
ere are a large number of intermittent failures on our autobuilder, any hel=
p with investigating, reproducing or solving these issues would be welcome!=
 </span><a href=3D"https://valkyrie.yocto.io/pub/non-release/abint/" style=
=3D"text-decoration:none"><span style=3D"font-size:11pt;background-color:tr=
ansparent;font-variant:normal;text-decoration:underline;vertical-align:base=
line;white-space:pre-wrap">https://valkyrie.yocto.io/pub/non-release/abint/=
</span></a></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size=
:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transp=
arent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Many re=
cipes in openembedded-core would benefit from a new recipe maintainer. Plea=
se look at </span><a href=3D"https://git.openembedded.org/openembedded-core=
/tree/meta/conf/distro/include/maintainers.inc" style=3D"text-decoration:no=
ne"><span style=3D"font-size:11pt;background-color:transparent;font-variant=
:normal;text-decoration:underline;vertical-align:baseline;white-space:pre-w=
rap">https://git.openembedded.org/openembedded-core/tree/meta/conf/distro/i=
nclude/maintainers.inc</span></a><span style=3D"font-size:11pt;background-c=
olor:transparent;font-variant:normal;vertical-align:baseline;white-space:pr=
e-wrap"> and see if you can adopt any of the unassigned recipes.</span></p>=
</li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fami=
ly:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><=
span style=3D"font-size:11pt;background-color:transparent;font-variant:norm=
al;vertical-align:baseline;white-space:pre-wrap">For more ways to contribut=
e, see </span><a href=3D"https://docs.google.com/document/d/18oxKWxLorfF813=
h82mK6yKTIHeBp_-9owFuCWbzgjOk/edit?usp=3Dsharing" style=3D"text-decoration:=
none"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt:normal;text-decoration:underline;vertical-align:baseline;white-space:pre=
-wrap">https://docs.google.com/document/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9o=
wFuCWbzgjOk/edit?usp=3Dsharing</span></a></p></li></ul><br><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"f=
ont-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-w=
rap">New to the project?</span></p><ul style=3D"margin-top:0px;margin-botto=
m:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-va=
riant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre-wrap">We have a list of issue=
s we think are good places to start contributing: </span><a href=3D"https:/=
/bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DNEWCOMER" style=3D"tex=
t-decoration:none"><span style=3D"font-size:11pt;background-color:transpare=
nt;font-variant:normal;text-decoration:underline;vertical-align:baseline;wh=
ite-space:pre-wrap">https://bugzilla.yoctoproject.org/buglist.cgi?quicksear=
ch=3DNEWCOMER</span></a></p></li></ul><br><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;fon=
t-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fon=
t-variant:normal;vertical-align:baseline;white-space:pre-wrap">Tracking Met=
rics:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre-wrap">WDD 2571 (last week 2644) </span><span styl=
e=3D"font-size:11pt;font-family:Consolas,sans-serif;background-color:transp=
arent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">(</=
span><a href=3D"https://wiki.yoctoproject.org/charts/combo.html" style=3D"t=
ext-decoration:none"><span style=3D"font-size:11pt;background-color:transpa=
rent;font-variant:normal;text-decoration:underline;vertical-align:baseline;=
white-space:pre-wrap">https://wiki.yoctoproject.org/charts/combo.html</span=
></a><span style=3D"font-size:11pt;font-family:Consolas,sans-serif;backgrou=
nd-color:transparent;font-variant:normal;vertical-align:baseline;white-spac=
e:pre-wrap">)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;=
font-size:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);background-=
color:transparent;font-variant:normal;vertical-align:baseline;white-space:p=
re"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt" role=3D"presentation"><span style=3D"font-size:11pt;font-family:Arial,s=
ans-serif;background-color:transparent;font-variant:normal;vertical-align:b=
aseline;white-space:pre-wrap">OE-Core/Poky Patch Metrics</span></p></li><ul=
 style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-s=
tyle-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">Total found: 1046 (last week 1049)</span></p></li><li dir=3D=
"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans=
-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;ve=
rtical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D=
"font-size:11pt;background-color:transparent;font-variant:normal;vertical-a=
lign:baseline;white-space:pre-wrap">Patches in the Pending State: 135 (13%)=
 [last week 135 (13%)]</span></p></li><li dir=3D"ltr" style=3D"list-style-t=
ype:circle;font-size:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);=
background-color:transparent;font-variant:normal;vertical-align:baseline;wh=
ite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt" role=3D"presentation"><a href=3D"https://valkyrie.yocto.io/p=
ub/non-release/patchmetrics/" style=3D"text-decoration:none"><span style=3D=
"font-size:11pt;font-family:Arial,sans-serif;background-color:transparent;f=
ont-variant:normal;text-decoration:underline;vertical-align:baseline;white-=
space:pre-wrap">https://valkyrie.yocto.io/pub/non-release/patchmetrics/</sp=
an></a></p></li></ul></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Ari=
al,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:no=
rmal;vertical-align:baseline;white-space:pre-wrap">Upcoming development rel=
eases</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-ser=
if;background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-=
variant:normal;vertical-align:baseline;white-space:pre-wrap">YP 6.2 M1</spa=
n></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" s=
tyle=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;=
background-color:transparent;font-variant:normal;vertical-align:baseline;wh=
ite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-var=
iant:normal;vertical-align:baseline;white-space:pre-wrap">Build Date w/c </=
span><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t:normal;vertical-align:baseline;white-space:pre-wrap">2026-11-30</span></p=
></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-f=
amily:Arial,sans-serif;background-color:transparent;font-variant:normal;ver=
tical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"=
font-size:11pt;font-variant:normal;vertical-align:baseline;white-space:pre-=
wrap">Release Date w/c </span><span style=3D"font-size:11pt;background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-w=
rap">2026-12-14</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-typ=
e:disc;font-size:11pt;font-family:Arial,sans-serif;background-color:transpa=
rent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D=
"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"p=
resentation"><span style=3D"font-size:11pt;font-variant:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">YP 6.2 M2</span></p></li><ul style=3D"mar=
gin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:cir=
cle;font-size:11pt;font-family:Arial,sans-serif;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pres=
entation"><span style=3D"font-size:11pt;font-variant:normal;vertical-align:=
baseline;white-space:pre-wrap">Build Date w/c </span><span style=3D"font-si=
ze:11pt;background-color:transparent;font-variant:normal;vertical-align:bas=
eline;white-space:pre-wrap">2027-01-18</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;back=
ground-color:transparent;font-variant:normal;vertical-align:baseline;white-=
space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-variant=
:normal;vertical-align:baseline;white-space:pre-wrap">Release Date w/c </sp=
an><span style=3D"font-size:11pt;background-color:transparent;font-variant:=
normal;vertical-align:baseline;white-space:pre-wrap">2027-02-01</span></p><=
/li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-=
family:Arial,sans-serif;background-color:transparent;font-variant:normal;ve=
rtical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D=
"font-size:11pt;font-variant:normal;vertical-align:baseline;white-space:pre=
-wrap">YP 6.2 M3</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0=
px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-fam=
ily:Arial,sans-serif;background-color:transparent;font-variant:normal;verti=
cal-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fo=
nt-size:11pt;font-variant:normal;vertical-align:baseline;white-space:pre-wr=
ap">Build Date w/c </span><span style=3D"font-size:11pt;background-color:tr=
ansparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap"=
>2027-03-01</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;=
font-size:11pt;font-family:Arial,sans-serif;background-color:transparent;fo=
nt-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presenta=
tion"><span style=3D"font-size:11pt;font-variant:normal;vertical-align:base=
line;white-space:pre-wrap">Release Date w/c </span><span style=3D"font-size=
:11pt;background-color:transparent;font-variant:normal;vertical-align:basel=
ine;white-space:pre-wrap">2027-03-15</span></p></li></ul><li dir=3D"ltr" st=
yle=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;bac=
kground-color:transparent;font-variant:normal;vertical-align:baseline;white=
-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-varian=
t:normal;vertical-align:baseline;white-space:pre-wrap">YP 6.2.0</span></p><=
/li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D=
"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;backgro=
und-color:transparent;font-variant:normal;vertical-align:baseline;white-spa=
ce:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-variant:no=
rmal;vertical-align:baseline;white-space:pre-wrap">Build Date w/c </span><s=
pan style=3D"font-size:11pt;background-color:transparent;font-variant:norma=
l;vertical-align:baseline;white-space:pre-wrap">2027-04-26</span></p></li><=
li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:A=
rial,sans-serif;background-color:transparent;font-variant:normal;vertical-a=
lign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-si=
ze:11pt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">R=
elease Date w/c </span><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">20=
27-05-03</span></p></li></ul></ul><br><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-va=
riant:normal;vertical-align:baseline;white-space:pre-wrap">Upcoming dot rel=
eases:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"=
ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-se=
rif;background-color:transparent;font-variant:normal;vertical-align:baselin=
e;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font=
-variant:normal;vertical-align:baseline;white-space:pre-wrap">YP 6.1.1 is i=
n review.</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li=
 dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Ari=
al,sans-serif;background-color:transparent;font-variant:normal;vertical-ali=
gn:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size=
:11pt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Rel=
ease Date w/c 2026-11-23</span></p></li></ul><li dir=3D"ltr" style=3D"list-=
style-type:disc;font-size:11pt;font-family:Arial,sans-serif;background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" =
role=3D"presentation"><span style=3D"font-size:11pt;font-variant:normal;ver=
tical-align:baseline;white-space:pre-wrap">YP 6.0.5 is in QA.</span></p></l=
i><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"l=
ist-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;backgroun=
d-color:transparent;font-variant:normal;vertical-align:baseline;white-space=
:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-variant:norm=
al;vertical-align:baseline;white-space:pre-wrap">Release Date w/c 2026-11-3=
0</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-si=
ze:11pt;font-family:Arial,sans-serif;background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><=
span style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">YP 5.0.22</span></p></li><ul style=3D"margin-top:0px;ma=
rgin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:=
11pt;font-family:Arial,sans-serif;background-color:transparent;font-variant=
:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><spa=
n style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;white=
-space:pre-wrap">Build Date w/c 2026-11-23</span></p></li><li dir=3D"ltr" s=
tyle=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;=
background-color:transparent;font-variant:normal;vertical-align:baseline;wh=
ite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-var=
iant:normal;vertical-align:baseline;white-space:pre-wrap">Release Date w/c =
2026-12-07</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:dis=
c;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-c=
olor:transparent;font-variant:normal;vertical-align:baseline;white-space:pr=
e"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tra=
nsparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">=
For future release dates, see </span><a href=3D"https://wiki.yoctoproject.o=
rg/wiki/Release_calendar" style=3D"text-decoration:none"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant:normal;text-decoratio=
n:underline;vertical-align:baseline;white-space:pre-wrap">https://wiki.yoct=
oproject.org/wiki/Release_calendar</span></a></p></li></ul><br><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant:normal;vertical-align:baseline;white-space:=
pre-wrap">The Yocto Project=E2=80=99s technical governance is through its T=
echnical Steering Committee, more information is available at:</span></p><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><a=
 href=3D"https://wiki.yoctoproject.org/wiki/TSC" style=3D"text-decoration:n=
one"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;background-=
color:transparent;font-variant:normal;text-decoration:underline;vertical-al=
ign:baseline;white-space:pre-wrap">https://wiki.yoctoproject.org/wiki/TSC</=
span></a></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical=
-align:baseline;white-space:pre-wrap">The Status reports are stored on the =
wiki at: </span><a href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status=
" style=3D"text-decoration:none"><span style=3D"font-size:11pt;font-family:=
Arial,sans-serif;background-color:transparent;font-variant:normal;text-deco=
ration:underline;vertical-align:baseline;white-space:pre-wrap">https://wiki=
.yoctoproject.org/wiki/Weekly_Status</span></a></p><br><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap"=
>[If anyone has suggestions for other information you=E2=80=99d like to see=
 on this weekly status update, let us know!]</span></p></span><br class=3D"=
gmail-Apple-interchange-newline"></div><div dir=3D"ltr" class=3D"gmail_sign=
ature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"=
><p class=3D"MsoNormal" style=3D"background-image:initial;background-positi=
on:initial;background-repeat:initial"><span style=3D"font-size:12pt;font-fa=
mily:Arial,sans-serif">Thanks,<span></span></span></p>

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

--000000000000cd0379066107b2f7--
