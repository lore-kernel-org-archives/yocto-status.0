Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20716.1793112322287240337
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 27 Oct 2026 07:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=pNqzsIhN;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1931ff67a29so121676c88.1
        for <yocto-status@lists.yoctoproject.org>; Tue, 27 Oct 2026 07:45:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793112321; cv=none;
        d=google.com; s=arc-20260327;
        b=mIiZ10AHTmte6T+k9cc0j7ihwCGD2RD5khSf6lThFCygHg0Wg3xOn8917fa/4TFomb
         Hzyg0IwQQJsOfAw1PT1InQihexyxJUehTY5hBil2wsIPkgvNSyM3W1YE0oYjERoScM8/
         XX8XCqLD3qNEa499Lwtv62wl2Qc+pLDplzlAOiHunMFALP+PPniirOOv2830DCAPOovz
         pOX7nwD5rbzsnSimU+ddSdztMy361KchF+G2/JyRw7G63+BQUP9LcJv6twUggQVRVCVb
         RB+6RSKTYE4X6DFwlbZ9msKAy2FUgupO8+hqHqLH8mY0oDr/q7r6d9ZwASiaX80wEr7C
         pTew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=6ieMMDwTJlfHH06itIhHX/+ZcYbaAyk89CU71G1AhfY=;
        fh=+/HsJBXQ0ICV/2zv3ij23fso5eRHb1odttrGOVNdYCg=;
        b=Aq1luEszVY8/DJITrvHYqqGLtfZyDv+pQDQY0wvx4c6nTCItL5fjkM4ajp6ac5Zu4m
         TKz/5ORsy4KLsKXt1bam0CkqfEucELyFL2vyV9aUafHtl/XAWpExl5hn7U0QS62DirKS
         dY3m4SReZu1x4rpO2dolI6xHpg0XwIZ+qGlKYX4yPOfedmeixbLwZJbiQfO9JJL+9ItU
         OyLpZPYQa8CdruUKiRVVdQtmsQ87VaSym0qsdkr/Eh6oWNISJPuaQ+GbSr4RAKFOzjI2
         fPm7jeYNnDx3Ko1mNnmKTCOA2LabJO1D2x31iWAepEDqqg6fsHkoRgFnIG4fwr0iMZmy
         +lkg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793112321; x=1793717121; darn=lists.yoctoproject.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6ieMMDwTJlfHH06itIhHX/+ZcYbaAyk89CU71G1AhfY=;
        b=pNqzsIhNkq97P+gCHvwHuBq4V2TDJBFNi8/988WXANs8gr7IKzpJz7H9Rexq+zTP5Q
         /lrDXq8ozsdewhmbPxnbkQdk39vAMNhpv3xFntU6DaFO/Dm5zIl7KB4+AXE9HZq27wV5
         f8+HMtCTp8wD7W6R/DJmEiN7cb9+2IBIFvSixYaZ3BVd6LkNNJRJeW7l3gWZsNsxjJYs
         DDEWafZhTRgx7Sqc5jQNlYoyGsRJ+OGWGDFrfzEqZp9iDU9GCUG1h3y0Vxp4J4egrNCI
         Lqk0N/3NwmfIXHsHIcvruLQg13iuhBpm4yV8pIb5dKyaYPKnY2Ys6KMa90MSRkMiHo2h
         FZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112321; x=1793717121;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ieMMDwTJlfHH06itIhHX/+ZcYbaAyk89CU71G1AhfY=;
        b=d0pshwVhaQ4oF20l3uR9tkutUOjD0kTY6sxqY5ZBjkNvEChKb2axBpqTn+kIAqybhD
         tQEkhlYXR5I9IP4MgTNdYq5dTxZKEpAdMf0HPD/XTOZUlAN6saHQk/QunCPNG3LiB/MP
         IFHL/Q5F3fT9HL9b/74kIQpSfrDLG/NZKEXSypt1OpkIb+erNQha4/2SSee9DJyQGT7Q
         8/Wz6Zn808Y/sU+j2LQLSEnEfB6zcciZ28vy6f/+djD8rv/1gzZjt0kmPLeFyg8gxU/3
         lUhxWbH+/z+i9DgJAisp3tldFIdKvgguBisw/EJOIU63v+gFkMh4V7rkFWalaTuCaGjb
         IIvA==
X-Forwarded-Encrypted: i=1; AKwUvByF0Zo8T1nPBjCNjFOvnC5aB5Jx3DQCoxuSAwp5vpFTgUylaE4o6/Ul5qhUf+wv+oP3OMWmE+Yw4F4NSp0=@lists.yoctoproject.org
X-Gm-Message-State: AFq9FYIWfEpkhd7slNlTxtY5xqaFM+jIWy6+d6ij5cpEuVGmtrnn2MIV
	q41zB5uWQg6LN3mJbEwvH59ZL79fIBAYJ3NR/SIMPDyyNLl6cChuRMndTeCfxnfNK+rMZBVhUfO
	G8Q5LYdzKfbpTgyQLwyX7MRogovRuIV0=
X-Gm-Gg: AYBFou0VQMJcX/LldbwM1VHqH0n8zY8ckud/Y/onpNPsRx3IrF/QzhI8KhHqHSkuJOa
	jV9ZmGWvJJJitIv22i37SfA4ZU40sasTHlNBtTYcvhcvtrJvCp2UnDliWliPUbZmg7GaU9uEWG2
	4o4mXFOAsHWCm4MaVQh6pLeBCj8CPvj7OmqoZC789prEb/MuB4HrY5MLZ1LbNzPOTu3y16TAOQX
	zd651Ktc3MWhk/xU+WIxsW0mr3lfCZAUj/szbalisXm0jtBPiRhP3WdLRSEiMahtnRLZ4FrLr+Y
	PMmHhvUIocZut9vhSuuxPenb6iwi9SIPoudMryAiCrhCub/KoIjQvGkqLB36w42Sj1tXQJYtYOy
	G0T5J5XePfLJ0z/A7yCgnvYpmuwIN24JWVTtjQg2YuiMFu7QAajYZgZbUFf8wEKr5zzhrWoXjt4
	las8mGuBAHesFqyYQokX1A2bUERGSIuISwC7LKl0ne72TqoRFaPnpYg3F/K6f3Ym131j/by3I1T
	iIAQoQaX0Tg+86TSavAmTWrRuMra9gwNuE8ViLRr3SJlsQC9Bl5BjVqvisgIH2HKMOxBkPoeHKw
	TJ7nQHtoVxnVQ0EJ9MFJ0w==
X-Received: by 2002:a05:7301:488a:b0:368:72f0:353a with SMTP id
 5a478bee46e88-369e8624c4fmr14315948eec.38.1793112319130; Tue, 27 Oct 2026
 07:45:19 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 27 Oct 2026 07:45:06 -0700
X-Gm-Features: AclHuK8jHhpkwJCgfGgLK5d00UA3I1mlOGPnJ5dvsmsngMrDiVjJh16YAUIVyqU
Message-ID: <CAK5yBb8U5LQa3t9bDz5NEeNMAHRn3_eibdUkNg9D4w3kmrjYcQ@mail.gmail.com>
Subject: Yocto Project Status 27 October 2026 (WW44)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000d30474065ed37e41"
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <yocto-status@lists.yoctoproject.org>; Tue, 27 Oct 2026 14:45:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/145

--000000000000d30474065ed37e41
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 6.2 M1 - Development

Next Deadline: YP 6.2 M1: w/c 2026-12-21

Next Team Meetings:

   -

   Bug Triage meeting - Thursday 29th Oct. 7:30am PDT (
   https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
   -

   Weekly Project Engineering Sync  - Tuesday 27th Oct. 8am PDT (
   https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
   <https://zoom.us/j/990892712>
   -

   Yocto Project Patch Review - Thursday 29th Oct. 10am GMT and Monday 2nd
   Nov.. 9am PDT (
   https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1)


Project data dashboard: https://dashboard.yoctoproject.org/

Key Status/Updates:

   -

   YP 5.0.21 was released
   -

   Patches for 6.2 have started merging into master
   -

   There is a proposal for changes to layer configuration setup out for
   discussion:
   https://lists.openembedded.org/g/openembedded-architecture/message/2431
   -

   We have updated packages to handle the Emudhra CA certificate compromise
   that occurred last week, and updates have been expedited on our stable
   branches.
   -

      The AB intermittent issues we frequently highlight caused some delays
      in getting these changes merged to the stable branches - these
intermittent
      issues do have an impact!
      -

   The Yocto Project wiki was made read-only to mitigate PHP security
   issues reported last week, we hope to have this working fully again soon=
.
   -

   We are currently reviewing proposed release dates for 2027 and should be
   able to share these next week.
   -

      We may move some releases forward a week this year to avoid needing
      to make a release during the end-of-year break.
      -

   Now that YP 6.1 is released, we will re-test Yocto Project compatible
   layers for the new release. If you have a YP compatible layer, please
   ensure you have created a =E2=80=9Cblacksail=E2=80=9D branch.
   -

   There are issues where we could accept help:
   -

      Matchbox-wm segfault/xserver restart
      -

      Remaining github.com references in bitbake-selftest
      -

   US daylight savings time finishes this Sunday, some meeting times track
   US Pacific timezone so double check your calendars next week.
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

      Total found: 1042 (last week 1044)
      -

      Patches in the Pending State: 135 (13%) [last week 135 (13%)]
      -

      https://valkyrie.yocto.io/pub/non-release/patchmetrics/


Upcoming development releases

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

   YP 5.0.21 was released
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

--000000000000d30474065ed37e41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span id=3D"gmail-docs-internal-guid-e09863be-7fff-21=
33-c022-7e8810ce155b"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
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
e;white-space:pre-wrap">Bug Triage meeting - Thursday 29th Oct. 7:30am PDT =
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
e-wrap">Weekly Project Engineering Sync=C2=A0 - Tuesday 27th Oct. 8am PDT (=
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
gn:baseline;white-space:pre-wrap">Yocto Project Patch Review - Thursday 29t=
h Oct. 10am GMT and Monday 2nd Nov.. 9am PDT (</span><a href=3D"https://zoo=
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
l-align:baseline;white-space:pre-wrap">YP 5.0.21 was released</span></p></l=
i><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:=
Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant=
:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><spa=
n style=3D"font-size:11pt;background-color:transparent;font-variant:normal;=
vertical-align:baseline;white-space:pre-wrap">Patches for 6.2 have started =
merging into master</span></p></li><li dir=3D"ltr" style=3D"list-style-type=
:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-variant:normal;vertical-align:baseline;white-spac=
e:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color=
:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-wr=
ap">There is a proposal for changes to layer configuration setup out for di=
scussion: </span><a href=3D"https://lists.openembedded.org/g/openembedded-a=
rchitecture/message/2431" style=3D"text-decoration:none"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant:normal;text-decoratio=
n:underline;vertical-align:baseline;white-space:pre-wrap">https://lists.ope=
nembedded.org/g/openembedded-architecture/message/2431</span></a></p></li><=
li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ari=
al,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:no=
rmal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span s=
tyle=3D"font-size:11pt;background-color:transparent;font-variant:normal;ver=
tical-align:baseline;white-space:pre-wrap">We have updated packages to hand=
le the Emudhra CA certificate compromise that occurred last week, and updat=
es have been expedited on our stable branches.</span></p></li><ul style=3D"=
margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:=
circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgro=
und-color:transparent;font-variant:normal;vertical-align:baseline;white-spa=
ce:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-w=
rap">The AB intermittent issues we frequently highlight caused some delays =
in getting these changes merged to the stable branches - these intermittent=
 issues do have an impact!</span></p></li></ul><li dir=3D"ltr" style=3D"lis=
t-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0=
,0);background-color:transparent;font-variant:normal;vertical-align:baselin=
e;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;back=
ground-color:transparent;font-variant:normal;vertical-align:baseline;white-=
space:pre-wrap">The Yocto Project wiki was made read-only to mitigate PHP s=
ecurity issues reported last week, we hope to have this working fully again=
 soon.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-si=
ze:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tran=
sparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">We are =
currently reviewing proposed release dates for 2027 and should be able to s=
hare these next week.</span></p></li><ul style=3D"margin-top:0px;margin-bot=
tom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;fon=
t-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fon=
t-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentat=
ion"><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t:normal;vertical-align:baseline;white-space:pre-wrap">We may move some rel=
eases forward a week this year to avoid needing to make a release during th=
e end-of-year break.</span></p></li></ul><li dir=3D"ltr" style=3D"list-styl=
e-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);ba=
ckground-color:transparent;font-variant:normal;vertical-align:baseline;whit=
e-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background=
-color:transparent;font-variant:normal;vertical-align:baseline;white-space:=
pre-wrap">Now that YP 6.1 is released, we will re-test Yocto Project compat=
ible layers for the new release. If you have a YP compatible layer, please =
ensure you have created a =E2=80=9Cblacksail=E2=80=9D branch.</span></p></l=
i><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:=
Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant=
:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><spa=
n style=3D"font-size:11pt;background-color:transparent;font-variant:normal;=
vertical-align:baseline;white-space:pre-wrap">There are issues where we cou=
ld accept help:</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0p=
x"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-fami=
ly:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><=
span style=3D"font-size:11pt;background-color:transparent;font-variant:norm=
al;vertical-align:baseline;white-space:pre-wrap">Matchbox-wm segfault/xserv=
er restart</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;f=
ont-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" =
role=3D"presentation"><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Rem=
aining </span><a href=3D"http://github.com" style=3D"text-decoration:none">=
<span style=3D"font-size:11pt;background-color:transparent;font-variant:nor=
mal;text-decoration:underline;vertical-align:baseline;white-space:pre-wrap"=
>github.com</span></a><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap"> re=
ferences in bitbake-selftest</span></p></li></ul><li dir=3D"ltr" style=3D"l=
ist-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0=
,0,0);background-color:transparent;font-variant:normal;vertical-align:basel=
ine;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant:normal;vertical-align:baseline;whit=
e-space:pre-wrap">US daylight savings time finishes this Sunday, some meeti=
ng times track US Pacific timezone so double check your calendars next week=
.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11=
pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpare=
nt;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pre=
sentation"><span style=3D"font-size:11pt;background-color:transparent;font-=
variant:normal;vertical-align:baseline;white-space:pre-wrap">The CFP is ope=
n for the OpenEmbedded Workshop to be held in Brussels on Feb 1st 2027: </s=
pan><a href=3D"https://pretalx.com/openembedded-workshop-2027/" style=3D"te=
xt-decoration:none"><span style=3D"font-size:11pt;background-color:transpar=
ent;font-variant:normal;text-decoration:underline;vertical-align:baseline;w=
hite-space:pre-wrap">https://pretalx.com/openembedded-workshop-2027/</span>=
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
-variant:normal;vertical-align:baseline;white-space:pre-wrap">WDD 2699 (las=
t week 2699) </span><span style=3D"font-size:11pt;font-family:Consolas,sans=
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
ertical-align:baseline;white-space:pre-wrap">Total found: 1042 (last week 1=
044)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-si=
ze:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tran=
sparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Patches=
 in the Pending State: 135 (13%) [last week 135 (13%)]</span></p></li><li d=
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
pre-wrap">Upcoming development releases</span></p><ul style=3D"margin-top:0=
px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-si=
ze:11pt;font-family:Arial,sans-serif;background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><=
span style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">YP 6.2 M1</span></p></li><ul style=3D"margin-top:0px;ma=
rgin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:=
11pt;font-family:Arial,sans-serif;background-color:transparent;font-variant=
:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><spa=
n style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;white=
-space:pre-wrap">Build Date w/c </span><span style=3D"font-size:11pt;backgr=
ound-color:transparent;font-variant:normal;vertical-align:baseline;white-sp=
ace:pre-wrap">2026-12-07</span></p></li><li dir=3D"ltr" style=3D"list-style=
-type:circle;font-size:11pt;font-family:Arial,sans-serif;background-color:t=
ransparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" rol=
e=3D"presentation"><span style=3D"font-size:11pt;font-variant:normal;vertic=
al-align:baseline;white-space:pre-wrap">Release Date w/c </span><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">2026-12-21</span></p></li></ul><li d=
ir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,s=
ans-serif;background-color:transparent;font-variant:normal;vertical-align:b=
aseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11p=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">YP 6.2 =
M2</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D=
"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans=
-serif;background-color:transparent;font-variant:normal;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;f=
ont-variant:normal;vertical-align:baseline;white-space:pre-wrap">Build Date=
 w/c </span><span style=3D"font-size:11pt;background-color:transparent;font=
-variant:normal;vertical-align:baseline;white-space:pre-wrap">2027-01-18</s=
pan></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt=
;font-family:Arial,sans-serif;background-color:transparent;font-variant:nor=
mal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span st=
yle=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;white-spa=
ce:pre-wrap">Release Date w/c </span><span style=3D"font-size:11pt;backgrou=
nd-color:transparent;font-variant:normal;vertical-align:baseline;white-spac=
e:pre-wrap">2027-02-01</span></p></li></ul><li dir=3D"ltr" style=3D"list-st=
yle-type:disc;font-size:11pt;font-family:Arial,sans-serif;background-color:=
transparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" ro=
le=3D"presentation"><span style=3D"font-size:11pt;font-variant:normal;verti=
cal-align:baseline;white-space:pre-wrap">YP 6.2 M3</span></p></li><ul style=
=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-t=
ype:circle;font-size:11pt;font-family:Arial,sans-serif;background-color:tra=
nsparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">Build Date w/c </span><span style=3D=
"font-size:11pt;background-color:transparent;font-variant:normal;vertical-a=
lign:baseline;white-space:pre-wrap">2027-03-01</span></p></li><li dir=3D"lt=
r" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-se=
rif;background-color:transparent;font-variant:normal;vertical-align:baselin=
e;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font=
-variant:normal;vertical-align:baseline;white-space:pre-wrap">Release Date =
w/c </span><span style=3D"font-size:11pt;background-color:transparent;font-=
variant:normal;vertical-align:baseline;white-space:pre-wrap">2027-03-15</sp=
an></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11=
pt;font-family:Arial,sans-serif;background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span =
style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">YP 6.2.0</span></p></li><ul style=3D"margin-top:0px;margin-b=
ottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;f=
ont-family:Arial,sans-serif;background-color:transparent;font-variant:norma=
l;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span styl=
e=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;white-space=
:pre-wrap">Build Date w/c </span><span style=3D"font-size:11pt;background-c=
olor:transparent;font-variant:normal;vertical-align:baseline;white-space:pr=
e-wrap">2027-04-26</span></p></li><li dir=3D"ltr" style=3D"list-style-type:=
circle;font-size:11pt;font-family:Arial,sans-serif;background-color:transpa=
rent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D=
"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"p=
resentation"><span style=3D"font-size:11pt;font-variant:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">Release Date w/c </span><span style=3D"fo=
nt-size:11pt;background-color:transparent;font-variant:normal;vertical-alig=
n:baseline;white-space:pre-wrap">2027-05-03</span></p></li></ul></ul><br><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><s=
pan style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);b=
ackground-color:transparent;font-variant:normal;vertical-align:baseline;whi=
te-space:pre-wrap">Upcoming dot releases:</span></p><ul style=3D"margin-top=
:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-=
size:11pt;font-family:Arial,sans-serif;background-color:transparent;font-va=
riant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline=
;white-space:pre-wrap">YP 5.0.21 </span><span style=3D"font-size:11pt;color=
:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre-wrap">was released</span></p></li><li dir=3D"ltr"=
 style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;=
background-color:transparent;font-variant:normal;vertical-align:baseline;wh=
ite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-var=
iant:normal;vertical-align:baseline;white-space:pre-wrap">YP 6.1.1</span></=
p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=
=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;back=
ground-color:transparent;font-variant:normal;vertical-align:baseline;white-=
space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-variant=
:normal;vertical-align:baseline;white-space:pre-wrap">Build Date w/c 2026-1=
1-16</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-si=
ze:11pt;font-family:Arial,sans-serif;background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><=
span style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">Release Date w/c 2026-11-30</span></p></li></ul><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,san=
s-serif;background-color:transparent;font-variant:normal;vertical-align:bas=
eline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;=
font-variant:normal;vertical-align:baseline;white-space:pre-wrap">YP 6.0.5<=
/span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"lt=
r" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-se=
rif;background-color:transparent;font-variant:normal;vertical-align:baselin=
e;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font=
-variant:normal;vertical-align:baseline;white-space:pre-wrap">Build Date w/=
c 2026-11-23</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle=
;font-size:11pt;font-family:Arial,sans-serif;background-color:transparent;f=
ont-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"present=
ation"><span style=3D"font-size:11pt;font-variant:normal;vertical-align:bas=
eline;white-space:pre-wrap">Release Date w/c 2026-12-07</span></p></li></ul=
><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:A=
rial,sans-serif;background-color:transparent;font-variant:normal;vertical-a=
lign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-si=
ze:11pt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Y=
P 5.0.22</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li =
dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Aria=
l,sans-serif;background-color:transparent;font-variant:normal;vertical-alig=
n:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:=
11pt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Buil=
d Date w/c 2026-11-30</span></p></li><li dir=3D"ltr" style=3D"list-style-ty=
pe:circle;font-size:11pt;font-family:Arial,sans-serif;background-color:tran=
sparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">Release Date w/c 2026-12-14</span></=
p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fo=
nt-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fo=
nt-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presenta=
tion"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt:normal;vertical-align:baseline;white-space:pre-wrap">For future release =
dates, see </span><a href=3D"https://wiki.yoctoproject.org/wiki/Release_cal=
endar" style=3D"text-decoration:none"><span style=3D"font-size:11pt;backgro=
und-color:transparent;font-variant:normal;text-decoration:underline;vertica=
l-align:baseline;white-space:pre-wrap">https://wiki.yoctoproject.org/wiki/R=
elease_calendar</span></a></p></li></ul><br><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;f=
ont-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;f=
ont-variant:normal;vertical-align:baseline;white-space:pre-wrap">The Yocto =
Project=E2=80=99s technical governance is through its Technical Steering Co=
mmittee, more information is available at:</span></p><p dir=3D"ltr" style=
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

--000000000000d30474065ed37e41--
