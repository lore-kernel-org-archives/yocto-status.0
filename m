Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A21FC79F82
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 14:52:29 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9195.1788878761060935462
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 08 Sep 2026 07:46:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aKweJwUQ;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.76, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356256so553612f8f.1
        for <yocto-status@lists.yoctoproject.org>; Tue, 08 Sep 2026 07:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788878759; x=1789483559; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-type:date:cc:to:from:subject
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p4UUT5CtPqs7F5DBNBrGvujGJgllllUz+iCXyuUDqx8=;
        b=aKweJwUQEyL/gbK3L5jH7vMitCSqmQ4PEcKveYy4n2tGN56wMdIiTHpcB0gne6DmxS
         ogchhhKTej8X1mAjPbri5dQvkWjEuEKoqUWYLNc0GocLtZBkS61U/r9uwosu/gIUJVRd
         igpO9ontwfcOLbRBxj2vkKWB1EFnpwS0Zy0I8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788878759; x=1789483559;
        h=mime-version:user-agent:content-type:date:cc:to:from:subject
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p4UUT5CtPqs7F5DBNBrGvujGJgllllUz+iCXyuUDqx8=;
        b=EOjcR3Mc9xKNkxgpvFmE0mro/FycazkD1ght3hCRD5lHwMiBq0ofuK0RM4G3oE5XHl
         xwqxSYpi6sceRiqnRHgnp4GDAXslZuEO3Yf1lzfzoJomFWsJiqMuS9HKqwQP5TrueTeC
         Qi8OamO4l4x28e8zwoiZsePeFKObYiTk7Xtaeef70W1LYALLObGfQqyCRdeT2nQRPsTW
         hUbLGi5qp+d6sUShBv+nCRZAnOSEBMQEOF2TJQtAXWKGIe183oixi6YzrXZNgCOe8SoQ
         +wt70S6oc2FBGlXkxWEh/4kKsbdcfPQnbh2qDfRXqc3zpiYb0oARFOkyY6uBAtiLfjbV
         FLhQ==
X-Forwarded-Encrypted: i=1; AKwUvBzV3AywUxCYeuxBFHKaRs6awAm+SFbmob8JF4BZQeTxX+cd4liA83Kc/CE0EIaBC/53B/PGeAhiBWiGsoQ=@lists.yoctoproject.org
X-Gm-Message-State: AFuF++k3K+V0TNInru3gQLD1mS+3FBti4+6kMw31KIQZ/Oe+pN5quPvs
	yDFQ/VoV+58WtFYjFblQKF4QUbnoRsDz1vaZQdzZ/RJllS/1Ef6haPHinZLLEWlsUN4=
X-Gm-Gg: AYBFou3AvMfEjR9CqKDpfutFtNcCkvQ7UtzFQTN7pvC4vJZtXPyIMA9NYGBUXCLmIgl
	WWn/kEAF4XzjCynQdJhlgPN/fnNd6IuFm1vcitYfPssxiP4PTAMfZGlAzjCI3uCZNd4urDkKO4C
	6Rg4k3/f2zchlqz20bF7np/yo48k9gs6wa7Hp7SCouM2iERmevwEX6EODaQr+yR+Vei0wDmOMHw
	HFeJK9tiXx5sp7Hlf8DW7S9L8HJykDUCMXrzD6BzTNh7qKJq9v7zvF+63SGRUrPGPwdXXKQIEtG
	Fza2CsU17DIJb2bL2d2ReAHWWBdnw1Xopu4TGnb+AxOVuRRiK0iGGHgDZAjiIVZWuBwGII8wPCI
	U0a+t1WajkQhR7g3akim6zwrNKVYBfHD+yLW6B6jxAb9SVDmQ0bI1gnu3SiX9/jNkFvA9A5a2R6
	uOV01NCoYpnIag60WDeAubfluX+ZfBABpdVye9auA05VPV/BgPN7fsbRXk5EWjUuejccbhFu7qF
	64JlspRf43SYQ9nRm3S6qFwD52dEKHDuoundDqXQ2O90p0tt4dXCMmg0ZMGrzIN
X-Received: by 2002:a05:600c:c084:b0:49c:f13e:e4e with SMTP id 5b1f17b1804b1-49d1757ab19mr349225e9.11.1788878758383;
        Tue, 08 Sep 2026 07:45:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3b52:472d:bd88:cdf3? ([2001:8b0:aba:5f3c:3b52:472d:bd88:cdf3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce551bf7asm322373165e9.2.2026.09.08.07.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:45:57 -0700 (PDT)
Message-ID: <5c0a2b2c6c5d35b57eff6a75ce57a7acf625e34d.camel@linuxfoundation.org>
Subject: Yocto Project Status 8 September 2026 (WW37)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org, 
 yocto-status <yocto-status@lists.yoctoproject.org>
Cc: "Stephen K Jolley (via Google Docs)" <sjolley.yp.pm@gmail.com>
Date: Tue, 08 Sep 2026 15:45:56 +0100
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-F/EWUXt2taskR2Wy8jD4"
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Tue, 08 Sep 2026 14:52:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/138

--=-F/EWUXt2taskR2Wy8jD4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 6.1 M3 - Feature Freeze
Next Deadline: YP 6.1 M3: w/c 2026-08-31

Next Team Meetings:
 * Bug Triage meeting - Thursday 10th Sept. 7:30am PDT
   (https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
 * Weekly Project Engineering Sync=C2=A0 - Tuesday 8th Sept. 8am PDT
   (https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
   [1]
 * Yocto Project Patch Review - Thursday 10th Sept. 10am GMT and Monday
   14th Sept. 9am PDT
   (https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1
   )

Project data dashboard: https://dashboard.yoctoproject.org/=C2=A0

Key Status/Updates:
 * YP 6.0.3 was released
 * YP 5.0.20 is under review.
 * YP 6.1 M3 is due to build and we are at feature freeze
 * There are issues with changes in bot/AI protection at github.com
   which are affecting our CI.=C2=A0
 * Most M3 changes have merged, we want to mitigate the github issues
   before building M3.
 * There is a new meta-openjdk layer:
   https://github.com/amarula/meta-openjdk
https://lore.kernel.org/yocto-patches/xBB4.1788187111192557019.ULaN@lists.y=
octoproject.org/T/#u
 * AI scrapers and bots continue to impact the infrastructure, taking
   huge amounts of time for our sysadmins and with a significant cost
   impact to the project.
 * There are two AB-INT issues which are in a position where others
   could now help, as detailed in
   https://lists.openembedded.org/g/openembedded-core/message/242105:
    - Matchbox-wm segfault/xserver restart
    - aarch64/x86-64 build host contamination/reproducibility issue
We get a lot of comments about these being hard to reproduce or work
on, in both cases, these have specific well defined things which need
to be done and a basic understanding of what the issue relates to, if
not the actual fix.
 * Remaining intermittent build failures of concern:
    - other qemu =E2=80=98hang=E2=80=99 type issues on ARM
    - sometimes yocto-check-layer is showing checksum mismatch issues
    - intermittent ptest failures in many recipes

Want to contribute? We would appreciate help with the following areas:
 * We have several open issues for pseudo and limited maintainer time
   to work on them. Help from someone familiar with systems programming
   in C would be greatly appreciated.
   https://bugzilla.yoctoproject.org/buglist.cgi?list_id=3D661406&priority=
=3DHigh&priority=3DMedium%2B&product=3DPseudo&query_format=3Dadvanced&resol=
ution=3D---
 * There are a large number of intermittent failures on our
   autobuilder, any help with investigating, reproducing or solving
   these issues would be welcome!
   https://valkyrie.yocto.io/pub/non-release/abint/
 * Many recipes in openembedded-core would benefit from a new recipe
   maintainer. Please look at
   https://git.openembedded.org/openembedded-core/tree/meta/conf/distro/inc=
lude/maintainers.inc
   and see if you can adopt any of the unassigned recipes.
 * For more ways to contribute, see
   https://docs.google.com/document/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9owFuC=
WbzgjOk/edit?usp=3Dsharing

New to the project?
 * We have a list of issues we think are good places to start
   contributing:
   https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DNEWCOMER

Tracking Metrics:
 * WDD 2622 (last week 2612)
   (https://wiki.yoctoproject.org/charts/combo.html)
 * OE-Core/Poky Patch Metrics
    - Total patches found: 1050 (last week 1039)
    - Patches in the Pending State: 136 (13%) [last week 139 (14%)]
    - https://valkyrie.yocto.io/pub/non-release/patchmetrics/

Upcoming development releases:
 * 6.1 M3:
    - Build Date: w/c 2026-08-31
    - Release Date: w/c 2026-09-14
 * 6.1.0:
    - Build Date (M4): w/c 2026-10-12
    - Release Date: w/c 2026-11-02

Upcoming dot releases:
 * YP 6.0.3 is in review,
    - Release Date w/c 2026-08-24
 * YP 5.0.20 is in QA.
    - Release Date w/c 2026-08-31
 * YP 6.0.4
    - Build Date w/c 2026-09-28
    - Release Date w/c 2026-10-12
 * YP 5.0.21
    - Build Date w/c 2026-10-05
    - Release Date w/c 2026-10-19
 * For future release dates, see
   https://wiki.yoctoproject.org/wiki/Release_calendar

The Yocto Project=E2=80=99s technical governance is through its Technical
Steering Committee, more information is available at:
https://wiki.yoctoproject.org/wiki/TSC

The Status reports are stored on the wiki at:
https://wiki.yoctoproject.org/wiki/Weekly_Status

[If anyone has suggestions for other information you=E2=80=99d like to see =
on
this weekly status update, let us know!]

[1] ) https://zoom.us/j/990892712

--=-F/EWUXt2taskR2Wy8jD4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><pre></pre><pre style=3D"caret-color: rgb(46, 52, 54);=
 color: rgb(46, 52, 54);"></pre><pre><div><span style=3D"font-family: Arial=
, sans-serif; font-size: 11pt; white-space: pre-wrap;">Current Dev Position=
: YP 6.1 M3 - Feature Freeze</span></div><div><span style=3D"font-size: 11p=
t; font-family: Arial, sans-serif; font-variant-ligatures: normal; font-var=
iant-caps: normal; font-variant-alternates: normal; font-variant-numeric: n=
ormal; font-variant-east-asian: normal; font-variant-position: normal; font=
-variant-emoji: normal; vertical-align: baseline; white-space: pre-wrap;">N=
ext Deadline: YP 6.1 M3: w/c 2026-08-31</span></div><br><div><span style=3D=
"font-size: 11pt; font-family: Arial, sans-serif; font-variant-ligatures: n=
ormal; font-variant-caps: normal; font-variant-alternates: normal; font-var=
iant-numeric: normal; font-variant-east-asian: normal; font-variant-positio=
n: normal; font-variant-emoji: normal; vertical-align: baseline; white-spac=
e: pre-wrap;">Next Team Meetings:</span></div><ul style=3D"margin-top:0;mar=
gin-bottom:0;padding-inline-start:48px;"><li dir=3D"ltr" style=3D"list-styl=
e-type: disc; font-size: 9.5pt; font-family: Arial, sans-serif; font-varian=
t-ligatures: normal; font-variant-caps: normal; font-variant-alternates: no=
rmal; font-variant-numeric: normal; font-variant-east-asian: normal; font-v=
ariant-position: normal; font-variant-emoji: normal; vertical-align: baseli=
ne;" aria-level=3D"1"><div><span style=3D"font-size: 11pt; font-variant-lig=
atures: normal; font-variant-caps: normal; font-variant-alternates: normal;=
 font-variant-numeric: normal; font-variant-east-asian: normal; font-varian=
t-position: normal; font-variant-emoji: normal; vertical-align: baseline; w=
hite-space: pre-wrap;">Bug Triage meeting - Thursday 10th Sept. 7:30am PDT =
(</span><a href=3D"https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aV=
pHVVZ6dz09" style=3D"text-decoration:none;"><span style=3D"font-size: 11pt;=
 color: rgb(17, 85, 204); font-variant-ligatures: normal; font-variant-caps=
: normal; font-variant-alternates: normal; font-variant-numeric: normal; fo=
nt-variant-east-asian: normal; font-variant-position: normal; font-variant-=
emoji: normal; text-decoration-line: underline; text-decoration-skip-ink: n=
one; vertical-align: baseline; white-space: pre-wrap;">https://zoom.us/j/45=
4367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</span></a><span style=3D"fon=
t-size: 11pt; font-variant-ligatures: normal; font-variant-caps: normal; fo=
nt-variant-alternates: normal; font-variant-numeric: normal; font-variant-e=
ast-asian: normal; font-variant-position: normal; font-variant-emoji: norma=
l; vertical-align: baseline; white-space: pre-wrap;">)</span></div></li><li=
 dir=3D"ltr" style=3D"list-style-type: disc; font-size: 9.5pt; font-family:=
 Arial, sans-serif; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-variant-alternates: normal; font-variant-numeric: normal; font-var=
iant-east-asian: normal; font-variant-position: normal; font-variant-emoji:=
 normal; vertical-align: baseline;" aria-level=3D"1"><div><span style=3D"fo=
nt-size: 11pt; font-variant-ligatures: normal; font-variant-caps: normal; f=
ont-variant-alternates: normal; font-variant-numeric: normal; font-variant-=
east-asian: normal; font-variant-position: normal; font-variant-emoji: norm=
al; vertical-align: baseline; white-space: pre-wrap;">Weekly Project Engine=
ering Sync&nbsp; - Tuesday 8th Sept. 8am PDT (</span><a href=3D"https://zoo=
m.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09" style=3D"text-deco=
ration:none;"><span style=3D"font-size: 11pt; color: rgb(17, 85, 204); font=
-variant-ligatures: normal; font-variant-caps: normal; font-variant-alterna=
tes: normal; font-variant-numeric: normal; font-variant-east-asian: normal;=
 font-variant-position: normal; font-variant-emoji: normal; text-decoration=
-line: underline; text-decoration-skip-ink: none; vertical-align: baseline;=
 white-space: pre-wrap;">https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81=
bkcrYjRrcmJsUT09</span></a><a href=3D"https://zoom.us/j/990892712" style=3D=
"text-decoration:none;"><span style=3D"font-size: 11pt; color: rgb(17, 85, =
204); font-variant-ligatures: normal; font-variant-caps: normal; font-varia=
nt-alternates: normal; font-variant-numeric: normal; font-variant-east-asia=
n: normal; font-variant-position: normal; font-variant-emoji: normal; text-=
decoration-line: underline; text-decoration-skip-ink: none; vertical-align:=
 baseline; white-space: pre-wrap;">)</span></a></div></li><li dir=3D"ltr" s=
tyle=3D"list-style-type: disc; font-size: 9.5pt; font-family: Arial, sans-s=
erif; font-variant-ligatures: normal; font-variant-caps: normal; font-varia=
nt-alternates: normal; font-variant-numeric: normal; font-variant-east-asia=
n: normal; font-variant-position: normal; font-variant-emoji: normal; verti=
cal-align: baseline;" aria-level=3D"1"><div><span style=3D"font-size: 11pt;=
 font-variant-ligatures: normal; font-variant-caps: normal; font-variant-al=
ternates: normal; font-variant-numeric: normal; font-variant-east-asian: no=
rmal; font-variant-position: normal; font-variant-emoji: normal; vertical-a=
lign: baseline; white-space: pre-wrap;">Yocto Project Patch Review - Thursd=
ay 10th Sept. 10am GMT and Monday 14th Sept. 9am PDT (</span><a href=3D"htt=
ps://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1" style=
=3D"text-decoration:none;"><span style=3D"font-size: 11pt; color: rgb(17, 8=
5, 204); font-variant-ligatures: normal; font-variant-caps: normal; font-va=
riant-alternates: normal; font-variant-numeric: normal; font-variant-east-a=
sian: normal; font-variant-position: normal; font-variant-emoji: normal; te=
xt-decoration-line: underline; text-decoration-skip-ink: none; vertical-ali=
gn: baseline; white-space: pre-wrap;">https://zoom.us/j/97762397148?pwd=3D1=
xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1</span></a><span style=3D"font-size: 11pt; =
font-variant-ligatures: normal; font-variant-caps: normal; font-variant-alt=
ernates: normal; font-variant-numeric: normal; font-variant-east-asian: nor=
mal; font-variant-position: normal; font-variant-emoji: normal; vertical-al=
ign: baseline; white-space: pre-wrap;">)</span></div></li></ul><br><div><sp=
an style=3D"font-size: 11pt; font-family: Arial, sans-serif; font-variant-l=
igatures: normal; font-variant-caps: normal; font-variant-alternates: norma=
l; font-variant-numeric: normal; font-variant-east-asian: normal; font-vari=
ant-position: normal; font-variant-emoji: normal; vertical-align: baseline;=
 white-space: pre-wrap;">Project data dashboard: </span><a href=3D"https://=
dashboard.yoctoproject.org/" style=3D"text-decoration:none;"><span style=3D=
"font-size: 11pt; font-family: Arial, sans-serif; color: rgb(17, 85, 204); =
font-variant-ligatures: normal; font-variant-caps: normal; font-variant-alt=
ernates: normal; font-variant-numeric: normal; font-variant-east-asian: nor=
mal; font-variant-position: normal; font-variant-emoji: normal; text-decora=
tion-line: underline; text-decoration-skip-ink: none; vertical-align: basel=
ine; white-space: pre-wrap;">https://dashboard.yoctoproject.org/</span></a>=
<span style=3D"font-size: 11pt; font-family: Arial, sans-serif; font-varian=
t-ligatures: normal; font-variant-caps: normal; font-variant-alternates: no=
rmal; font-variant-numeric: normal; font-variant-east-asian: normal; font-v=
ariant-position: normal; font-variant-emoji: normal; vertical-align: baseli=
ne; white-space: pre-wrap;">&nbsp;</span></div><br><div><span style=3D"font=
-size: 11pt; font-family: Arial, sans-serif; font-variant-ligatures: normal=
; font-variant-caps: normal; font-variant-alternates: normal; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-variant-position: no=
rmal; font-variant-emoji: normal; vertical-align: baseline; white-space: pr=
e-wrap;">Key Status/Updates:</span></div><ul style=3D"margin-top:0;margin-b=
ottom:0;padding-inline-start:48px;"><li dir=3D"ltr" style=3D"list-style-typ=
e: disc; font-size: 11pt; font-family: Arial, sans-serif; font-variant-liga=
tures: normal; font-variant-caps: normal; font-variant-alternates: normal; =
font-variant-numeric: normal; font-variant-east-asian: normal; font-variant=
-position: normal; font-variant-emoji: normal; vertical-align: baseline;" a=
ria-level=3D"1"><div><span style=3D"font-size: 11pt; font-variant-ligatures=
: normal; font-variant-caps: normal; font-variant-alternates: normal; font-=
variant-numeric: normal; font-variant-east-asian: normal; font-variant-posi=
tion: normal; font-variant-emoji: normal; vertical-align: baseline; white-s=
pace: pre-wrap;">YP 6.0.3 was released</span></div></li><li dir=3D"ltr" sty=
le=3D"list-style-type: disc; font-size: 11pt; font-family: Arial, sans-seri=
f; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-=
alternates: normal; font-variant-numeric: normal; font-variant-east-asian: =
normal; font-variant-position: normal; font-variant-emoji: normal; vertical=
-align: baseline;" aria-level=3D"1"><div><span style=3D"font-size: 11pt; fo=
nt-variant-ligatures: normal; font-variant-caps: normal; font-variant-alter=
nates: normal; font-variant-numeric: normal; font-variant-east-asian: norma=
l; font-variant-position: normal; font-variant-emoji: normal; vertical-alig=
n: baseline; white-space: pre-wrap;">YP 5.0.20 is under review.</span></div=
></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font=
-family: Arial, sans-serif; font-variant-ligatures: normal; font-variant-ca=
ps: normal; font-variant-alternates: normal; font-variant-numeric: normal; =
font-variant-east-asian: normal; font-variant-position: normal; font-varian=
t-emoji: normal; vertical-align: baseline;" aria-level=3D"1"><div><span sty=
le=3D"font-size: 11pt; font-variant-ligatures: normal; font-variant-caps: n=
ormal; font-variant-alternates: normal; font-variant-numeric: normal; font-=
variant-east-asian: normal; font-variant-position: normal; font-variant-emo=
ji: normal; vertical-align: baseline; white-space: pre-wrap;">YP 6.1 M3 is =
due to build and we are at feature freeze</span></div></li><li dir=3D"ltr" =
style=3D"list-style-type: disc; font-size: 11pt; font-family: Arial, sans-s=
erif; font-variant-ligatures: normal; font-variant-caps: normal; font-varia=
nt-alternates: normal; font-variant-numeric: normal; font-variant-east-asia=
n: normal; font-variant-position: normal; font-variant-emoji: normal; verti=
cal-align: baseline;" aria-level=3D"1"><div><span style=3D"font-size: 11pt;=
 font-variant-ligatures: normal; font-variant-caps: normal; font-variant-al=
ternates: normal; font-variant-numeric: normal; font-variant-east-asian: no=
rmal; font-variant-position: normal; font-variant-emoji: normal; vertical-a=
lign: baseline; white-space: pre-wrap;">There are issues with changes in bo=
t/AI protection at github.com which are affecting our CI.&nbsp;</span></div=
></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font=
-family: Arial, sans-serif; font-variant-ligatures: normal; font-variant-ca=
ps: normal; font-variant-alternates: normal; font-variant-numeric: normal; =
font-variant-east-asian: normal; font-variant-position: normal; font-varian=
t-emoji: normal; vertical-align: baseline;" aria-level=3D"1"><div><span sty=
le=3D"font-size: 11pt; font-variant-ligatures: normal; font-variant-caps: n=
ormal; font-variant-alternates: normal; font-variant-numeric: normal; font-=
variant-east-asian: normal; font-variant-position: normal; font-variant-emo=
ji: normal; vertical-align: baseline; white-space: pre-wrap;">Most M3 chang=
es have merged, we want to mitigate the github issues before building M3.</=
span></div></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: =
11pt; font-family: Arial, sans-serif; font-variant-ligatures: normal; font-=
variant-caps: normal; font-variant-alternates: normal; font-variant-numeric=
: normal; font-variant-east-asian: normal; font-variant-position: normal; f=
ont-variant-emoji: normal; vertical-align: baseline;" aria-level=3D"1"><div=
><span style=3D"font-size: 11pt; font-variant-ligatures: normal; font-varia=
nt-caps: normal; font-variant-alternates: normal; font-variant-numeric: nor=
mal; font-variant-east-asian: normal; font-variant-position: normal; font-v=
ariant-emoji: normal; vertical-align: baseline; white-space: pre-wrap;">The=
re is a new meta-openjdk layer: </span><a href=3D"https://github.com/amarul=
a/meta-openjdk" style=3D"text-decoration:none;"><span style=3D"font-size: 1=
1pt; color: rgb(17, 85, 204); font-variant-ligatures: normal; font-variant-=
caps: normal; font-variant-alternates: normal; font-variant-numeric: normal=
; font-variant-east-asian: normal; font-variant-position: normal; font-vari=
ant-emoji: normal; text-decoration-line: underline; text-decoration-skip-in=
k: none; vertical-align: baseline; white-space: pre-wrap;">https://github.c=
om/amarula/meta-openjdk</span></a></div></li></ul><div><a href=3D"https://l=
ore.kernel.org/yocto-patches/xBB4.1788187111192557019.ULaN@lists.yoctoproje=
ct.org/T/#u" style=3D"text-decoration:none;"><span style=3D"font-size: 11pt=
; font-family: Arial, sans-serif; color: rgb(17, 85, 204); font-variant-lig=
atures: normal; font-variant-caps: normal; font-variant-alternates: normal;=
 font-variant-numeric: normal; font-variant-east-asian: normal; font-varian=
t-position: normal; font-variant-emoji: normal; text-decoration-line: under=
line; text-decoration-skip-ink: none; vertical-align: baseline; white-space=
: pre-wrap;">https://lore.kernel.org/yocto-patches/xBB4.1788187111192557019=
.ULaN@lists.yoctoproject.org/T/#u</span></a></div><ul style=3D"margin-top:0=
;margin-bottom:0;padding-inline-start:48px;"><li dir=3D"ltr" style=3D"list-=
style-type: disc; font-size: 11pt; font-family: Arial, sans-serif; font-var=
iant-ligatures: normal; font-variant-caps: normal; font-variant-alternates:=
 normal; font-variant-numeric: normal; font-variant-east-asian: normal; fon=
t-variant-position: normal; font-variant-emoji: normal; vertical-align: bas=
eline;" aria-level=3D"1"><div><span style=3D"font-size: 11pt; font-variant-=
ligatures: normal; font-variant-caps: normal; font-variant-alternates: norm=
al; font-variant-numeric: normal; font-variant-east-asian: normal; font-var=
iant-position: normal; font-variant-emoji: normal; vertical-align: baseline=
; white-space: pre-wrap;">AI scrapers and bots continue to impact the infra=
structure, taking huge amounts of time for our sysadmins and with a signifi=
cant cost impact to the project.</span></div></li><li dir=3D"ltr" style=3D"=
list-style-type: disc; font-size: 11pt; font-family: Arial, sans-serif; fon=
t-variant-ligatures: normal; font-variant-caps: normal; font-variant-altern=
ates: normal; font-variant-numeric: normal; font-variant-east-asian: normal=
; font-variant-position: normal; font-variant-emoji: normal; vertical-align=
: baseline;" aria-level=3D"1"><div><span style=3D"font-size: 11pt; font-var=
iant-ligatures: normal; font-variant-caps: normal; font-variant-alternates:=
 normal; font-variant-numeric: normal; font-variant-east-asian: normal; fon=
t-variant-position: normal; font-variant-emoji: normal; vertical-align: bas=
eline; white-space: pre-wrap;">There are two AB-INT issues which are in a p=
osition where others could now help, as detailed in </span><a href=3D"https=
://lists.openembedded.org/g/openembedded-core/message/242105" style=3D"text=
-decoration:none;"><span style=3D"font-size: 11pt; color: rgb(17, 85, 204);=
 font-variant-ligatures: normal; font-variant-caps: normal; font-variant-al=
ternates: normal; font-variant-numeric: normal; font-variant-east-asian: no=
rmal; font-variant-position: normal; font-variant-emoji: normal; text-decor=
ation-line: underline; text-decoration-skip-ink: none; vertical-align: base=
line; white-space: pre-wrap;">https://lists.openembedded.org/g/openembedded=
-core/message/242105</span></a><span style=3D"font-size: 11pt; font-variant=
-ligatures: normal; font-variant-caps: normal; font-variant-alternates: nor=
mal; font-variant-numeric: normal; font-variant-east-asian: normal; font-va=
riant-position: normal; font-variant-emoji: normal; vertical-align: baselin=
e; white-space: pre-wrap;">:</span></div></li><ul style=3D"margin-top:0;mar=
gin-bottom:0;padding-inline-start:48px;"><li dir=3D"ltr" style=3D"list-styl=
e-type: circle; font-size: 11pt; font-family: Arial, sans-serif; font-varia=
nt-ligatures: normal; font-variant-caps: normal; font-variant-alternates: n=
ormal; font-variant-numeric: normal; font-variant-east-asian: normal; font-=
variant-position: normal; font-variant-emoji: normal; vertical-align: basel=
ine;" aria-level=3D"2"><div><span style=3D"font-size: 11pt; font-variant-li=
gatures: normal; font-variant-caps: normal; font-variant-alternates: normal=
; font-variant-numeric: normal; font-variant-east-asian: normal; font-varia=
nt-position: normal; font-variant-emoji: normal; vertical-align: baseline; =
white-space: pre-wrap;">Matchbox-wm segfault/xserver restart</span></div></=
li><li dir=3D"ltr" style=3D"list-style-type: circle; font-size: 11pt; font-=
family: Arial, sans-serif; font-variant-ligatures: normal; font-variant-cap=
s: normal; font-variant-alternates: normal; font-variant-numeric: normal; f=
ont-variant-east-asian: normal; font-variant-position: normal; font-variant=
-emoji: normal; vertical-align: baseline;" aria-level=3D"2"><div><span styl=
e=3D"font-size: 11pt; font-variant-ligatures: normal; font-variant-caps: no=
rmal; font-variant-alternates: normal; font-variant-numeric: normal; font-v=
ariant-east-asian: normal; font-variant-position: normal; font-variant-emoj=
i: normal; vertical-align: baseline; white-space: pre-wrap;">aarch64/x86-64=
 build host contamination/reproducibility issue</span></div></li></ul></ul>=
<div><span style=3D"font-size: 11pt; font-family: Arial, sans-serif; font-v=
ariant-ligatures: normal; font-variant-caps: normal; font-variant-alternate=
s: normal; font-variant-numeric: normal; font-variant-east-asian: normal; f=
ont-variant-position: normal; font-variant-emoji: normal; vertical-align: b=
aseline; white-space: pre-wrap;">We get a lot of comments about these being=
 hard to reproduce or work on, in both cases, these have specific well defi=
ned things which need to be done and a basic understanding of what the issu=
e relates to, if not the actual fix.</span></div><ul style=3D"margin-top:0;=
margin-bottom:0;padding-inline-start:48px;"><li dir=3D"ltr" style=3D"list-s=
tyle-type: disc; font-size: 11pt; font-family: Arial, sans-serif; font-vari=
ant-ligatures: normal; font-variant-caps: normal; font-variant-alternates: =
normal; font-variant-numeric: normal; font-variant-east-asian: normal; font=
-variant-position: normal; font-variant-emoji: normal; vertical-align: base=
line;" aria-level=3D"1"><div><span style=3D"font-size: 11pt; font-variant-l=
igatures: normal; font-variant-caps: normal; font-variant-alternates: norma=
l; font-variant-numeric: normal; font-variant-east-asian: normal; font-vari=
ant-position: normal; font-variant-emoji: normal; vertical-align: baseline;=
 white-space: pre-wrap;">Remaining intermittent build failures of concern:<=
/span></div></li><ul style=3D"margin-top:0;margin-bottom:0;padding-inline-s=
tart:48px;"><li dir=3D"ltr" style=3D"list-style-type: circle; font-size: 11=
pt; font-family: Arial, sans-serif; font-variant-ligatures: normal; font-va=
riant-caps: normal; font-variant-alternates: normal; font-variant-numeric: =
normal; font-variant-east-asian: normal; font-variant-position: normal; fon=
t-variant-emoji: normal; vertical-align: baseline;" aria-level=3D"2"><div><=
span style=3D"font-size: 11pt; font-variant-ligatures: normal; font-variant=
-caps: normal; font-variant-alternates: normal; font-variant-numeric: norma=
l; font-variant-east-asian: normal; font-variant-position: normal; font-var=
iant-emoji: normal; vertical-align: baseline; white-space: pre-wrap;">other=
 qemu =E2=80=98hang=E2=80=99 type issues on ARM</span></div></li><li dir=3D=
"ltr" style=3D"list-style-type: circle; font-size: 11pt; font-family: Arial=
, sans-serif; font-variant-ligatures: normal; font-variant-caps: normal; fo=
nt-variant-alternates: normal; font-variant-numeric: normal; font-variant-e=
ast-asian: normal; font-variant-position: normal; font-variant-emoji: norma=
l; vertical-align: baseline;" aria-level=3D"2"><div><span style=3D"font-siz=
e: 11pt; font-variant-ligatures: normal; font-variant-caps: normal; font-va=
riant-alternates: normal; font-variant-numeric: normal; font-variant-east-a=
sian: normal; font-variant-position: normal; font-variant-emoji: normal; ve=
rtical-align: baseline; white-space: pre-wrap;">sometimes yocto-check-layer=
 is showing checksum mismatch issues</span></div></li><li dir=3D"ltr" style=
=3D"list-style-type: circle; font-size: 11pt; font-family: Arial, sans-seri=
f; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-=
alternates: normal; font-variant-numeric: normal; font-variant-east-asian: =
normal; font-variant-position: normal; font-variant-emoji: normal; vertical=
-align: baseline;" aria-level=3D"2"><div><span style=3D"font-size: 11pt; fo=
nt-variant-ligatures: normal; font-variant-caps: normal; font-variant-alter=
nates: normal; font-variant-numeric: normal; font-variant-east-asian: norma=
l; font-variant-position: normal; font-variant-emoji: normal; vertical-alig=
n: baseline; white-space: pre-wrap;">intermittent ptest failures in many re=
cipes</span></div></li></ul></ul><br><div><span style=3D"font-size: 11pt; f=
ont-family: Arial, sans-serif; font-variant-ligatures: normal; font-variant=
-caps: normal; font-variant-alternates: normal; font-variant-numeric: norma=
l; font-variant-east-asian: normal; font-variant-position: normal; font-var=
iant-emoji: normal; vertical-align: baseline; white-space: pre-wrap;">Want =
to contribute? We would appreciate help with the following areas:</span></d=
iv><ul style=3D"margin-top:0;margin-bottom:0;padding-inline-start:48px;"><l=
i dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-family:=
 Arial, sans-serif; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-variant-alternates: normal; font-variant-numeric: normal; font-var=
iant-east-asian: normal; font-variant-position: normal; font-variant-emoji:=
 normal; vertical-align: baseline;" aria-level=3D"1"><div><span style=3D"fo=
nt-size: 11pt; font-variant-ligatures: normal; font-variant-caps: normal; f=
ont-variant-alternates: normal; font-variant-numeric: normal; font-variant-=
east-asian: normal; font-variant-position: normal; font-variant-emoji: norm=
al; vertical-align: baseline; white-space: pre-wrap;">We have several open =
issues for pseudo and limited maintainer time to work on them. Help from so=
meone familiar with systems programming in C would be greatly appreciated. =
</span><a href=3D"https://bugzilla.yoctoproject.org/buglist.cgi?list_id=3D6=
61406&amp;priority=3DHigh&amp;priority=3DMedium%2B&amp;product=3DPseudo&amp=
;query_format=3Dadvanced&amp;resolution=3D---" style=3D"text-decoration:non=
e;"><span style=3D"font-size: 11pt; color: rgb(17, 85, 204); font-variant-l=
igatures: normal; font-variant-caps: normal; font-variant-alternates: norma=
l; font-variant-numeric: normal; font-variant-east-asian: normal; font-vari=
ant-position: normal; font-variant-emoji: normal; text-decoration-line: und=
erline; text-decoration-skip-ink: none; vertical-align: baseline; white-spa=
ce: pre-wrap;">https://bugzilla.yoctoproject.org/buglist.cgi?list_id=3D6614=
06&amp;priority=3DHigh&amp;priority=3DMedium%2B&amp;product=3DPseudo&amp;qu=
ery_format=3Dadvanced&amp;resolution=3D---</span></a></div></li><li dir=3D"=
ltr" style=3D"list-style-type: disc; font-size: 11pt; font-family: Arial, s=
ans-serif; font-variant-ligatures: normal; font-variant-caps: normal; font-=
variant-alternates: normal; font-variant-numeric: normal; font-variant-east=
-asian: normal; font-variant-position: normal; font-variant-emoji: normal; =
vertical-align: baseline;" aria-level=3D"1"><div><span style=3D"font-size: =
11pt; font-variant-ligatures: normal; font-variant-caps: normal; font-varia=
nt-alternates: normal; font-variant-numeric: normal; font-variant-east-asia=
n: normal; font-variant-position: normal; font-variant-emoji: normal; verti=
cal-align: baseline; white-space: pre-wrap;">There are a large number of in=
termittent failures on our autobuilder, any help with investigating, reprod=
ucing or solving these issues would be welcome! </span><a href=3D"https://v=
alkyrie.yocto.io/pub/non-release/abint/" style=3D"text-decoration:none;"><s=
pan style=3D"font-size: 11pt; color: rgb(17, 85, 204); font-variant-ligatur=
es: normal; font-variant-caps: normal; font-variant-alternates: normal; fon=
t-variant-numeric: normal; font-variant-east-asian: normal; font-variant-po=
sition: normal; font-variant-emoji: normal; text-decoration-line: underline=
; text-decoration-skip-ink: none; vertical-align: baseline; white-space: pr=
e-wrap;">https://valkyrie.yocto.io/pub/non-release/abint/</span></a></div><=
/li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-f=
amily: Arial, sans-serif; font-variant-ligatures: normal; font-variant-caps=
: normal; font-variant-alternates: normal; font-variant-numeric: normal; fo=
nt-variant-east-asian: normal; font-variant-position: normal; font-variant-=
emoji: normal; vertical-align: baseline;" aria-level=3D"1"><div><span style=
=3D"font-size: 11pt; font-variant-ligatures: normal; font-variant-caps: nor=
mal; font-variant-alternates: normal; font-variant-numeric: normal; font-va=
riant-east-asian: normal; font-variant-position: normal; font-variant-emoji=
: normal; vertical-align: baseline; white-space: pre-wrap;">Many recipes in=
 openembedded-core would benefit from a new recipe maintainer. Please look =
at </span><a href=3D"https://git.openembedded.org/openembedded-core/tree/me=
ta/conf/distro/include/maintainers.inc" style=3D"text-decoration:none;"><sp=
an style=3D"font-size: 11pt; color: rgb(17, 85, 204); font-variant-ligature=
s: normal; font-variant-caps: normal; font-variant-alternates: normal; font=
-variant-numeric: normal; font-variant-east-asian: normal; font-variant-pos=
ition: normal; font-variant-emoji: normal; text-decoration-line: underline;=
 text-decoration-skip-ink: none; vertical-align: baseline; white-space: pre=
-wrap;">https://git.openembedded.org/openembedded-core/tree/meta/conf/distr=
o/include/maintainers.inc</span></a><span style=3D"font-size: 11pt; font-va=
riant-ligatures: normal; font-variant-caps: normal; font-variant-alternates=
: normal; font-variant-numeric: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; font-variant-emoji: normal; vertical-align: ba=
seline; white-space: pre-wrap;"> and see if you can adopt any of the unassi=
gned recipes.</span></div></li><li dir=3D"ltr" style=3D"list-style-type: di=
sc; font-size: 11pt; font-family: Arial, sans-serif; font-variant-ligatures=
: normal; font-variant-caps: normal; font-variant-alternates: normal; font-=
variant-numeric: normal; font-variant-east-asian: normal; font-variant-posi=
tion: normal; font-variant-emoji: normal; vertical-align: baseline;" aria-l=
evel=3D"1"><div><span style=3D"font-size: 11pt; font-variant-ligatures: nor=
mal; font-variant-caps: normal; font-variant-alternates: normal; font-varia=
nt-numeric: normal; font-variant-east-asian: normal; font-variant-position:=
 normal; font-variant-emoji: normal; vertical-align: baseline; white-space:=
 pre-wrap;">For more ways to contribute, see </span><a href=3D"https://docs=
.google.com/document/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9owFuCWbzgjOk/edit?us=
p=3Dsharing" style=3D"text-decoration:none;"><span style=3D"font-size: 11pt=
; color: rgb(17, 85, 204); font-variant-ligatures: normal; font-variant-cap=
s: normal; font-variant-alternates: normal; font-variant-numeric: normal; f=
ont-variant-east-asian: normal; font-variant-position: normal; font-variant=
-emoji: normal; text-decoration-line: underline; text-decoration-skip-ink: =
none; vertical-align: baseline; white-space: pre-wrap;">https://docs.google=
.com/document/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9owFuCWbzgjOk/edit?usp=3Dsha=
ring</span></a></div></li></ul><br><div><span style=3D"font-size: 11pt; fon=
t-family: Arial, sans-serif; font-variant-ligatures: normal; font-variant-c=
aps: normal; font-variant-alternates: normal; font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-variant-position: normal; font-varia=
nt-emoji: normal; vertical-align: baseline; white-space: pre-wrap;">New to =
the project?</span></div><ul style=3D"margin-top:0;margin-bottom:0;padding-=
inline-start:48px;"><li dir=3D"ltr" style=3D"list-style-type: disc; font-si=
ze: 11pt; font-family: Arial, sans-serif; font-variant-ligatures: normal; f=
ont-variant-caps: normal; font-variant-alternates: normal; font-variant-num=
eric: normal; font-variant-east-asian: normal; font-variant-position: norma=
l; font-variant-emoji: normal; vertical-align: baseline;" aria-level=3D"1">=
<div><span style=3D"font-size: 11pt; font-variant-ligatures: normal; font-v=
ariant-caps: normal; font-variant-alternates: normal; font-variant-numeric:=
 normal; font-variant-east-asian: normal; font-variant-position: normal; fo=
nt-variant-emoji: normal; vertical-align: baseline; white-space: pre-wrap;"=
>We have a list of issues we think are good places to start contributing: <=
/span><a href=3D"https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=
=3DNEWCOMER" style=3D"text-decoration:none;"><span style=3D"font-size: 11pt=
; color: rgb(17, 85, 204); font-variant-ligatures: normal; font-variant-cap=
s: normal; font-variant-alternates: normal; font-variant-numeric: normal; f=
ont-variant-east-asian: normal; font-variant-position: normal; font-variant=
-emoji: normal; text-decoration-line: underline; text-decoration-skip-ink: =
none; vertical-align: baseline; white-space: pre-wrap;">https://bugzilla.yo=
ctoproject.org/buglist.cgi?quicksearch=3DNEWCOMER</span></a></div></li></ul=
><br><div><span style=3D"font-size: 11pt; font-family: Arial, sans-serif; f=
ont-variant-ligatures: normal; font-variant-caps: normal; font-variant-alte=
rnates: normal; font-variant-numeric: normal; font-variant-east-asian: norm=
al; font-variant-position: normal; font-variant-emoji: normal; vertical-ali=
gn: baseline; white-space: pre-wrap;">Tracking Metrics:</span></div><ul sty=
le=3D"margin-top:0;margin-bottom:0;padding-inline-start:48px;"><li dir=3D"l=
tr" style=3D"list-style-type: disc; font-size: 11pt; font-family: Arial, sa=
ns-serif; font-variant-ligatures: normal; font-variant-caps: normal; font-v=
ariant-alternates: normal; font-variant-numeric: normal; font-variant-east-=
asian: normal; font-variant-position: normal; font-variant-emoji: normal; v=
ertical-align: baseline;" aria-level=3D"1"><div><span style=3D"font-size: 1=
1pt; font-variant-ligatures: normal; font-variant-caps: normal; font-varian=
t-alternates: normal; font-variant-numeric: normal; font-variant-east-asian=
: normal; font-variant-position: normal; font-variant-emoji: normal; vertic=
al-align: baseline; white-space: pre-wrap;">WDD 2622 (last week 2612) </spa=
n><span style=3D"font-size: 11pt; font-family: Consolas, sans-serif; font-v=
ariant-ligatures: normal; font-variant-caps: normal; font-variant-alternate=
s: normal; font-variant-numeric: normal; font-variant-east-asian: normal; f=
ont-variant-position: normal; font-variant-emoji: normal; vertical-align: b=
aseline; white-space: pre-wrap;">(</span><a href=3D"https://wiki.yoctoproje=
ct.org/charts/combo.html" style=3D"text-decoration:none;"><span style=3D"fo=
nt-size: 11pt; color: rgb(17, 85, 204); font-variant-ligatures: normal; fon=
t-variant-caps: normal; font-variant-alternates: normal; font-variant-numer=
ic: normal; font-variant-east-asian: normal; font-variant-position: normal;=
 font-variant-emoji: normal; text-decoration-line: underline; text-decorati=
on-skip-ink: none; vertical-align: baseline; white-space: pre-wrap;">https:=
//wiki.yoctoproject.org/charts/combo.html</span></a><span style=3D"font-siz=
e: 11pt; font-family: Consolas, sans-serif; font-variant-ligatures: normal;=
 font-variant-caps: normal; font-variant-alternates: normal; font-variant-n=
umeric: normal; font-variant-east-asian: normal; font-variant-position: nor=
mal; font-variant-emoji: normal; vertical-align: baseline; white-space: pre=
-wrap;">)</span></div></li><li dir=3D"ltr" style=3D"list-style-type: disc; =
font-size: 11pt; font-family: Consolas, sans-serif; font-variant-ligatures:=
 normal; font-variant-caps: normal; font-variant-alternates: normal; font-v=
ariant-numeric: normal; font-variant-east-asian: normal; font-variant-posit=
ion: normal; font-variant-emoji: normal; vertical-align: baseline;" aria-le=
vel=3D"1"><div><span style=3D"font-size: 11pt; font-family: Arial, sans-ser=
if; font-variant-ligatures: normal; font-variant-caps: normal; font-variant=
-alternates: normal; font-variant-numeric: normal; font-variant-east-asian:=
 normal; font-variant-position: normal; font-variant-emoji: normal; vertica=
l-align: baseline; white-space: pre-wrap;">OE-Core/Poky Patch Metrics</span=
></div></li><ul style=3D"margin-top:0;margin-bottom:0;padding-inline-start:=
48px;"><li dir=3D"ltr" style=3D"list-style-type: circle; font-size: 11pt; f=
ont-family: Arial, sans-serif; font-variant-ligatures: normal; font-variant=
-caps: normal; font-variant-alternates: normal; font-variant-numeric: norma=
l; font-variant-east-asian: normal; font-variant-position: normal; font-var=
iant-emoji: normal; vertical-align: baseline;" aria-level=3D"2"><div><span =
style=3D"font-size: 11pt; font-variant-ligatures: normal; font-variant-caps=
: normal; font-variant-alternates: normal; font-variant-numeric: normal; fo=
nt-variant-east-asian: normal; font-variant-position: normal; font-variant-=
emoji: normal; vertical-align: baseline; white-space: pre-wrap;">Total patc=
hes found: 1050 (last week 1039)</span></div></li><li dir=3D"ltr" style=3D"=
list-style-type: circle; font-size: 11pt; font-family: Arial, sans-serif; f=
ont-variant-ligatures: normal; font-variant-caps: normal; font-variant-alte=
rnates: normal; font-variant-numeric: normal; font-variant-east-asian: norm=
al; font-variant-position: normal; font-variant-emoji: normal; vertical-ali=
gn: baseline;" aria-level=3D"2"><div><span style=3D"font-size: 11pt; font-v=
ariant-ligatures: normal; font-variant-caps: normal; font-variant-alternate=
s: normal; font-variant-numeric: normal; font-variant-east-asian: normal; f=
ont-variant-position: normal; font-variant-emoji: normal; vertical-align: b=
aseline; white-space: pre-wrap;">Patches in the Pending State: 136 (13%) [l=
ast week 139 (14%)]</span></div></li><li dir=3D"ltr" style=3D"list-style-ty=
pe: circle; font-size: 11pt; font-family: Consolas, sans-serif; font-varian=
t-ligatures: normal; font-variant-caps: normal; font-variant-alternates: no=
rmal; font-variant-numeric: normal; font-variant-east-asian: normal; font-v=
ariant-position: normal; font-variant-emoji: normal; vertical-align: baseli=
ne;" aria-level=3D"2"><div><a href=3D"https://valkyrie.yocto.io/pub/non-rel=
ease/patchmetrics/" style=3D"text-decoration:none;"><span style=3D"font-siz=
e: 11pt; font-family: Arial, sans-serif; color: rgb(17, 85, 204); font-vari=
ant-ligatures: normal; font-variant-caps: normal; font-variant-alternates: =
normal; font-variant-numeric: normal; font-variant-east-asian: normal; font=
-variant-position: normal; font-variant-emoji: normal; text-decoration-line=
: underline; text-decoration-skip-ink: none; vertical-align: baseline; whit=
e-space: pre-wrap;">https://valkyrie.yocto.io/pub/non-release/patchmetrics/=
</span></a></div></li></ul></ul><br><div><span style=3D"font-size: 11pt; fo=
nt-family: Arial, sans-serif; font-variant-ligatures: normal; font-variant-=
caps: normal; font-variant-alternates: normal; font-variant-numeric: normal=
; font-variant-east-asian: normal; font-variant-position: normal; font-vari=
ant-emoji: normal; vertical-align: baseline; white-space: pre-wrap;">Upcomi=
ng development releases:</span></div><ul style=3D"margin-top:0;margin-botto=
m:0;padding-inline-start:48px;"><li dir=3D"ltr" style=3D"list-style-type: d=
isc; font-size: 11pt; font-family: Arial, sans-serif; font-variant-ligature=
s: normal; font-variant-caps: normal; font-variant-alternates: normal; font=
-variant-numeric: normal; font-variant-east-asian: normal; font-variant-pos=
ition: normal; font-variant-emoji: normal; vertical-align: baseline;" aria-=
level=3D"1"><div><span style=3D"font-size: 11pt; font-variant-ligatures: no=
rmal; font-variant-caps: normal; font-variant-alternates: normal; font-vari=
ant-numeric: normal; font-variant-east-asian: normal; font-variant-position=
: normal; font-variant-emoji: normal; vertical-align: baseline; white-space=
: pre-wrap;">6.1 M3:</span></div></li><ul style=3D"margin-top:0;margin-bott=
om:0;padding-inline-start:48px;"><li dir=3D"ltr" style=3D"list-style-type: =
circle; font-size: 11pt; font-family: Arial, sans-serif; font-variant-ligat=
ures: normal; font-variant-caps: normal; font-variant-alternates: normal; f=
ont-variant-numeric: normal; font-variant-east-asian: normal; font-variant-=
position: normal; font-variant-emoji: normal; vertical-align: baseline;" ar=
ia-level=3D"2"><div><span style=3D"font-size: 11pt; font-variant-ligatures:=
 normal; font-variant-caps: normal; font-variant-alternates: normal; font-v=
ariant-numeric: normal; font-variant-east-asian: normal; font-variant-posit=
ion: normal; font-variant-emoji: normal; vertical-align: baseline; white-sp=
ace: pre-wrap;">Build Date: w/c 2026-08-31</span></div></li><li dir=3D"ltr"=
 style=3D"list-style-type: circle; font-size: 11pt; font-family: Arial, san=
s-serif; font-variant-ligatures: normal; font-variant-caps: normal; font-va=
riant-alternates: normal; font-variant-numeric: normal; font-variant-east-a=
sian: normal; font-variant-position: normal; font-variant-emoji: normal; ve=
rtical-align: baseline;" aria-level=3D"2"><div><span style=3D"font-size: 11=
pt; font-variant-ligatures: normal; font-variant-caps: normal; font-variant=
-alternates: normal; font-variant-numeric: normal; font-variant-east-asian:=
 normal; font-variant-position: normal; font-variant-emoji: normal; vertica=
l-align: baseline; white-space: pre-wrap;">Release Date: w/c 2026-09-14</sp=
an></div></li></ul><li dir=3D"ltr" style=3D"list-style-type: disc; font-siz=
e: 11pt; font-family: Arial, sans-serif; font-variant-ligatures: normal; fo=
nt-variant-caps: normal; font-variant-alternates: normal; font-variant-nume=
ric: normal; font-variant-east-asian: normal; font-variant-position: normal=
; font-variant-emoji: normal; vertical-align: baseline;" aria-level=3D"1"><=
div><span style=3D"font-size: 11pt; font-variant-ligatures: normal; font-va=
riant-caps: normal; font-variant-alternates: normal; font-variant-numeric: =
normal; font-variant-east-asian: normal; font-variant-position: normal; fon=
t-variant-emoji: normal; vertical-align: baseline; white-space: pre-wrap;">=
6.1.0:</span></div></li><ul style=3D"margin-top:0;margin-bottom:0;padding-i=
nline-start:48px;"><li dir=3D"ltr" style=3D"list-style-type: circle; font-s=
ize: 11pt; font-family: Arial, sans-serif; font-variant-ligatures: normal; =
font-variant-caps: normal; font-variant-alternates: normal; font-variant-nu=
meric: normal; font-variant-east-asian: normal; font-variant-position: norm=
al; font-variant-emoji: normal; vertical-align: baseline;" aria-level=3D"2"=
><div><span style=3D"font-size: 11pt; font-variant-ligatures: normal; font-=
variant-caps: normal; font-variant-alternates: normal; font-variant-numeric=
: normal; font-variant-east-asian: normal; font-variant-position: normal; f=
ont-variant-emoji: normal; vertical-align: baseline; white-space: pre-wrap;=
">Build Date (M4): w/c 2026-10-12</span></div></li><li dir=3D"ltr" style=3D=
"list-style-type: circle; font-size: 11pt; font-family: Arial, sans-serif; =
font-variant-ligatures: normal; font-variant-caps: normal; font-variant-alt=
ernates: normal; font-variant-numeric: normal; font-variant-east-asian: nor=
mal; font-variant-position: normal; font-variant-emoji: normal; vertical-al=
ign: baseline;" aria-level=3D"2"><div><span style=3D"font-size: 11pt; font-=
variant-ligatures: normal; font-variant-caps: normal; font-variant-alternat=
es: normal; font-variant-numeric: normal; font-variant-east-asian: normal; =
font-variant-position: normal; font-variant-emoji: normal; vertical-align: =
baseline; white-space: pre-wrap;">Release Date: w/c 2026-11-02</span></div>=
</li></ul></ul><br><div><span style=3D"font-size: 11pt; font-family: Arial,=
 sans-serif; font-variant-ligatures: normal; font-variant-caps: normal; fon=
t-variant-alternates: normal; font-variant-numeric: normal; font-variant-ea=
st-asian: normal; font-variant-position: normal; font-variant-emoji: normal=
; vertical-align: baseline; white-space: pre-wrap;">Upcoming dot releases:<=
/span></div><ul style=3D"margin-top:0;margin-bottom:0;padding-inline-start:=
48px;"><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; fon=
t-family: Arial, sans-serif; color: rgb(34, 34, 34); font-variant-ligatures=
: normal; font-variant-caps: normal; font-variant-alternates: normal; font-=
variant-numeric: normal; font-variant-east-asian: normal; font-variant-posi=
tion: normal; font-variant-emoji: normal; vertical-align: baseline;" aria-l=
evel=3D"1"><div><span style=3D"font-size: 11pt; font-variant-ligatures: nor=
mal; font-variant-caps: normal; font-variant-alternates: normal; font-varia=
nt-numeric: normal; font-variant-east-asian: normal; font-variant-position:=
 normal; font-variant-emoji: normal; vertical-align: baseline; white-space:=
 pre-wrap;">YP 6.0.3 is in review,</span></div></li><ul style=3D"margin-top=
:0;margin-bottom:0;padding-inline-start:48px;"><li dir=3D"ltr" style=3D"lis=
t-style-type: circle; font-size: 11pt; font-family: Arial, sans-serif; colo=
r: rgb(34, 34, 34); font-variant-ligatures: normal; font-variant-caps: norm=
al; font-variant-alternates: normal; font-variant-numeric: normal; font-var=
iant-east-asian: normal; font-variant-position: normal; font-variant-emoji:=
 normal; vertical-align: baseline;" aria-level=3D"2"><div><span style=3D"fo=
nt-size: 11pt; font-variant-ligatures: normal; font-variant-caps: normal; f=
ont-variant-alternates: normal; font-variant-numeric: normal; font-variant-=
east-asian: normal; font-variant-position: normal; font-variant-emoji: norm=
al; vertical-align: baseline; white-space: pre-wrap;">Release Date w/c 2026=
-08-24</span></div></li></ul><li dir=3D"ltr" style=3D"list-style-type: disc=
; font-size: 11pt; font-family: Arial, sans-serif; color: rgb(34, 34, 34); =
font-variant-ligatures: normal; font-variant-caps: normal; font-variant-alt=
ernates: normal; font-variant-numeric: normal; font-variant-east-asian: nor=
mal; font-variant-position: normal; font-variant-emoji: normal; vertical-al=
ign: baseline;" aria-level=3D"1"><div><span style=3D"font-size: 11pt; font-=
variant-ligatures: normal; font-variant-caps: normal; font-variant-alternat=
es: normal; font-variant-numeric: normal; font-variant-east-asian: normal; =
font-variant-position: normal; font-variant-emoji: normal; vertical-align: =
baseline; white-space: pre-wrap;">YP 5.0.20 is in QA.</span></div></li><ul =
style=3D"margin-top:0;margin-bottom:0;padding-inline-start:48px;"><li dir=
=3D"ltr" style=3D"list-style-type: circle; font-size: 11pt; font-family: Ar=
ial, sans-serif; color: rgb(34, 34, 34); font-variant-ligatures: normal; fo=
nt-variant-caps: normal; font-variant-alternates: normal; font-variant-nume=
ric: normal; font-variant-east-asian: normal; font-variant-position: normal=
; font-variant-emoji: normal; vertical-align: baseline;" aria-level=3D"2"><=
div><span style=3D"font-size: 11pt; font-variant-ligatures: normal; font-va=
riant-caps: normal; font-variant-alternates: normal; font-variant-numeric: =
normal; font-variant-east-asian: normal; font-variant-position: normal; fon=
t-variant-emoji: normal; vertical-align: baseline; white-space: pre-wrap;">=
Release Date w/c 2026-08-31</span></div></li></ul><li dir=3D"ltr" style=3D"=
list-style-type: disc; font-size: 11pt; font-family: Arial, sans-serif; col=
or: rgb(34, 34, 34); font-variant-ligatures: normal; font-variant-caps: nor=
mal; font-variant-alternates: normal; font-variant-numeric: normal; font-va=
riant-east-asian: normal; font-variant-position: normal; font-variant-emoji=
: normal; vertical-align: baseline;" aria-level=3D"1"><div><span style=3D"f=
ont-size: 11pt; font-variant-ligatures: normal; font-variant-caps: normal; =
font-variant-alternates: normal; font-variant-numeric: normal; font-variant=
-east-asian: normal; font-variant-position: normal; font-variant-emoji: nor=
mal; vertical-align: baseline; white-space: pre-wrap;">YP 6.0.4</span></div=
></li><ul style=3D"margin-top:0;margin-bottom:0;padding-inline-start:48px;"=
><li dir=3D"ltr" style=3D"list-style-type: circle; font-size: 11pt; font-fa=
mily: Arial, sans-serif; color: rgb(34, 34, 34); font-variant-ligatures: no=
rmal; font-variant-caps: normal; font-variant-alternates: normal; font-vari=
ant-numeric: normal; font-variant-east-asian: normal; font-variant-position=
: normal; font-variant-emoji: normal; vertical-align: baseline;" aria-level=
=3D"2"><div><span style=3D"font-size: 11pt; font-variant-ligatures: normal;=
 font-variant-caps: normal; font-variant-alternates: normal; font-variant-n=
umeric: normal; font-variant-east-asian: normal; font-variant-position: nor=
mal; font-variant-emoji: normal; vertical-align: baseline; white-space: pre=
-wrap;">Build Date w/c 2026-09-28</span></div></li><li dir=3D"ltr" style=3D=
"list-style-type: circle; font-size: 11pt; font-family: Arial, sans-serif; =
color: rgb(34, 34, 34); font-variant-ligatures: normal; font-variant-caps: =
normal; font-variant-alternates: normal; font-variant-numeric: normal; font=
-variant-east-asian: normal; font-variant-position: normal; font-variant-em=
oji: normal; vertical-align: baseline;" aria-level=3D"2"><div><span style=
=3D"font-size: 11pt; font-variant-ligatures: normal; font-variant-caps: nor=
mal; font-variant-alternates: normal; font-variant-numeric: normal; font-va=
riant-east-asian: normal; font-variant-position: normal; font-variant-emoji=
: normal; vertical-align: baseline; white-space: pre-wrap;">Release Date w/=
c 2026-10-12</span></div></li></ul><li dir=3D"ltr" style=3D"list-style-type=
: disc; font-size: 11pt; font-family: Arial, sans-serif; color: rgb(34, 34,=
 34); font-variant-ligatures: normal; font-variant-caps: normal; font-varia=
nt-alternates: normal; font-variant-numeric: normal; font-variant-east-asia=
n: normal; font-variant-position: normal; font-variant-emoji: normal; verti=
cal-align: baseline;" aria-level=3D"1"><div><span style=3D"font-size: 11pt;=
 font-variant-ligatures: normal; font-variant-caps: normal; font-variant-al=
ternates: normal; font-variant-numeric: normal; font-variant-east-asian: no=
rmal; font-variant-position: normal; font-variant-emoji: normal; vertical-a=
lign: baseline; white-space: pre-wrap;">YP 5.0.21</span></div></li><ul styl=
e=3D"margin-top:0;margin-bottom:0;padding-inline-start:48px;"><li dir=3D"lt=
r" style=3D"list-style-type: circle; font-size: 11pt; font-family: Arial, s=
ans-serif; color: rgb(34, 34, 34); font-variant-ligatures: normal; font-var=
iant-caps: normal; font-variant-alternates: normal; font-variant-numeric: n=
ormal; font-variant-east-asian: normal; font-variant-position: normal; font=
-variant-emoji: normal; vertical-align: baseline;" aria-level=3D"2"><div><s=
pan style=3D"font-size: 11pt; font-variant-ligatures: normal; font-variant-=
caps: normal; font-variant-alternates: normal; font-variant-numeric: normal=
; font-variant-east-asian: normal; font-variant-position: normal; font-vari=
ant-emoji: normal; vertical-align: baseline; white-space: pre-wrap;">Build =
Date w/c 2026-10-05</span></div></li><li dir=3D"ltr" style=3D"list-style-ty=
pe: circle; font-size: 11pt; font-family: Arial, sans-serif; color: rgb(34,=
 34, 34); font-variant-ligatures: normal; font-variant-caps: normal; font-v=
ariant-alternates: normal; font-variant-numeric: normal; font-variant-east-=
asian: normal; font-variant-position: normal; font-variant-emoji: normal; v=
ertical-align: baseline;" aria-level=3D"2"><div><span style=3D"font-size: 1=
1pt; font-variant-ligatures: normal; font-variant-caps: normal; font-varian=
t-alternates: normal; font-variant-numeric: normal; font-variant-east-asian=
: normal; font-variant-position: normal; font-variant-emoji: normal; vertic=
al-align: baseline; white-space: pre-wrap;">Release Date w/c 2026-10-19</sp=
an></div></li></ul><li dir=3D"ltr" style=3D"list-style-type: disc; font-siz=
e: 11pt; font-family: Arial, sans-serif; font-variant-ligatures: normal; fo=
nt-variant-caps: normal; font-variant-alternates: normal; font-variant-nume=
ric: normal; font-variant-east-asian: normal; font-variant-position: normal=
; font-variant-emoji: normal; vertical-align: baseline;" aria-level=3D"1"><=
div><span style=3D"font-size: 11pt; font-variant-ligatures: normal; font-va=
riant-caps: normal; font-variant-alternates: normal; font-variant-numeric: =
normal; font-variant-east-asian: normal; font-variant-position: normal; fon=
t-variant-emoji: normal; vertical-align: baseline; white-space: pre-wrap;">=
For future release dates, see </span><a href=3D"https://wiki.yoctoproject.o=
rg/wiki/Release_calendar" style=3D"text-decoration:none;"><span style=3D"fo=
nt-size: 11pt; color: rgb(17, 85, 204); font-variant-ligatures: normal; fon=
t-variant-caps: normal; font-variant-alternates: normal; font-variant-numer=
ic: normal; font-variant-east-asian: normal; font-variant-position: normal;=
 font-variant-emoji: normal; text-decoration-line: underline; text-decorati=
on-skip-ink: none; vertical-align: baseline; white-space: pre-wrap;">https:=
//wiki.yoctoproject.org/wiki/Release_calendar</span></a></div></li></ul><br=
><div><span style=3D"font-size: 11pt; font-family: Arial, sans-serif; font-=
variant-ligatures: normal; font-variant-caps: normal; font-variant-alternat=
es: normal; font-variant-numeric: normal; font-variant-east-asian: normal; =
font-variant-position: normal; font-variant-emoji: normal; vertical-align: =
baseline; white-space: pre-wrap;">The Yocto Project=E2=80=99s technical gov=
ernance is through its Technical Steering Committee, more information is av=
ailable at:</span></div><div><a href=3D"https://wiki.yoctoproject.org/wiki/=
TSC" style=3D"text-decoration:none;"><span style=3D"font-size: 11pt; font-f=
amily: Arial, sans-serif; color: rgb(17, 85, 204); font-variant-ligatures: =
normal; font-variant-caps: normal; font-variant-alternates: normal; font-va=
riant-numeric: normal; font-variant-east-asian: normal; font-variant-positi=
on: normal; font-variant-emoji: normal; text-decoration-line: underline; te=
xt-decoration-skip-ink: none; vertical-align: baseline; white-space: pre-wr=
ap;">https://wiki.yoctoproject.org/wiki/TSC</span></a></div><br><div><span =
style=3D"font-size: 11pt; font-family: Arial, sans-serif; font-variant-liga=
tures: normal; font-variant-caps: normal; font-variant-alternates: normal; =
font-variant-numeric: normal; font-variant-east-asian: normal; font-variant=
-position: normal; font-variant-emoji: normal; vertical-align: baseline; wh=
ite-space: pre-wrap;">The Status reports are stored on the wiki at: </span>=
<a href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status" style=3D"text-=
decoration:none;"><span style=3D"font-size: 11pt; font-family: Arial, sans-=
serif; color: rgb(17, 85, 204); font-variant-ligatures: normal; font-varian=
t-caps: normal; font-variant-alternates: normal; font-variant-numeric: norm=
al; font-variant-east-asian: normal; font-variant-position: normal; font-va=
riant-emoji: normal; text-decoration-line: underline; text-decoration-skip-=
ink: none; vertical-align: baseline; white-space: pre-wrap;">https://wiki.y=
octoproject.org/wiki/Weekly_Status</span></a></div><br><div><span style=3D"=
font-size: 11pt; font-family: Arial, sans-serif; font-variant-ligatures: no=
rmal; font-variant-caps: normal; font-variant-alternates: normal; font-vari=
ant-numeric: normal; font-variant-east-asian: normal; font-variant-position=
: normal; font-variant-emoji: normal; vertical-align: baseline; white-space=
: pre-wrap;">[If anyone has suggestions for other information you=E2=80=99d=
 like to see on this weekly status update, let us know!]</span></div></pre>=
<div><span></span></div></body></html>

--=-F/EWUXt2taskR2Wy8jD4--

