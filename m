Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2755BCD98E4
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 14:51:49 +0000 (UTC)
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156244.1781621504841608168
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 07:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=UhyJZ1oS;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=Uj9P4UAh;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D3AC61400175;
	Tue, 16 Jun 2026 10:51:43 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-11.internal (MEProxy); Tue, 16 Jun 2026 10:51:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1781621503; x=1781707903; bh=EO7FJidWbXIzZmzayBPCMCRQzIGBOgVC
	3Zp4CJ6FS1g=; b=UhyJZ1oS62zBjsgfSkxs1OmvCjdmc7LrNXbXE88tZE9xv99W
	o/cT5iHmQF3TKJD8L/JOxRtl2YDXpHApr9jPjMPf+XjDBBjMWuQPv8Bu/6Y3l7EJ
	sgOpwKJCMKaFhL6i+7UP93cVo4OKIJRsRRJTeAFfLd0oV5U/PYmob5R9IGbbECEe
	lAx7IDyCewCfbdoKNGMuqak0cW86l0YHX2LEfp7F2FMBvfZm1xNC78c7sJiCh1Rr
	fXI82gsAiCUxLS3cKwEjjw6p+rpJpMXtNEBaXav4Uxb7GXvRuW4hIi2rEIjhxsiN
	RPxmu4jbiexXTECO9xWr7WVVLlQ9SepuYFM3dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781621503; x=
	1781707903; bh=EO7FJidWbXIzZmzayBPCMCRQzIGBOgVC3Zp4CJ6FS1g=; b=U
	j9P4UAhNIryR2nYRCfgOwdkt2ePqYEdWsCaPDv5023MHs1XUCAtVLpCJm+xwssFZ
	RXL0JFN1G27rOY5O0wvtboWUgT19yNd0e2XAvZXmJZ+SgGYVM0Z+aW949swTw3U2
	xJPLrDmLoBHmN6isQzpzELL2tHCMcUVMD0txtdTI4KoM5qOjlHpejpBcvN7ljFra
	Cnk5ozoEFvNEggqp/C+CT+yIQbgF2mpJ35TQQmE85lNgnU1NaxPOzU/uzE4+4ZS7
	FcCgSSCCyohMlxCJMLY5SXeVcq2K2GV/GExIEaDZAD2vF0bSBuG8OJLq/5o01Sn8
	92JWFvFzMOiD3ILSSBBiA==
X-ME-Sender: <xms:_2IxarQGjTZet1WDXjVtLIyp_AwBaxCSNw1w0dqC9vf5lL9SMbrIFw>
    <xme:_2IxanlmkA86D1SjI8BQIrMldUGxTwk4gp4Z_8_k_FLJH31LaoY7UZt7XY3pM5qUf
    wY7SoIImqZZokK5a-NfXXatT978YCzesAMkUW9Tvxc6lYsHZbp5>
X-ME-Proxy-Cause: dmFkZTE4BOcdog/2FcJtwE4TOFyIat9epgjicye3ZRZ8rGloWd0VH7PA2HgRYTp8emZ4kE
    hc9RJ8S9IsrKy4OMKruJA+JaYxXMbLZ8xrCyQwZLKjm8TwXjm1jFeE7k3W5mnZuSdIhAlG
    y8m5Ke2gCVe8kJUkMlAvTXskqAGkt0ZzOWW8kCpLN5lYVlSa+vlRV+brUwIetdOFTchrOj
    PQBJiFV79e4zFVO8mVnBTZ5CT55BZ0e9nqteuhKOju5aoL0Sp2XdEyBPi01EQJdJ87ksO8
    JfJIBEql31UHvaDs5FBtnsik840r/xulkkLObxU8e/b2eCdjNMhbJ0yuuZhJ9PabpfqxVV
    L7OGDK4Zj/9ioygvkxVEDW/Vx27/A7j69Dyz78AS6q5j0Zs2i8jZWZnRYV81DX7DFemMei
    Yxr1C5oc3ZcPNC7nZq7iGTf80SMbjyrJ6huXRIftBYGTOG6tmhzbzbNrFjoxGZllew+xDb
    aT0IpscdWRlKHXdIzhateU55UMrOkzbiyo+SoHjpBLk1+Z092EiqjUF4RaI6hDUSSjUOTk
    oFWtLK1PV8zGjjQCir3boTlXvu4bQrCoxPol0CqPM6WvfoUDHcUFxW9VVHZeX/IsHKJVXq
    JXp3b12QX170gb3LLG2MGlbTfVz+31b1ku60hInyGAv86d0wJNns+wpsEinQ
X-ME-Proxy: <xmx:_2Ixak-Lgr3nfu-NjKD3YD8yCljYQM-89RZus4ns-RDRk0KAsn-oWA>
    <xmx:_2IxajkxvwP9IdP8lp7VeY9_McZ9pyviXqwLXfRxxugkhjB-MAGdXw>
    <xmx:_2IxaiW-P9CkCqDvkpS6z2PfixqJ_b-x9-gCR86Vh_WQMxcKwoorNw>
    <xmx:_2IxagFettXltYMRpl4SBdMNjkHWeobrAvDhyKEtwaKO30MJ9IDP0g>
    <xmx:_2IxapLhCaig5L7s8tKSc1OQ7ofaUnmpCoMw2AszvZjtyxZBaVE852iP>
Feedback-ID: i51494658:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 87FCC216009D; Tue, 16 Jun 2026 10:51:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 16 Jun 2026 15:50:51 +0100
From: "Paul Barker" <paul@pbarker.dev>
To: yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org,
 yocto-status@lists.yoctoproject.org
Message-Id: <79acaf1c-a414-4a5e-aee8-9ad4b9e0631b@app.fastmail.com>
Subject: Yocto Project Status 16 June 2026 (WW25)
Content-Type: multipart/alternative;
 boundary=e373740459821357e909c2b4c3c9562cbc3aa4cd
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Tue, 16 Jun 2026 14:51:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/126

--e373740459821357e909c2b4c3c9562cbc3aa4cd
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 6.1 M2
Next Deadline: YP 6.1 M2: w/c 2026-07-20

Next Team Meetings:
 =E2=80=A2 Bug Triage meeting - Thursday 18th June 7:30am PDT (_https://=
zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09_)
 =E2=80=A2 Weekly Project Engineering Sync  - Tuesday 16th June. 8am PDT=
 (_https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09__)=
_ <https://zoom.us/j/990892712>
 =E2=80=A2 Yocto Project Patch Review - Thursday 18th June 10am GMT and =
Monday 22nd June 9am PDT (_https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp=
9SjEonaTaONwTb6iWry4Eb.1_)

Project data dashboard: _https://dashboard.yoctoproject.org/_=20

Key Status/Updates:
 =E2=80=A2 YP 6.0.1 is due for release
 =E2=80=A2 YP 6.1 M1 is in QA
 =E2=80=A2 We=E2=80=99re working through the backlog of patches, the ban=
dwidth for changes needing in depth review/feedback continues to be a ch=
allenge.
 =E2=80=A2 An initial round of patches to remove shell=3DTrue subprocess=
 usage in OE-Core have now merged
 =E2=80=A2 AUH is now running daily in incremental mode so we can avoid =
large batches of upgrade patches and spread them out as well as reacting=
 more quickly to new upstream releases. We=E2=80=99re still tweaking som=
e of the behaviours and reporting but if anyone has feedback/concerns, l=
et us know.
 =E2=80=A2 We=E2=80=99ve deliberately aimed to get up to date with the A=
UH success patches to better evaluate the ongoing upgrades.
 =E2=80=A2 We have merged support for `devtool upgrade --stable` and the=
 upstream-stable-release-point bbclass. We hope to use this to track ups=
tream projects with known good stable release series, but we need input =
and discussion on what the criteria should be. Please participate in the=
 discussion on the OE-Architecture list: _https://lists.openembedded.org=
/g/openembedded-architecture/topic/119437109_
 =E2=80=A2 Intermittent build failures continue to be problematic and un=
changed from last week:
   =E2=80=A2 several qemu =E2=80=98hang=E2=80=99 type issues - the qemu =
upgrade merged, at least some issues still occur
   =E2=80=A2 sometimes yocto-check-layer is showing checksum mismatch is=
sues
   =E2=80=A2 siggen reset issues (=E2=80=9CResourceWarning: unclosed tra=
nsport=E2=80=9D)
   =E2=80=A2 groff build race issues
   =E2=80=A2 intermittent ptest failures in many recipes (python3-click =
was tweaked)
 =E2=80=A2 We would like to know what people are planning to work on for=
 Yocto Project 6.1 and beyond. We have a roadmap document in Google Docs=
: _https://docs.google.com/document/d/12xgAzSjDj5zVlo4eQIbiv1s3QMjtBTCvB=
FY3_T7OPto_

Want to contribute? We would appreciate help with the following areas:
 =E2=80=A2 We have several open issues for pseudo and limited maintainer=
 time to work on them. Help from someone familiar with systems programmi=
ng in C would be greatly appreciated. _https://bugzilla.yoctoproject.org=
/buglist.cgi?list_id=3D661406&priority=3DHigh&priority=3DMedium%2B&produ=
ct=3DPseudo&query_format=3Dadvanced&resolution=3D---_
 =E2=80=A2 There are a large number of intermittent failures on our auto=
builder, any help with investigating, reproducing or solving these issue=
s would be welcome! _https://valkyrie.yocto.io/pub/non-release/abint/_
 =E2=80=A2 Many recipes in openembedded-core would benefit from a new re=
cipe maintainer. Please look at _https://git.openembedded.org/openembedd=
ed-core/tree/meta/conf/distro/include/maintainers.inc_ and see if you ca=
n adopt any of the unassigned recipes.
 =E2=80=A2 For more ways to contribute, see _https://docs.google.com/doc=
ument/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9owFuCWbzgjOk/edit?usp=3Dsharing_

New to the project?
 =E2=80=A2 We have a list of issues we think are good places to start co=
ntributing: _https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3D=
NEWCOMER_

Tracking Metrics:
 =E2=80=A2 WDD 2590 (last week 2655) (_https://wiki.yoctoproject.org/cha=
rts/combo.html_)
 =E2=80=A2 OE-Core/Poky Patch Metrics
   =E2=80=A2 Total patches found: 1061 (last week 1056)
   =E2=80=A2 Patches in the Pending State: 146 (14%) [last week 147 (14%=
)]
   =E2=80=A2 _https://valkyrie.yocto.io/pub/non-release/patchmetrics/_

Upcoming development releases:
 =E2=80=A2 6.1 M1:=20
   =E2=80=A2 Build Date: w/c 2026-06-08
   =E2=80=A2 Release Date: w/c 2026-06-22
 =E2=80=A2 6.1 M2:
   =E2=80=A2 Build Date: w/c 2026-07-20
   =E2=80=A2 Release Date: w/c 2026-08-03
 =E2=80=A2 6.1 M3:
   =E2=80=A2 Build Date: w/c 2026-08-31
   =E2=80=A2 Release Date: w/c 2026-09-14
 =E2=80=A2 6.1.0:
   =E2=80=A2 Build Date (M4): w/c 2026-10-12
   =E2=80=A2 Release Date: w/c 2026-11-02

Upcoming dot releases:
 =E2=80=A2 YP 6.0.1 is due to release
 =E2=80=A2 YP 6.0.2
   =E2=80=A2 Build Date w/c 2026-06-23
   =E2=80=A2 Release Date w/c 2026-07-06
 =E2=80=A2 YP 5.0.19
   =E2=80=A2 Build Date w/c 2026-06-30
   =E2=80=A2 Release Date w/c 2026-07-13
 =E2=80=A2 For future release dates, see _https://wiki.yoctoproject.org/=
wiki/Release_calendar_

The Yocto Project=E2=80=99s technical governance is through its Technica=
l Steering Committee, more information is available at:
_https://wiki.yoctoproject.org/wiki/TSC_

The Status reports are now stored on the wiki at: _https://wiki.yoctopro=
ject.org/wiki/Weekly_Status_

[If anyone has suggestions for other information you=E2=80=99d like to s=
ee on this weekly status update, let us know!]

Paul Barker

--e373740459821357e909c2b4c3c9562cbc3aa4cd
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title></head><body><div><span class=3D=
"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D=
"background-color:transparent;"></span>Current Dev Position: YP 6.1 M2</=
span></div><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><spa=
n class=3D"highlight" style=3D"background-color:transparent;"></span>Nex=
t Deadline: YP 6.1 M2: w/c 2026-07-20</span></div><div><br></div><div><s=
pan class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlig=
ht" style=3D"background-color:transparent;"></span>Next Team Meetings:</=
span></div><ul><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0=
);"><span class=3D"highlight" style=3D"background-color:transparent;"></=
span>Bug Triage meeting - Thursday 18th June 7:30am PDT (</span><a href=3D=
"https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09"><sp=
an class=3D"color" style=3D"color:rgb(17, 85, 204);"><span class=3D"high=
light" style=3D"background-color:transparent;"></span><u>https://zoom.us=
/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</u></span></a><span =
class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" =
style=3D"background-color:transparent;"></span>)</span></div></li><li><d=
iv><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"hi=
ghlight" style=3D"background-color:transparent;"></span>Weekly Project E=
ngineering Sync&nbsp; - Tuesday 16th June. 8am PDT (</span><a href=3D"ht=
tps://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09"><span =
class=3D"color" style=3D"color:rgb(17, 85, 204);"><span class=3D"highlig=
ht" style=3D"background-color:transparent;"></span><u>https://zoom.us/j/=
990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</u></span></a><a href=3D=
"https://zoom.us/j/990892712"><span class=3D"color" style=3D"color:rgb(1=
7, 85, 204);"><span class=3D"highlight" style=3D"background-color:transp=
arent;"></span><u>)</u></span></a></div></li><li><div><span class=3D"col=
or" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"bac=
kground-color:transparent;"></span>Yocto Project Patch Review - Thursday=
 18th June 10am GMT and Monday 22nd June 9am PDT (</span><a href=3D"http=
s://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1"><span=
 class=3D"color" style=3D"color:rgb(17, 85, 204);"><span class=3D"highli=
ght" style=3D"background-color:transparent;"></span><u>https://zoom.us/j=
/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1</u></span></a><span=
 class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight"=
 style=3D"background-color:transparent;"></span>)</span></div></li></ul>=
<div><br></div><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);">=
<span class=3D"highlight" style=3D"background-color:transparent;"></span=
>Project data dashboard: </span><a href=3D"https://dashboard.yoctoprojec=
t.org/"><span class=3D"color" style=3D"color:rgb(17, 85, 204);"><span cl=
ass=3D"highlight" style=3D"background-color:transparent;"></span><u>http=
s://dashboard.yoctoproject.org/</u></span></a><span class=3D"color" styl=
e=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-=
color:transparent;"></span>&nbsp;</span></div><div><br></div><div><span =
class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" =
style=3D"background-color:transparent;"></span>Key Status/Updates:</span=
></div><ul><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);">=
<span class=3D"highlight" style=3D"background-color:transparent;"></span=
>YP 6.0.1 is due for release</span></div></li><li><div><span class=3D"co=
lor" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"ba=
ckground-color:transparent;"></span>YP 6.1 M1 is in QA</span></div></li>=
<li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=
=3D"highlight" style=3D"background-color:transparent;"></span>We=E2=80=99=
re working through the backlog of patches, the bandwidth for changes nee=
ding in depth review/feedback continues to be a challenge.</span></div><=
/li><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span c=
lass=3D"highlight" style=3D"background-color:transparent;"></span>An ini=
tial round of patches to remove shell=3DTrue subprocess usage in OE-Core=
 have now merged</span></div></li><li><div><span class=3D"color" style=3D=
"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-colo=
r:transparent;"></span>AUH is now running daily in incremental mode so w=
e can avoid large batches of upgrade patches and spread them out as well=
 as reacting more quickly to new upstream releases. We=E2=80=99re still =
tweaking some of the behaviours and reporting but if anyone has feedback=
/concerns, let us know.</span></div></li><li><div><span class=3D"color" =
style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"backgro=
und-color:transparent;"></span>We=E2=80=99ve deliberately aimed to get u=
p to date with the AUH success patches to better evaluate the ongoing up=
grades.</span></div></li><li><div><span class=3D"color" style=3D"color:r=
gb(0, 0, 0);"><span class=3D"highlight" style=3D"background-color:transp=
arent;"></span>We have merged support for `devtool upgrade --stable` and=
 the upstream-stable-release-point bbclass. We hope to use this to track=
 upstream projects with known good stable release series, but we need in=
put and discussion on what the criteria should be. Please participate in=
 the discussion on the OE-Architecture list: </span><a href=3D"https://l=
ists.openembedded.org/g/openembedded-architecture/topic/119437109"><span=
 class=3D"color" style=3D"color:rgb(17, 85, 204);"><span class=3D"highli=
ght" style=3D"background-color:transparent;"></span><u>https://lists.ope=
nembedded.org/g/openembedded-architecture/topic/119437109</u></span></a>=
</div></li><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);">=
<span class=3D"highlight" style=3D"background-color:transparent;"></span=
>Intermittent build failures continue to be problematic and unchanged fr=
om last week:</span></div></li><ul><li><div><span class=3D"color" style=3D=
"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-colo=
r:transparent;"></span>several qemu =E2=80=98hang=E2=80=99 type issues -=
 the qemu upgrade merged, at least some issues still occur</span></div><=
/li><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span c=
lass=3D"highlight" style=3D"background-color:transparent;"></span>someti=
mes yocto-check-layer is showing checksum mismatch issues</span></div></=
li><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span cl=
ass=3D"highlight" style=3D"background-color:transparent;"></span>siggen =
reset issues (=E2=80=9CResourceWarning: unclosed transport=E2=80=9D)</sp=
an></div></li><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0)=
;"><span class=3D"highlight" style=3D"background-color:transparent;"></s=
pan>groff build race issues</span></div></li><li><div><span class=3D"col=
or" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"bac=
kground-color:transparent;"></span>intermittent ptest failures in many r=
ecipes (python3-click was tweaked)</span></div></li></ul><li><div><span =
class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" =
style=3D"background-color:transparent;"></span>We would like to know wha=
t people are planning to work on for Yocto Project 6.1 and beyond. We ha=
ve a roadmap document in Google Docs: </span><a href=3D"https://docs.goo=
gle.com/document/d/12xgAzSjDj5zVlo4eQIbiv1s3QMjtBTCvBFY3_T7OPto"><span c=
lass=3D"color" style=3D"color:rgb(17, 85, 204);"><span class=3D"highligh=
t" style=3D"background-color:transparent;"></span><u>https://docs.google=
.com/document/d/12xgAzSjDj5zVlo4eQIbiv1s3QMjtBTCvBFY3_T7OPto</u></span><=
/a></div></li></ul><div><br></div><div><span class=3D"color" style=3D"co=
lor:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-color:t=
ransparent;"></span>Want to contribute? We would appreciate help with th=
e following areas:</span></div><ul><li><div><span class=3D"color" style=3D=
"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-colo=
r:transparent;"></span>We have several open issues for pseudo and limite=
d maintainer time to work on them. Help from someone familiar with syste=
ms programming in C would be greatly appreciated. </span><a href=3D"http=
s://bugzilla.yoctoproject.org/buglist.cgi?list_id=3D661406&amp;priority=3D=
High&amp;priority=3DMedium%2B&amp;product=3DPseudo&amp;query_format=3Dad=
vanced&amp;resolution=3D---"><span class=3D"color" style=3D"color:rgb(17=
, 85, 204);"><span class=3D"highlight" style=3D"background-color:transpa=
rent;"></span><u>https://bugzilla.yoctoproject.org/buglist.cgi?list_id=3D=
661406&amp;priority=3DHigh&amp;priority=3DMedium%2B&amp;product=3DPseudo=
&amp;query_format=3Dadvanced&amp;resolution=3D---</u></span></a></div></=
li><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span cl=
ass=3D"highlight" style=3D"background-color:transparent;"></span>There a=
re a large number of intermittent failures on our autobuilder, any help =
with investigating, reproducing or solving these issues would be welcome=
! </span><a href=3D"https://valkyrie.yocto.io/pub/non-release/abint/"><s=
pan class=3D"color" style=3D"color:rgb(17, 85, 204);"><span class=3D"hig=
hlight" style=3D"background-color:transparent;"></span><u>https://valkyr=
ie.yocto.io/pub/non-release/abint/</u></span></a></div></li><li><div><sp=
an class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highligh=
t" style=3D"background-color:transparent;"></span>Many recipes in openem=
bedded-core would benefit from a new recipe maintainer. Please look at <=
/span><a href=3D"https://git.openembedded.org/openembedded-core/tree/met=
a/conf/distro/include/maintainers.inc"><span class=3D"color" style=3D"co=
lor:rgb(17, 85, 204);"><span class=3D"highlight" style=3D"background-col=
or:transparent;"></span><u>https://git.openembedded.org/openembedded-cor=
e/tree/meta/conf/distro/include/maintainers.inc</u></span></a><span clas=
s=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" styl=
e=3D"background-color:transparent;"></span> and see if you can adopt any=
 of the unassigned recipes.</span></div></li><li><div><span class=3D"col=
or" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"bac=
kground-color:transparent;"></span>For more ways to contribute, see </sp=
an><a href=3D"https://docs.google.com/document/d/18oxKWxLorfF813h82mK6yK=
TIHeBp_-9owFuCWbzgjOk/edit?usp=3Dsharing"><span class=3D"color" style=3D=
"color:rgb(17, 85, 204);"><span class=3D"highlight" style=3D"background-=
color:transparent;"></span><u>https://docs.google.com/document/d/18oxKWx=
LorfF813h82mK6yKTIHeBp_-9owFuCWbzgjOk/edit?usp=3Dsharing</u></span></a><=
/div></li></ul><div><br></div><div><span class=3D"color" style=3D"color:=
rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-color:trans=
parent;"></span>New to the project?</span></div><ul><li><div><span class=
=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=
=3D"background-color:transparent;"></span>We have a list of issues we th=
ink are good places to start contributing: </span><a href=3D"https://bug=
zilla.yoctoproject.org/buglist.cgi?quicksearch=3DNEWCOMER"><span class=3D=
"color" style=3D"color:rgb(17, 85, 204);"><span class=3D"highlight" styl=
e=3D"background-color:transparent;"></span><u>https://bugzilla.yoctoproj=
ect.org/buglist.cgi?quicksearch=3DNEWCOMER</u></span></a></div></li></ul=
><div><br></div><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"=
><span class=3D"highlight" style=3D"background-color:transparent;"></spa=
n>Tracking Metrics:</span></div><ul><li><div><span class=3D"color" style=
=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-c=
olor:transparent;"></span>WDD 2590 (last week 2655) </span><span class=3D=
"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D=
"background-color:transparent;"></span>(</span><a href=3D"https://wiki.y=
octoproject.org/charts/combo.html"><span class=3D"color" style=3D"color:=
rgb(17, 85, 204);"><span class=3D"highlight" style=3D"background-color:t=
ransparent;"></span><u>https://wiki.yoctoproject.org/charts/combo.html</=
u></span></a><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span c=
lass=3D"highlight" style=3D"background-color:transparent;"></span>)</spa=
n></div></li><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);=
"><span class=3D"highlight" style=3D"background-color:transparent;"></sp=
an>OE-Core/Poky Patch Metrics</span></div></li><ul><li><div><span class=3D=
"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D=
"background-color:transparent;"></span>Total patches found: 1061 (last w=
eek 1056)</span></div></li><li><div><span class=3D"color" style=3D"color=
:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-color:tran=
sparent;"></span>Patches in the Pending State: 146 (14%) [last week 147 =
(14%)]</span></div></li><li><div><a href=3D"https://valkyrie.yocto.io/pu=
b/non-release/patchmetrics/"><span class=3D"color" style=3D"color:rgb(17=
, 85, 204);"><span class=3D"highlight" style=3D"background-color:transpa=
rent;"></span><u>https://valkyrie.yocto.io/pub/non-release/patchmetrics/=
</u></span></a></div></li></ul></ul><div><br></div><div><span class=3D"c=
olor" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"b=
ackground-color:transparent;"></span>Upcoming development releases:</spa=
n></div><ul><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"=
><span class=3D"highlight" style=3D"background-color:transparent;"></spa=
n>6.1 M1:&nbsp;</span></div></li><ul><li><div><span class=3D"color" styl=
e=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-=
color:transparent;"></span>Build Date: w/c 2026-06-08</span></div></li><=
li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D=
"highlight" style=3D"background-color:transparent;"></span>Release Date:=
 w/c 2026-06-22</span></div></li></ul><li><div><span class=3D"color" sty=
le=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background=
-color:transparent;"></span>6.1 M2:</span></div></li><ul><li><div><span =
class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" =
style=3D"background-color:transparent;"></span>Build Date: w/c 2026-07-2=
0</span></div></li><li><div><span class=3D"color" style=3D"color:rgb(0, =
0, 0);"><span class=3D"highlight" style=3D"background-color:transparent;=
"></span>Release Date: w/c 2026-08-03</span></div></li></ul><li><div><sp=
an class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highligh=
t" style=3D"background-color:transparent;"></span>6.1 M3:</span></div></=
li><ul><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><spa=
n class=3D"highlight" style=3D"background-color:transparent;"></span>Bui=
ld Date: w/c 2026-08-31</span></div></li><li><div><span class=3D"color" =
style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"backgro=
und-color:transparent;"></span>Release Date: w/c 2026-09-14</span></div>=
</li></ul><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><=
span class=3D"highlight" style=3D"background-color:transparent;"></span>=
6.1.0:</span></div></li><ul><li><div><span class=3D"color" style=3D"colo=
r:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-color:tra=
nsparent;"></span>Build Date (M4): w/c 2026-10-12</span></div></li><li><=
div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"h=
ighlight" style=3D"background-color:transparent;"></span>Release Date: w=
/c 2026-11-02</span></div></li></ul></ul><div><br></div><div><span class=
=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=
=3D"background-color:transparent;"></span>Upcoming dot releases:</span><=
/div><ul><li><div><span class=3D"color" style=3D"color:rgb(34, 34, 34);"=
><span class=3D"highlight" style=3D"background-color:rgb(255, 255, 255);=
"></span>YP 6.0.1 is due to release</span></div></li><li><div><span clas=
s=3D"color" style=3D"color:rgb(34, 34, 34);"><span class=3D"highlight" s=
tyle=3D"background-color:rgb(255, 255, 255);"></span>YP 6.0.2</span></di=
v></li><ul><li><div><span class=3D"color" style=3D"color:rgb(34, 34, 34)=
;"><span class=3D"highlight" style=3D"background-color:rgb(255, 255, 255=
);"></span>Build Date w/c 2026-06-23</span></div></li><li><div><span cla=
ss=3D"color" style=3D"color:rgb(34, 34, 34);"><span class=3D"highlight" =
style=3D"background-color:rgb(255, 255, 255);"></span>Release Date w/c 2=
026-07-06</span></div></li></ul><li><div><span class=3D"color" style=3D"=
color:rgb(34, 34, 34);"><span class=3D"highlight" style=3D"background-co=
lor:rgb(255, 255, 255);"></span>YP 5.0.19</span></div></li><ul><li><div>=
<span class=3D"color" style=3D"color:rgb(34, 34, 34);"><span class=3D"hi=
ghlight" style=3D"background-color:rgb(255, 255, 255);"></span>Build Dat=
e w/c 2026-06-30</span></div></li><li><div><span class=3D"color" style=3D=
"color:rgb(34, 34, 34);"><span class=3D"highlight" style=3D"background-c=
olor:rgb(255, 255, 255);"></span>Release Date w/c 2026-07-13</span></div=
></li></ul><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);">=
<span class=3D"highlight" style=3D"background-color:transparent;"></span=
>For future release dates, see </span><a href=3D"https://wiki.yoctoproje=
ct.org/wiki/Release_calendar"><span class=3D"color" style=3D"color:rgb(1=
7, 85, 204);"><span class=3D"highlight" style=3D"background-color:transp=
arent;"></span><u>https://wiki.yoctoproject.org/wiki/Release_calendar</u=
></span></a></div></li></ul><div><br></div><div><span class=3D"color" st=
yle=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"backgroun=
d-color:transparent;"></span>The Yocto Project=E2=80=99s technical gover=
nance is through its Technical Steering Committee, more information is a=
vailable at:</span></div><div><a href=3D"https://wiki.yoctoproject.org/w=
iki/TSC"><span class=3D"color" style=3D"color:rgb(17, 85, 204);"><span c=
lass=3D"highlight" style=3D"background-color:transparent;"></span><u>htt=
ps://wiki.yoctoproject.org/wiki/TSC</u></span></a></div><div><br></div><=
div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"h=
ighlight" style=3D"background-color:transparent;"></span>The Status repo=
rts are now stored on the wiki at: </span><a href=3D"https://wiki.yoctop=
roject.org/wiki/Weekly_Status"><span class=3D"color" style=3D"color:rgb(=
17, 85, 204);"><span class=3D"highlight" style=3D"background-color:trans=
parent;"></span><u>https://wiki.yoctoproject.org/wiki/Weekly_Status</u><=
/span></a></div><div><br></div><div><span class=3D"color" style=3D"color=
:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-color:tran=
sparent;"></span>[If anyone has suggestions for other information you=E2=
=80=99d like to see on this weekly status update, let us know!]</span></=
div><div><br></div><div id=3D"sig133588112"><div class=3D"signature">Pau=
l Barker</div></div><div><br></div></body></html>
--e373740459821357e909c2b4c3c9562cbc3aa4cd--

