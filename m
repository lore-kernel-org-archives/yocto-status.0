Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14411.1793720810267080540
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 03 Nov 2026 07:46:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ur5l75in;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-14394530ec6so5717704c88.1
        for <yocto-status@lists.yoctoproject.org>; Tue, 03 Nov 2026 07:46:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793720810; cv=none;
        d=google.com; s=arc-20260327;
        b=CoS8c6/00Zz17gjJ7Xac2V7eugZh9o4wZCdod2FLslP1F4OGeI5wd6y/LAGOUj4WbB
         RttQORgZzDhKjMqygHxGHZ638MQphshVSf6PmoqMNeu7VNMs+1aDC0Pmt1DwKrx5a1v/
         P/mwzycbUqbu0LG4Uws3FsyW3VHPA346qa7YGmAZAPgwLg1bbqIdODx/XtLOBjcsgmCz
         Ao7fw7tHCW7QvFEK/dFXbZTtrVoJI6jVsdhl+NzoHQmsbCJDRHUHcjpL596Lqyr4aQYc
         /TyeIvrJbSPaPOpuvYuKzRsKlk/USXJNPz53tO3Zd9xPeAcHjp35nx+Upzk3vDWd343S
         H2vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=tTwYR4S96Jw2xViEstuVrAGPb2JKPI77CCmsNlpejJM=;
        fh=iOHQvQV4851qgM/QUo9GHIdT3F0rUaK/vFEIN/bmiHg=;
        b=HsZnnQfndE2q+9vSbSRIt7RnrZjCpLArKNo5++41uIJXSFw/3VvjBngp34DgN8m0q5
         Thm8td2xE521x79vM4OD7WjXypudTQgONIWvLfS11NA2BZdwVjyOI9RUfEw2qP8HDiFL
         MluV6/Qq4kpFp0FVtF3JRJ/RkcVZBplLpb16MFpcf0QguHViGylPn3KazhG5LPskkNxq
         GTadFjlfv+pT4SuXTo4+3LrvtOuxv7DlXzqqMh6PAhGChrxzTuhURiTJVerAQHkNPGIE
         L26Uv5RtqNES7R3cg1QGVR6r99Wz8vCsWHJdXJAfbOVx2sJTE+r/f62XI7jzQfLsxUlY
         LzLw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793720810; x=1794325610; darn=lists.yoctoproject.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tTwYR4S96Jw2xViEstuVrAGPb2JKPI77CCmsNlpejJM=;
        b=ur5l75inPeJBG2gRCFa86rOrJFVuHs+J8wAx46u7of9S7IwNP+WwttlaW/h91JlBho
         9s28+N68bLcMpNlmsEOCWmM+MZsuPpHEaYE20RyQxBse55ffdL9F4Pk3YlJPu5RMgYwh
         +tKvwRvXdsPoHnJKEOPS8DylcA966ay6Ycfnqc1jrEOJqAkLUo7hTujpqMSfKnU/aegw
         2r/3YdL6Dt3x7/sN6h+H+U/3Qh16CMYqqDPFFys3FD1330x46HcV3j8c36CWyZOFbdf9
         U9uowMguClY96ehWcHWOpz5XYg9ADHEWha0ZD92KelWFL9MEUkTMDdFyLYjBUDtHO5zq
         HBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720810; x=1794325610;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tTwYR4S96Jw2xViEstuVrAGPb2JKPI77CCmsNlpejJM=;
        b=iOpPBJ5th3wNcAZhCniHTwSn0VgbPRVHU0ZxvI1R7MAGI8oauueVteXVMwBfBt1VRA
         9KkbSZCifow+c2aEtEdrgTtnLNrODIyJkqtewjvI0X9hkZeiU9HHtkxdt9EbxTOOodWr
         Ao/a4lWgpkejuAodKmICwxOGHUCH1EqvyuReTCZWKVZHGaeWBynU8eR0OFKx1SLgEWho
         nlUFinutKdpMoAmk2YdtcQzTg3dlFTeshR2xS2UbRSAQ2oiGREZnD9dJJ0TZ3JW49Ew1
         rrvcxfZEqZAElz5BDKFYQsf/8+UMgRFp0fTSQ5q8tX9p5mqBrVR8FVEJADvHv06DsMHu
         30GA==
X-Forwarded-Encrypted: i=1; AKwUvBxLeWRQZ0ikf76tH/LMLiMBxhWZko6KlizJLfKmz8Utn84cckZK4Bp1sd7ABKFfvcsKiv2VHOdKCLHbHlo=@lists.yoctoproject.org
X-Gm-Message-State: APuU4Z/tt8WjEpHNAUP1x7GsgO/euzUCmYK8rbyThlqSmSPwg7u64pgR
	2FM17+ijfIkFF27t8T1BH75sZtcTuUCMrMYLU4nM1CWusw0d/UMgixN543To7uwCjQqYYcpl2zb
	lLKIwgqpeek0qeQ5+lovXzvj0mM8JCeI=
X-Gm-Gg: AYBFou3VLHtzybfvqCjgo25UWoqbss2RVxG7uWrzOIiIVbdbxkfLyskWJE5PTYc2ZZq
	Of28zy8FrVS27/Bdevl0iOUCgX4d3Ox4e80f1CzlPfBflFpbBCjBJIZsph6w3EaIlXCnoNOzTpv
	HavdlTuZcKLuc5ijDOZgCA9/8Mog6k8ErheugEcobOKXW6zIKxBy70RW+aQgCnf74WprW3xsBbh
	SoUdApudA8NOzLabyHmOmZm91YgMhIlDHQGz3/X8scqFnOIVQUyoIDo1MXqvg7HK/SEbPqGxhhZ
	nNpW2zituV9g5bjF4rOCFB8E7qy5D5cRi0M18Tab06f8pa/bRmoEHlpxEmgSUjw8dIqwIcJCudw
	GC4/5AsLuTJDw+KVHIJUwO0s1TiT34PXMMyWRuYNY4geaCQOVaqdDtlgkwAK6zJex+hNLlsFUBm
	IhHXMQR1Pdo9yGhAyByEORP0mlwHfsMJNwq9xWVmCOyDXmFcuWgNQOhci6KbahfRqsbkQl2PYwA
	W3SacP8LnZZyjlzrIgmfHbubx/Gx3nlK7vU8HYUsYys1gi0hyt/iypC7M1UC6r5UJnVj02CDZVC
	u3PdpSpwUBlsBukux6n9
X-Received: by 2002:a05:701b:260b:b0:1b0:20:6444 with SMTP id
 a92af1059eb24-1b000206470mr14645832c88.39.1793720808814; Tue, 03 Nov 2026
 07:46:48 -0800 (PST)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 3 Nov 2026 07:46:37 -0800
X-Gm-Features: AclHuK-DruMBE-BtyVTAkFRSCa1wZxhwv8R27vCm58NuyOKlCL8RrNYt_YDJCDg
Message-ID: <CAK5yBb8hB4PsML2rcRej5_L9u2bSt9n47s9wSRqyQTzy3ZzUUw@mail.gmail.com>
Subject: Yocto Project Status 3 November 2026 (WW45)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000a2bc41065f612ba1"
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <yocto-status@lists.yoctoproject.org>; Tue, 03 Nov 2026 15:46:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/146

--000000000000a2bc41065f612ba1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 6.2 M1 - Development

Next Deadline: YP 6.2 M1: w/c 2026-12-14

Next Team Meetings:

   -

   Bug Triage meeting - Thursday 5th Nov. 7:30am PDT (
   https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
   -

   Weekly Project Engineering Sync  - Tuesday 3rd Nov. 8am PDT (
   https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
   <https://zoom.us/j/990892712>
   -

   Yocto Project Patch Review - Thursday 5th Nov. 10am GMT and Monday 9th
   Nov.. 9am PDT (
   https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1)


Project data dashboard: https://dashboard.yoctoproject.org/

Key Status/Updates:

   -

   Patches for 6.2 have started merging into master
   -

   There is a proposal for changes to layer configuration setup out for
   discussion:
   https://lists.openembedded.org/g/openembedded-architecture/message/2431
   -

   The proposed layer changes will likely be more invasive than many of the
   recent changes but also incorporate a number of new features and
   improvements which will make them useful to everyone and allow various
   cleanups of existing code. A full proposal should be ready for review so=
on.
   -

   The Yocto Project wiki was made read-only to mitigate PHP security
   issues reported last week, we hope to have this working fully again soon=
.
   -

   Now that YP 6.1 is released, we will re-test Yocto Project compatible
   layers for the new release. If you have a YP compatible layer, please
   ensure you have created a =E2=80=9Cblacksail=E2=80=9D branch.
   -

   There are issues the triage team spotted where we could benefit from
   help:
   -

      go recipes are not devtool upgradeable (#14944)
      -

      systemd user/groups different on opkg vs rpm images (#14139)
      -

      recipetool create should add tag=3D for git SRC_URI (#15816)
      -

   We plan to move a couple of planned releases forward by a week to avoid
   needing to make a release during the end of the year holidays.
   -

      6.1.1:    2026-11-23
      -

      6.0.5:    2026-11-30
      -

      5.0.22:   2026-12-07
      -

      6.2 M1:   2026-12-14
      -

   We have also planned out release dates for the second half of 2027, up
   to the YP 6.3 release. These will be added to the release calendar once =
the
   wiki is editable.
   -

      6.1.5:    2027-05-24
      -

      6.2.1:    2027-05-31
      -

      6.0.9:    2027-06-07
      -

      5.0.26:   2027-06-14
      -

      6.3 M1:   2027-06-21
      -

      6.2.2:    2027-07-05
      -

      6.0.10:   2027-07-19
      -

      5.0.27:   2027-07-26
      -

      6.3 M2:   2027-08-02
      -

      6.2.3:    2027-08-23
      -

      6.0.11:   2027-08-30
      -

      5.0.28:   2027-09-06
      -

      6.3 M3:   2027-09-13
      -

      6.2.4:    2027-10-04
      -

      6.0.12:   2027-10-11
      -

      5.0.29:   2027-10-18
      -

      6.3:      2027-11-01
      -

   The CFP is open for the OpenEmbedded Workshop to be held in Brussels on
   Feb 1st 2027: https://pretalx.com/openembedded-workshop-2027/


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

   WDD 2699 (last week 2699) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   OE-Core/Poky Patch Metrics
   -

      Total found: 1040 (last week 1042)
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

--000000000000a2bc41065f612ba1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span id=3D"gmail-docs-internal-guid-6760ea67-7fff-0b=
bf-1964-e15f8071aeca"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-=
serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;ver=
tical-align:baseline;white-space:pre-wrap">Current Dev Position: YP 6.2 M1 =
- Development</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top=
:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;v=
ertical-align:baseline;white-space:pre-wrap">Next Deadline: YP 6.2 M1: w/c =
2026-12-14</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sa=
ns-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;=
vertical-align:baseline;white-space:pre-wrap">Next Team Meetings:</span></p=
><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"li=
st-style-type:disc;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0=
,0,0);background-color:transparent;font-variant:normal;vertical-align:basel=
ine;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant:normal;vertical-align:baseline;whit=
e-space:pre-wrap">Bug Triage meeting - Thursday 5th Nov. 7:30am PDT (</span=
><a href=3D"https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6d=
z09" style=3D"text-decoration:none"><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant:normal;text-decoration:underline;vertical-=
align:baseline;white-space:pre-wrap">https://zoom.us/j/454367603?pwd=3DZGxo=
a2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</span></a><span style=3D"font-size:11pt;backgr=
ound-color:transparent;font-variant:normal;vertical-align:baseline;white-sp=
ace:pre-wrap">)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:dis=
c;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-=
color:transparent;font-variant:normal;vertical-align:baseline;white-space:p=
re"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tr=
ansparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap"=
>Weekly Project Engineering Sync=C2=A0 - Tuesday 3rd Nov. 8am PDT (</span><=
a href=3D"https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT0=
9" style=3D"text-decoration:none"><span style=3D"font-size:11pt;background-=
color:transparent;font-variant:normal;text-decoration:underline;vertical-al=
ign:baseline;white-space:pre-wrap">https://zoom.us/j/990892712?pwd=3DcHU1Mj=
hoM2x6ck81bkcrYjRrcmJsUT09</span></a><a href=3D"https://zoom.us/j/990892712=
" style=3D"text-decoration:none"><span style=3D"font-size:11pt;background-c=
olor:transparent;font-variant:normal;text-decoration:underline;vertical-ali=
gn:baseline;white-space:pre-wrap">)</span></a></p></li><li dir=3D"ltr" styl=
e=3D"list-style-type:disc;font-size:9.5pt;font-family:Arial,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-alig=
n:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:=
11pt;background-color:transparent;font-variant:normal;vertical-align:baseli=
ne;white-space:pre-wrap">Yocto Project Patch Review - Thursday 5th Nov. 10a=
m GMT and Monday 9th Nov.. 9am PDT (</span><a href=3D"https://zoom.us/j/977=
62397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1" style=3D"text-decoration:=
none"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt:normal;text-decoration:underline;vertical-align:baseline;white-space:pre=
-wrap">https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.=
1</span></a><span style=3D"font-size:11pt;background-color:transparent;font=
-variant:normal;vertical-align:baseline;white-space:pre-wrap">)</span></p><=
/li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;col=
or:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">Project data dashboard: </span><a href=3D=
"https://dashboard.yoctoproject.org/" style=3D"text-decoration:none"><span =
style=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:trans=
parent;font-variant:normal;text-decoration:underline;vertical-align:baselin=
e;white-space:pre-wrap">https://dashboard.yoctoproject.org/</span></a><span=
 style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);back=
ground-color:transparent;font-variant:normal;vertical-align:baseline;white-=
space:pre-wrap">=C2=A0</span></p><br><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-fam=
ily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-var=
iant:normal;vertical-align:baseline;white-space:pre-wrap">Key Status/Update=
s:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr"=
 style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;=
color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-=
align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-s=
ize:11pt;background-color:transparent;font-variant:normal;vertical-align:ba=
seline;white-space:pre-wrap">Patches for 6.2 have started merging into mast=
er</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:1=
1pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpar=
ent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pr=
esentation"><span style=3D"font-size:11pt;background-color:transparent;font=
-variant:normal;vertical-align:baseline;white-space:pre-wrap">There is a pr=
oposal for changes to layer configuration setup out for discussion: </span>=
<a href=3D"https://lists.openembedded.org/g/openembedded-architecture/messa=
ge/2431" style=3D"text-decoration:none"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant:normal;text-decoration:underline;verti=
cal-align:baseline;white-space:pre-wrap">https://lists.openembedded.org/g/o=
penembedded-architecture/message/2431</span></a></p></li><li dir=3D"ltr" st=
yle=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;col=
or:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-ali=
gn:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size=
:11pt;background-color:transparent;font-variant:normal;vertical-align:basel=
ine;white-space:pre-wrap">The proposed layer changes will likely be more in=
vasive than many of the recent changes but also incorporate a number of new=
 features and improvements which will make them useful to everyone and allo=
w various cleanups of existing code. A full proposal should be ready for re=
view soon.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;fon=
t-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:=
transparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" ro=
le=3D"presentation"><span style=3D"font-size:11pt;background-color:transpar=
ent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">The Y=
octo Project wiki was made read-only to mitigate PHP security issues report=
ed last week, we hope to have this working fully again soon.</span></p></li=
><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:A=
rial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:=
normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span=
 style=3D"font-size:11pt;background-color:transparent;font-variant:normal;v=
ertical-align:baseline;white-space:pre-wrap">Now that YP 6.1 is released, w=
e will re-test Yocto Project compatible layers for the new release. If you =
have a YP compatible layer, please ensure you have created a =E2=80=9Cblack=
sail=E2=80=9D branch.</span></p></li><li dir=3D"ltr" style=3D"list-style-ty=
pe:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgr=
ound-color:transparent;font-variant:normal;vertical-align:baseline;white-sp=
ace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-=
wrap">There are issues the triage team spotted where we could benefit from =
help:</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=
=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">go recipes are not devtool upgradeab=
le (#14944)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;=
font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;font-variant:normal;vertical-align:baseline;white-space:pre"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
 role=3D"presentation"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">sy=
stemd user/groups different on opkg vs rpm images (#14139)</span></p></li><=
li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:A=
rial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:=
normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span=
 style=3D"font-size:11pt;background-color:transparent;font-variant:normal;v=
ertical-align:baseline;white-space:pre-wrap">recipetool create should add t=
ag=3D for git SRC_URI (#15816)</span></p></li></ul><li dir=3D"ltr" style=3D=
"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb=
(0,0,0);background-color:transparent;font-variant:normal;vertical-align:bas=
eline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;=
background-color:transparent;font-variant:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">We plan to move a couple of planned releases forward by=
 a week to avoid needing to make a release during the end of the year holid=
ays.</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=
=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">6.1.1:=C2=A0 =C2=A0 2026-11-23</span=
></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;fo=
nt-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fo=
nt-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presenta=
tion"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt:normal;vertical-align:baseline;white-space:pre-wrap">6.0.5:=C2=A0 =C2=A0=
 2026-11-30</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;=
font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;font-variant:normal;vertical-align:baseline;white-space:pre"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
 role=3D"presentation"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">5.=
0.22: =C2=A0 2026-12-07</span></p></li><li dir=3D"ltr" style=3D"list-style-=
type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);ba=
ckground-color:transparent;font-variant:normal;vertical-align:baseline;whit=
e-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background=
-color:transparent;font-variant:normal;vertical-align:baseline;white-space:=
pre-wrap">6.2 M1: =C2=A0 2026-12-14</span></p></li></ul><li dir=3D"ltr" sty=
le=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-alig=
n:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:=
11pt;background-color:transparent;font-variant:normal;vertical-align:baseli=
ne;white-space:pre-wrap">We have also planned out release dates for the sec=
ond half of 2027, up to the YP 6.3 release. These will be added to the rele=
ase calendar once the wiki is editable.</span></p></li><ul style=3D"margin-=
top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;=
font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;font-variant:normal;vertical-align:baseline;white-space:pre"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
 role=3D"presentation"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">6.=
1.5:=C2=A0 =C2=A0 2027-05-24</span></p></li><li dir=3D"ltr" style=3D"list-s=
tyle-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">6.2.1:=C2=A0 =C2=A0 2027-05-31</span></p></li><li dir=3D"ltr=
" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre-wrap">6.0.9:=C2=A0 =C2=A0 2027-06-07</span></p></=
li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-fami=
ly:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><=
span style=3D"font-size:11pt;background-color:transparent;font-variant:norm=
al;vertical-align:baseline;white-space:pre-wrap">5.0.26: =C2=A0 2027-06-14<=
/span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11=
pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpare=
nt;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pre=
sentation"><span style=3D"font-size:11pt;background-color:transparent;font-=
variant:normal;vertical-align:baseline;white-space:pre-wrap">6.3 M1: =C2=A0=
 2027-06-21</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;=
font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;font-variant:normal;vertical-align:baseline;white-space:pre"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
 role=3D"presentation"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">6.=
2.2:=C2=A0 =C2=A0 2027-07-05</span></p></li><li dir=3D"ltr" style=3D"list-s=
tyle-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">6.0.10: =C2=A0 2027-07-19</span></p></li><li dir=3D"ltr" sty=
le=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;co=
lor:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-al=
ign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-siz=
e:11pt;background-color:transparent;font-variant:normal;vertical-align:base=
line;white-space:pre-wrap">5.0.27: =C2=A0 2027-07-26</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">6.3 M2: =C2=A0 2027-08-02</span></p>=
</li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-va=
riant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre-wrap">6.2.3:=C2=A0 =C2=A0 202=
7-08-23</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font=
-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:t=
ransparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" rol=
e=3D"presentation"><span style=3D"font-size:11pt;background-color:transpare=
nt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">6.0.11=
: =C2=A0 2027-08-30</span></p></li><li dir=3D"ltr" style=3D"list-style-type=
:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgr=
ound-color:transparent;font-variant:normal;vertical-align:baseline;white-sp=
ace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-=
wrap">5.0.28: =C2=A0 2027-09-06</span></p></li><li dir=3D"ltr" style=3D"lis=
t-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0=
,0,0);background-color:transparent;font-variant:normal;vertical-align:basel=
ine;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant:normal;vertical-align:baseline;whit=
e-space:pre-wrap">6.3 M3: =C2=A0 2027-09-13</span></p></li><li dir=3D"ltr" =
style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical=
-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-=
size:11pt;background-color:transparent;font-variant:normal;vertical-align:b=
aseline;white-space:pre-wrap">6.2.4:=C2=A0 =C2=A0 2027-10-04</span></p></li=
><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family=
:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varian=
t:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><sp=
an style=3D"font-size:11pt;background-color:transparent;font-variant:normal=
;vertical-align:baseline;white-space:pre-wrap">6.0.12: =C2=A0 2027-10-11</s=
pan></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt=
;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent=
;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"prese=
ntation"><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant:normal;vertical-align:baseline;white-space:pre-wrap">5.0.29: =C2=A0 2=
027-10-18</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;fo=
nt-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color=
:transparent;font-variant:normal;vertical-align:baseline;white-space:pre"><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" r=
ole=3D"presentation"><span style=3D"font-size:11pt;background-color:transpa=
rent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">6.3:=
=C2=A0 =C2=A0 =C2=A0 2027-11-01</span></p></li></ul><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align:=
baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11=
pt;background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre-wrap">The CFP is open for the OpenEmbedded Workshop to be =
held in Brussels on Feb 1st 2027: </span><a href=3D"https://pretalx.com/ope=
nembedded-workshop-2027/" style=3D"text-decoration:none"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant:normal;text-decoratio=
n:underline;vertical-align:baseline;white-space:pre-wrap">https://pretalx.c=
om/openembedded-workshop-2027/</span></a></p></li></ul><br><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"f=
ont-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-w=
rap">Want to contribute? We would appreciate help with the following areas:=
</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" s=
tyle=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;co=
lor:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-al=
ign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-siz=
e:11pt;background-color:transparent;font-variant:normal;vertical-align:base=
line;white-space:pre-wrap">We have several open issues for pseudo and limit=
ed maintainer time to work on them. Help from someone familiar with systems=
 programming in C would be greatly appreciated. </span><a href=3D"https://b=
ugzilla.yoctoproject.org/buglist.cgi?list_id=3D661406&amp;priority=3DHigh&a=
mp;priority=3DMedium%2B&amp;product=3DPseudo&amp;query_format=3Dadvanced&am=
p;resolution=3D---" style=3D"text-decoration:none"><span style=3D"font-size=
:11pt;background-color:transparent;font-variant:normal;text-decoration:unde=
rline;vertical-align:baseline;white-space:pre-wrap">https://bugzilla.yoctop=
roject.org/buglist.cgi?list_id=3D661406&amp;priority=3DHigh&amp;priority=3D=
Medium%2B&amp;product=3DPseudo&amp;query_format=3Dadvanced&amp;resolution=
=3D---</span></a></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;fon=
t-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:=
transparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" ro=
le=3D"presentation"><span style=3D"font-size:11pt;background-color:transpar=
ent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">There=
 are a large number of intermittent failures on our autobuilder, any help w=
ith investigating, reproducing or solving these issues would be welcome! </=
span><a href=3D"https://valkyrie.yocto.io/pub/non-release/abint/" style=3D"=
text-decoration:none"><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant:normal;text-decoration:underline;vertical-align:baseline=
;white-space:pre-wrap">https://valkyrie.yocto.io/pub/non-release/abint/</sp=
an></a></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11p=
t;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pres=
entation"><span style=3D"font-size:11pt;background-color:transparent;font-v=
ariant:normal;vertical-align:baseline;white-space:pre-wrap">Many recipes in=
 openembedded-core would benefit from a new recipe maintainer. Please look =
at </span><a href=3D"https://git.openembedded.org/openembedded-core/tree/me=
ta/conf/distro/include/maintainers.inc" style=3D"text-decoration:none"><spa=
n style=3D"font-size:11pt;background-color:transparent;font-variant:normal;=
text-decoration:underline;vertical-align:baseline;white-space:pre-wrap">htt=
ps://git.openembedded.org/openembedded-core/tree/meta/conf/distro/include/m=
aintainers.inc</span></a><span style=3D"font-size:11pt;background-color:tra=
nsparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">=
 and see if you can adopt any of the unassigned recipes.</span></p></li><li=
 dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial=
,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:norm=
al;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span sty=
le=3D"font-size:11pt;background-color:transparent;font-variant:normal;verti=
cal-align:baseline;white-space:pre-wrap">For more ways to contribute, see <=
/span><a href=3D"https://docs.google.com/document/d/18oxKWxLorfF813h82mK6yK=
TIHeBp_-9owFuCWbzgjOk/edit?usp=3Dsharing" style=3D"text-decoration:none"><s=
pan style=3D"font-size:11pt;background-color:transparent;font-variant:norma=
l;text-decoration:underline;vertical-align:baseline;white-space:pre-wrap">h=
ttps://docs.google.com/document/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9owFuCWbzg=
jOk/edit?usp=3Dsharing</span></a></p></li></ul><br><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size=
:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transp=
arent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">New=
 to the project?</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><=
li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ari=
al,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:no=
rmal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span s=
tyle=3D"font-size:11pt;background-color:transparent;font-variant:normal;ver=
tical-align:baseline;white-space:pre-wrap">We have a list of issues we thin=
k are good places to start contributing: </span><a href=3D"https://bugzilla=
.yoctoproject.org/buglist.cgi?quicksearch=3DNEWCOMER" style=3D"text-decorat=
ion:none"><span style=3D"font-size:11pt;background-color:transparent;font-v=
ariant:normal;text-decoration:underline;vertical-align:baseline;white-space=
:pre-wrap">https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DNEWC=
OMER</span></a></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:=
Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant=
:normal;vertical-align:baseline;white-space:pre-wrap">Tracking Metrics:</sp=
an></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align:=
baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11=
pt;background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre-wrap">WDD 2699 (last week 2699) </span><span style=3D"font=
-size:11pt;font-family:Consolas,sans-serif;background-color:transparent;fon=
t-variant:normal;vertical-align:baseline;white-space:pre-wrap">(</span><a h=
ref=3D"https://wiki.yoctoproject.org/charts/combo.html" style=3D"text-decor=
ation:none"><span style=3D"font-size:11pt;background-color:transparent;font=
-variant:normal;text-decoration:underline;vertical-align:baseline;white-spa=
ce:pre-wrap">https://wiki.yoctoproject.org/charts/combo.html</span></a><spa=
n style=3D"font-size:11pt;font-family:Consolas,sans-serif;background-color:=
transparent;font-variant:normal;vertical-align:baseline;white-space:pre-wra=
p">)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size=
:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;font-family:Arial,sans-seri=
f;background-color:transparent;font-variant:normal;vertical-align:baseline;=
white-space:pre-wrap">OE-Core/Poky Patch Metrics</span></p></li><ul style=
=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-t=
ype:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);bac=
kground-color:transparent;font-variant:normal;vertical-align:baseline;white=
-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-=
color:transparent;font-variant:normal;vertical-align:baseline;white-space:p=
re-wrap">Total found: 1040 (last week 1042)</span></p></li><li dir=3D"ltr" =
style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical=
-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-=
size:11pt;background-color:transparent;font-variant:normal;vertical-align:b=
aseline;white-space:pre-wrap">Patches in the Pending State: 135 (13%) [last=
 week 135 (13%)]</span></p></li><li dir=3D"ltr" style=3D"list-style-type:ci=
rcle;font-size:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);backgr=
ound-color:transparent;font-variant:normal;vertical-align:baseline;white-sp=
ace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt" role=3D"presentation"><a href=3D"https://valkyrie.yocto.io/pub/non=
-release/patchmetrics/" style=3D"text-decoration:none"><span style=3D"font-=
size:11pt;font-family:Arial,sans-serif;background-color:transparent;font-va=
riant:normal;text-decoration:underline;vertical-align:baseline;white-space:=
pre-wrap">https://valkyrie.yocto.io/pub/non-release/patchmetrics/</span></a=
></p></li></ul></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top=
:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;v=
ertical-align:baseline;white-space:pre-wrap">Upcoming development releases<=
/span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" st=
yle=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;bac=
kground-color:transparent;font-variant:normal;vertical-align:baseline;white=
-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-varian=
t:normal;vertical-align:baseline;white-space:pre-wrap">YP 6.2 M1</span></p>=
</li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=
=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;back=
ground-color:transparent;font-variant:normal;vertical-align:baseline;white-=
space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-variant=
:normal;vertical-align:baseline;white-space:pre-wrap">Build Date w/c </span=
><span style=3D"font-size:11pt;background-color:transparent;font-variant:no=
rmal;vertical-align:baseline;white-space:pre-wrap">2026-11-30</span></p></l=
i><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-famil=
y:Arial,sans-serif;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font=
-size:11pt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap=
">Release Date w/c </span><span style=3D"font-size:11pt;background-color:tr=
ansparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap"=
>2026-12-14</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:di=
sc;font-size:11pt;font-family:Arial,sans-serif;background-color:transparent=
;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"prese=
ntation"><span style=3D"font-size:11pt;font-variant:normal;vertical-align:b=
aseline;white-space:pre-wrap">YP 6.2 M2</span></p></li><ul style=3D"margin-=
top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;=
font-size:11pt;font-family:Arial,sans-serif;background-color:transparent;fo=
nt-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presenta=
tion"><span style=3D"font-size:11pt;font-variant:normal;vertical-align:base=
line;white-space:pre-wrap">Build Date w/c </span><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant:normal;vertical-align:baselin=
e;white-space:pre-wrap">2027-01-18</span></p></li><li dir=3D"ltr" style=3D"=
list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;backgrou=
nd-color:transparent;font-variant:normal;vertical-align:baseline;white-spac=
e:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-variant:nor=
mal;vertical-align:baseline;white-space:pre-wrap">Release Date w/c </span><=
span style=3D"font-size:11pt;background-color:transparent;font-variant:norm=
al;vertical-align:baseline;white-space:pre-wrap">2027-02-01</span></p></li>=
</ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fami=
ly:Arial,sans-serif;background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;font-variant:normal;vertical-align:baseline;white-space:pre-wra=
p">YP 6.2 M3</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px">=
<li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:=
Arial,sans-serif;background-color:transparent;font-variant:normal;vertical-=
align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-s=
ize:11pt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">=
Build Date w/c </span><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">202=
7-03-01</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font=
-size:11pt;font-family:Arial,sans-serif;background-color:transparent;font-v=
ariant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline=
;white-space:pre-wrap">Release Date w/c </span><span style=3D"font-size:11p=
t;background-color:transparent;font-variant:normal;vertical-align:baseline;=
white-space:pre-wrap">2027-03-15</span></p></li></ul><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;backgr=
ound-color:transparent;font-variant:normal;vertical-align:baseline;white-sp=
ace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-variant:n=
ormal;vertical-align:baseline;white-space:pre-wrap">YP 6.2.0</span></p></li=
><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"li=
st-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;background=
-color:transparent;font-variant:normal;vertical-align:baseline;white-space:=
pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-variant:norma=
l;vertical-align:baseline;white-space:pre-wrap">Build Date w/c </span><span=
 style=3D"font-size:11pt;background-color:transparent;font-variant:normal;v=
ertical-align:baseline;white-space:pre-wrap">2027-04-26</span></p></li><li =
dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Aria=
l,sans-serif;background-color:transparent;font-variant:normal;vertical-alig=
n:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:=
11pt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Rele=
ase Date w/c </span><span style=3D"font-size:11pt;background-color:transpar=
ent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">2027-=
05-03</span></p></li></ul></ul><br><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-famil=
y:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varia=
nt:normal;vertical-align:baseline;white-space:pre-wrap">Upcoming dot releas=
es:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr=
" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif=
;background-color:transparent;font-variant:normal;vertical-align:baseline;w=
hite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-va=
riant:normal;vertical-align:baseline;white-space:pre-wrap">YP 6.1.1</span><=
/p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" styl=
e=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;bac=
kground-color:transparent;font-variant:normal;vertical-align:baseline;white=
-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-varian=
t:normal;vertical-align:baseline;white-space:pre-wrap">Build Date w/c 2026-=
11-09</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-s=
ize:11pt;font-family:Arial,sans-serif;background-color:transparent;font-var=
iant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline=
;white-space:pre-wrap">Release Date w/c 2026-11-23</span></p></li></ul><li =
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
 w/c 2026-11-16</span></p></li><li dir=3D"ltr" style=3D"list-style-type:cir=
cle;font-size:11pt;font-family:Arial,sans-serif;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pres=
entation"><span style=3D"font-size:11pt;font-variant:normal;vertical-align:=
baseline;white-space:pre-wrap">Release Date w/c 2026-11-30</span></p></li><=
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
uild Date w/c 2026-11-23</span></p></li><li dir=3D"ltr" style=3D"list-style=
-type:circle;font-size:11pt;font-family:Arial,sans-serif;background-color:t=
ransparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" rol=
e=3D"presentation"><span style=3D"font-size:11pt;font-variant:normal;vertic=
al-align:baseline;white-space:pre-wrap">Release Date w/c 2026-12-07</span><=
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

--000000000000a2bc41065f612ba1--
