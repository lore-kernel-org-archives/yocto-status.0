Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBDA0CD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 08:24:32 +0000 (UTC)
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.74694.1780993464531357349
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 01:24:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=kNthMOKn;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=U9XGX63x;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.149, mailfrom: paul@pbarker.dev)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 89416EC021F;
	Tue,  9 Jun 2026 04:24:23 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-11.internal (MEProxy); Tue, 09 Jun 2026 04:24:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1780993463; x=1781079863; bh=vVnXq+NnJ3dzyqTiI00TIbueeCMGIckb
	y+q9yP2M1KE=; b=kNthMOKnvDHH/sycU3RfbOIR2qNYTu4eGAIkKXThn77OU/NR
	66+U0kroaivPfCrEyXBSRqA3z67uV7Xj7QjSO+xeviV8GVSaiJjMu+UNuHRABlwm
	88bNRu8ixRj92Ddb60XAvoVAKS6kMgMh4dGovc4bTKFTnfG5Vp7w3WE8wLtCvhg/
	fakOdNUXOJey9+dq5jAy87Rwt+I6y2DtoRJlB4tsgTrEp6CEug4N+SCKMcFFfZ38
	Echyu2URsu6pHqyDpjlkRTFwkXwXVP9B8ZwOnJg9cbOwX2unxbL1nglHx4yspQiM
	x0MERRUGvSQzyFboOCJ5E9Nd9xmx7/PED67pPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780993463; x=
	1781079863; bh=vVnXq+NnJ3dzyqTiI00TIbueeCMGIckby+q9yP2M1KE=; b=U
	9XGX63xcLmObjRIhh/WyDuQTz7kBZI7GfW9JTFQS7yOKAyXZBz+fcLM/s6zM5DrK
	sOL485Cfp9jzt/zNGbzz7PJOP1AVCp44bm+hD02fDZtQL3HuokLDVwOqYYHTqXFn
	fRPpAatmt8mCGZV+oJtbYisJZ75XyxBI26IG3Pk0Tl0q39OUpJ7Wu0nbIDiQsrdQ
	uzt3ui0kX4AehPrkHpEyMXGbPw6bUpKQYApOeeyKD1mtXRHjFD05go1hhC3hTuhS
	hKVi22J1XR3x/aSmWDBdK4+UO0aYZQEeu1nxtU4Sn2O50Q8BZy5U7D8Gw4QCWgQ+
	KtR1lXr4NlmojRs9m7DpQ==
X-ME-Sender: <xms:ts0nasz4hOLnqIahCGb80Ac9qsr8KHys5QoUe2bXLviaL98SqtGTCg>
    <xme:ts0narEKxAnCu77AlRzzddvP1iy50CIpWVvfNDmm1GeFn218oahTa0D-zbljNDVJ6
    _CIcCk100rTLkPZBjGs1XYvUwTinT4lpMfsDSppBkfc_1tKWe0hPm4>
X-ME-Proxy-Cause: dmFkZTFyCEoCD/JtS20/gXSGF078E/aYSSBEXwI0iYcDc3m+7wHcjy6V1LWju6kYp3RJus
    Q8yG1IQLmV+Jy//JxhvloMM7Pg//w9Wj+kt8V0oh6pAYryDajkEaQqV7wWcGmv+yNALaPc
    TMVLYzQ8HCx9QyzBvdGMq3ahTwnbQ+KYWemslxTqTI5g7SYMCrqs3mESNpccoGEytT1cFG
    3bT+5eY7tYUD/9XWm59mVt0tgps7mLnl3Qn0o70mbOcdqd2pLcSdtate3Nk55R/+aA+AqT
    O9Iac6TJb2cVE8EAcBzs1eiXExHFSzAlDVev5WS18IyLir5ID4GZQkWiM0xHnWhcexK9pZ
    fsYihJiIuQ6AFuR5WRttRhO4eFI0J330ypL84JDZkiuvu9EQhKWtC9JLlD7DYkjEUox8B+
    cokaDXxYJvmHPrK6ToCvfdX6dEU/jt4lZUBXkpsFCdd+zkDFWF9Fqr+jMS2m7HOr8AENvz
    fie1W8QMFraJOMTA8KeVVIvTurh+ypUjwf08/JSFAJT4OUB6HV6xzQ8RiWtfKJvhjhGnC9
    hEPjbjeTgOmy1or+CwdXDy7TIvSkYvzm9HjNH1RcvJYsjTdiNeOKpqFx4BVawY00Zk2fFn
    kFaMJKyp7xZZtb4xnHtuGRF86XVS2DemKss+pGqsMVaxt5dEyNqWWKT9Cfug
X-ME-Proxy: <xmx:ts0namdpldS1xfceY7n-XBKRdhxRQlrSOnWlCOYHEdUmAwitgEZI4g>
    <xmx:ts0nanFRcViTILawvEci-un_7lxiol0feBkQFOHUWmcSU59H2UGGDA>
    <xmx:ts0nav3FqSzp19fksmxTAKGC7c8dAcboPWyFi75_2BbLd8p6eLYXGA>
    <xmx:ts0navnEB_1xLXEvF2-5S7bjm8k4R1UnF2rgjATxlRIXX4c0t5H5rg>
    <xmx:t80nagr4lvPOGnE-q1W5-PBjKjLoa8eUSqWN63eYMuQxghwVn3QM8nfg>
Feedback-ID: i51494658:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CC9E8216008B; Tue,  9 Jun 2026 04:24:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AkUlva6Rr9Q-
Date: Tue, 09 Jun 2026 09:24:02 +0100
From: "Paul Barker" <paul@pbarker.dev>
To: yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org,
 yocto-status@lists.yoctoproject.org
Message-Id: <3269d2c2-0864-4f97-b03a-b4f7cfc3554b@app.fastmail.com>
Subject: Yocto Project Status 9 June 2026 (WW24)
Content-Type: multipart/alternative;
 boundary=dde6d65ce87284a7cb60b6fc4da95f14c7d8af83
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Tue, 09 Jun 2026 08:24:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/125

--dde6d65ce87284a7cb60b6fc4da95f14c7d8af83
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 6.1 M1
Next Deadline: YP 6.1 M1: w/c 2026-06-08

Next Team Meetings:
 =E2=80=A2 Bug Triage meeting - Thursday 11th June 7:30am PDT (_https://=
zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09_)
 =E2=80=A2 Weekly Project Engineering Sync  - Tuesday 9th June. 8am PDT =
(_https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09__)_=
 <https://zoom.us/j/990892712>
 =E2=80=A2 Yocto Project Patch Review - Thursday 11th June 10am GMT and =
Monday 15th June 9am PDT (_https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp=
9SjEonaTaONwTb6iWry4Eb.1_)

Project data dashboard: _https://dashboard.yoctoproject.org/_=20

Key Status/Updates:
 =E2=80=A2 YP 5.0.18 has been released
 =E2=80=A2 YP 6.0.1 is in QA.
 =E2=80=A2 YP 6.1 M1 is due to build this week
 =E2=80=A2 We=E2=80=99re working through the backlog of patches, the ban=
dwidth for changes needing in depth review/feedback continues to be a ch=
allenge.
 =E2=80=A2 Patches to remove shell=3DTrue subprocess usage have merged i=
n bitbake but OE-Core still needs significant work, help would be welcom=
e with this.
 =E2=80=A2 We have merged support for `devtool upgrade --stable` and the=
 upstream-stable-release-point bbclass. We hope to use this to track ups=
tream projects with known good stable release series, but we need input =
and discussion on what the criteria should be. Please participate in the=
 discussion on the OE-Architecture list: _https://lists.openembedded.org=
/g/openembedded-architecture/topic/119437109_
 =E2=80=A2 We have changed the xz and zstd decompression dependencies to=
 make the build slightly more efficient and use the host tools for decom=
pression
 =E2=80=A2 Intermittent build failures continue to be problematic and un=
changed from last week:
   =E2=80=A2 several qemu =E2=80=98hang=E2=80=99 type issues
   =E2=80=A2 sometimes yocto-check-layer is showing checksum mismatch is=
sues
   =E2=80=A2 siggen reset issues (=E2=80=9CResourceWarning: unclosed tra=
nsport=E2=80=9D)
   =E2=80=A2 groff build race issues
   =E2=80=A2 intermittent ptest failures in many recipes
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
 =E2=80=A2 WDD 2655 (last week 2630) (_https://wiki.yoctoproject.org/cha=
rts/combo.html_)
 =E2=80=A2 OE-Core/Poky Patch Metrics
   =E2=80=A2 Total patches found: 1056 (last week 1087)
   =E2=80=A2 Patches in the Pending State: 147 (14%) [last week 147 (14%=
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
 =E2=80=A2 YP 6.0.1 is in QA.
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
--dde6d65ce87284a7cb60b6fc4da95f14c7d8af83
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title></head><body><div><span class=3D=
"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D=
"background-color:transparent;"></span>Current Dev Position: YP 6.1 M1</=
span></div><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><spa=
n class=3D"highlight" style=3D"background-color:transparent;"></span>Nex=
t Deadline: YP 6.1 M1: w/c 2026-06-08</span></div><div><br></div><div><s=
pan class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlig=
ht" style=3D"background-color:transparent;"></span>Next Team Meetings:</=
span></div><ul><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0=
);"><span class=3D"highlight" style=3D"background-color:transparent;"></=
span>Bug Triage meeting - Thursday 11th June 7:30am PDT (</span><a href=3D=
"https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09"><sp=
an class=3D"color" style=3D"color:rgb(17, 85, 204);"><span class=3D"high=
light" style=3D"background-color:transparent;"></span><u>https://zoom.us=
/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</u></span></a><span =
class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" =
style=3D"background-color:transparent;"></span>)</span></div></li><li><d=
iv><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"hi=
ghlight" style=3D"background-color:transparent;"></span>Weekly Project E=
ngineering Sync&nbsp; - Tuesday 9th June. 8am PDT (</span><a href=3D"htt=
ps://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09"><span c=
lass=3D"color" style=3D"color:rgb(17, 85, 204);"><span class=3D"highligh=
t" style=3D"background-color:transparent;"></span><u>https://zoom.us/j/9=
90892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</u></span></a><a href=3D=
"https://zoom.us/j/990892712"><span class=3D"color" style=3D"color:rgb(1=
7, 85, 204);"><span class=3D"highlight" style=3D"background-color:transp=
arent;"></span><u>)</u></span></a></div></li><li><div><span class=3D"col=
or" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"bac=
kground-color:transparent;"></span>Yocto Project Patch Review - Thursday=
 11th June 10am GMT and Monday 15th June 9am PDT (</span><a href=3D"http=
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
>YP 5.0.18 has been released</span></div></li><li><div><span class=3D"co=
lor" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"ba=
ckground-color:transparent;"></span>YP 6.0.1 is in QA.</span></div></li>=
<li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=
=3D"highlight" style=3D"background-color:transparent;"></span>YP 6.1 M1 =
is due to build this week</span></div></li><li><div><span class=3D"color=
" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"backg=
round-color:transparent;"></span>We=E2=80=99re working through the backl=
og of patches, the bandwidth for changes needing in depth review/feedbac=
k continues to be a challenge.</span></div></li><li><div><span class=3D"=
color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"=
background-color:transparent;"></span>Patches to remove shell=3DTrue sub=
process usage have merged in bitbake but OE-Core still needs significant=
 work, help would be welcome with this.</span></div></li><li><div><span =
class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" =
style=3D"background-color:transparent;"></span>We have merged support fo=
r `devtool upgrade --stable` and the upstream-stable-release-point bbcla=
ss. We hope to use this to track upstream projects with known good stabl=
e release series, but we need input and discussion on what the criteria =
should be. Please participate in the discussion on the OE-Architecture l=
ist: </span><a href=3D"https://lists.openembedded.org/g/openembedded-arc=
hitecture/topic/119437109"><span class=3D"color" style=3D"color:rgb(17, =
85, 204);"><span class=3D"highlight" style=3D"background-color:transpare=
nt;"></span><u>https://lists.openembedded.org/g/openembedded-architectur=
e/topic/119437109</u></span></a></div></li><li><div><span class=3D"color=
" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"backg=
round-color:transparent;"></span>We have changed the xz and zstd decompr=
ession dependencies to make the build slightly more efficient and use th=
e host tools for decompression</span></div></li><li><div><span class=3D"=
color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"=
background-color:transparent;"></span>Intermittent build failures contin=
ue to be problematic and unchanged from last week:</span></div></li><ul>=
<li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=
=3D"highlight" style=3D"background-color:transparent;"></span>several qe=
mu =E2=80=98hang=E2=80=99 type issues</span></div></li><li><div><span cl=
ass=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" st=
yle=3D"background-color:transparent;"></span>sometimes yocto-check-layer=
 is showing checksum mismatch issues</span></div></li><li><div><span cla=
ss=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" sty=
le=3D"background-color:transparent;"></span>siggen reset issues (=E2=80=9C=
ResourceWarning: unclosed transport=E2=80=9D)</span></div></li><li><div>=
<span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highl=
ight" style=3D"background-color:transparent;"></span>groff build race is=
sues</span></div></li><li><div><span class=3D"color" style=3D"color:rgb(=
0, 0, 0);"><span class=3D"highlight" style=3D"background-color:transpare=
nt;"></span>intermittent ptest failures in many recipes</span></div></li=
></ul><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span=
 class=3D"highlight" style=3D"background-color:transparent;"></span>We w=
ould like to know what people are planning to work on for Yocto Project =
6.1 and beyond. We have a roadmap document in Google Docs: </span><a hre=
f=3D"https://docs.google.com/document/d/12xgAzSjDj5zVlo4eQIbiv1s3QMjtBTC=
vBFY3_T7OPto"><span class=3D"color" style=3D"color:rgb(17, 85, 204);"><s=
pan class=3D"highlight" style=3D"background-color:transparent;"></span><=
u>https://docs.google.com/document/d/12xgAzSjDj5zVlo4eQIbiv1s3QMjtBTCvBF=
Y3_T7OPto</u></span></a></div></li></ul><div><br></div><div><span class=3D=
"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D=
"background-color:transparent;"></span>Want to contribute? We would appr=
eciate help with the following areas:</span></div><ul><li><div><span cla=
ss=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" sty=
le=3D"background-color:transparent;"></span>We have several open issues =
for pseudo and limited maintainer time to work on them. Help from someon=
e familiar with systems programming in C would be greatly appreciated. <=
/span><a href=3D"https://bugzilla.yoctoproject.org/buglist.cgi?list_id=3D=
661406&amp;priority=3DHigh&amp;priority=3DMedium%2B&amp;product=3DPseudo=
&amp;query_format=3Dadvanced&amp;resolution=3D---"><span class=3D"color"=
 style=3D"color:rgb(17, 85, 204);"><span class=3D"highlight" style=3D"ba=
ckground-color:transparent;"></span><u>https://bugzilla.yoctoproject.org=
/buglist.cgi?list_id=3D661406&amp;priority=3DHigh&amp;priority=3DMedium%=
2B&amp;product=3DPseudo&amp;query_format=3Dadvanced&amp;resolution=3D---=
</u></span></a></div></li><li><div><span class=3D"color" style=3D"color:=
rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-color:trans=
parent;"></span>There are a large number of intermittent failures on our=
 autobuilder, any help with investigating, reproducing or solving these =
issues would be welcome! </span><a href=3D"https://valkyrie.yocto.io/pub=
/non-release/abint/"><span class=3D"color" style=3D"color:rgb(17, 85, 20=
4);"><span class=3D"highlight" style=3D"background-color:transparent;"><=
/span><u>https://valkyrie.yocto.io/pub/non-release/abint/</u></span></a>=
</div></li><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);">=
<span class=3D"highlight" style=3D"background-color:transparent;"></span=
>Many recipes in openembedded-core would benefit from a new recipe maint=
ainer. Please look at </span><a href=3D"https://git.openembedded.org/ope=
nembedded-core/tree/meta/conf/distro/include/maintainers.inc"><span clas=
s=3D"color" style=3D"color:rgb(17, 85, 204);"><span class=3D"highlight" =
style=3D"background-color:transparent;"></span><u>https://git.openembedd=
ed.org/openembedded-core/tree/meta/conf/distro/include/maintainers.inc</=
u></span></a><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span c=
lass=3D"highlight" style=3D"background-color:transparent;"></span> and s=
ee if you can adopt any of the unassigned recipes.</span></div></li><li>=
<div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"=
highlight" style=3D"background-color:transparent;"></span>For more ways =
to contribute, see </span><a href=3D"https://docs.google.com/document/d/=
18oxKWxLorfF813h82mK6yKTIHeBp_-9owFuCWbzgjOk/edit?usp=3Dsharing"><span c=
lass=3D"color" style=3D"color:rgb(17, 85, 204);"><span class=3D"highligh=
t" style=3D"background-color:transparent;"></span><u>https://docs.google=
.com/document/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9owFuCWbzgjOk/edit?usp=3D=
sharing</u></span></a></div></li></ul><div><br></div><div><span class=3D=
"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D=
"background-color:transparent;"></span>New to the project?</span></div><=
ul><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span cl=
ass=3D"highlight" style=3D"background-color:transparent;"></span>We have=
 a list of issues we think are good places to start contributing: </span=
><a href=3D"https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3D=
NEWCOMER"><span class=3D"color" style=3D"color:rgb(17, 85, 204);"><span =
class=3D"highlight" style=3D"background-color:transparent;"></span><u>ht=
tps://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DNEWCOMER</u></=
span></a></div></li></ul><div><br></div><div><span class=3D"color" style=
=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-c=
olor:transparent;"></span>Tracking Metrics:</span></div><ul><li><div><sp=
an class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highligh=
t" style=3D"background-color:transparent;"></span>WDD 2655 (last week 26=
30) </span><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span cla=
ss=3D"highlight" style=3D"background-color:transparent;"></span>(</span>=
<a href=3D"https://wiki.yoctoproject.org/charts/combo.html"><span class=3D=
"color" style=3D"color:rgb(17, 85, 204);"><span class=3D"highlight" styl=
e=3D"background-color:transparent;"></span><u>https://wiki.yoctoproject.=
org/charts/combo.html</u></span></a><span class=3D"color" style=3D"color=
:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-color:tran=
sparent;"></span>)</span></div></li><li><div><span class=3D"color" style=
=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-c=
olor:transparent;"></span>OE-Core/Poky Patch Metrics</span></div></li><u=
l><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span cla=
ss=3D"highlight" style=3D"background-color:transparent;"></span>Total pa=
tches found: 1056 (last week 1087)</span></div></li><li><div><span class=
=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=
=3D"background-color:transparent;"></span>Patches in the Pending State: =
147 (14%) [last week 147 (14%)]</span></div></li><li><div><a href=3D"htt=
ps://valkyrie.yocto.io/pub/non-release/patchmetrics/"><span class=3D"col=
or" style=3D"color:rgb(17, 85, 204);"><span class=3D"highlight" style=3D=
"background-color:transparent;"></span><u>https://valkyrie.yocto.io/pub/=
non-release/patchmetrics/</u></span></a></div></li></ul></ul><div><br></=
div><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=
=3D"highlight" style=3D"background-color:transparent;"></span>Upcoming d=
evelopment releases:</span></div><ul><li><div><span class=3D"color" styl=
e=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-=
color:transparent;"></span>6.1 M1:&nbsp;</span></div></li><ul><li><div><=
span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highli=
ght" style=3D"background-color:transparent;"></span>Build Date: w/c 2026=
-06-08</span></div></li><li><div><span class=3D"color" style=3D"color:rg=
b(0, 0, 0);"><span class=3D"highlight" style=3D"background-color:transpa=
rent;"></span>Release Date: w/c 2026-06-22</span></div></li></ul><li><di=
v><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"hig=
hlight" style=3D"background-color:transparent;"></span>6.1 M2:</span></d=
iv></li><ul><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"=
><span class=3D"highlight" style=3D"background-color:transparent;"></spa=
n>Build Date: w/c 2026-07-20</span></div></li><li><div><span class=3D"co=
lor" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"ba=
ckground-color:transparent;"></span>Release Date: w/c 2026-08-03</span><=
/div></li></ul><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0=
);"><span class=3D"highlight" style=3D"background-color:transparent;"></=
span>6.1 M3:</span></div></li><ul><li><div><span class=3D"color" style=3D=
"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-colo=
r:transparent;"></span>Build Date: w/c 2026-08-31</span></div></li><li><=
div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"h=
ighlight" style=3D"background-color:transparent;"></span>Release Date: w=
/c 2026-09-14</span></div></li></ul><li><div><span class=3D"color" style=
=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-c=
olor:transparent;"></span>6.1.0:</span></div></li><ul><li><div><span cla=
ss=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" sty=
le=3D"background-color:transparent;"></span>Build Date (M4): w/c 2026-10=
-12</span></div></li><li><div><span class=3D"color" style=3D"color:rgb(0=
, 0, 0);"><span class=3D"highlight" style=3D"background-color:transparen=
t;"></span>Release Date: w/c 2026-11-02</span></div></li></ul></ul><div>=
<br></div><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span=
 class=3D"highlight" style=3D"background-color:transparent;"></span>Upco=
ming dot releases:</span></div><ul><li><div><span class=3D"color" style=3D=
"color:rgb(34, 34, 34);"><span class=3D"highlight" style=3D"background-c=
olor:rgb(255, 255, 255);"></span>YP 6.0.1 is in QA.</span></div></li><li=
><div><span class=3D"color" style=3D"color:rgb(34, 34, 34);"><span class=
=3D"highlight" style=3D"background-color:rgb(255, 255, 255);"></span>YP =
6.0.2</span></div></li><ul><li><div><span class=3D"color" style=3D"color=
:rgb(34, 34, 34);"><span class=3D"highlight" style=3D"background-color:r=
gb(255, 255, 255);"></span>Build Date w/c 2026-06-23</span></div></li><l=
i><div><span class=3D"color" style=3D"color:rgb(34, 34, 34);"><span clas=
s=3D"highlight" style=3D"background-color:rgb(255, 255, 255);"></span>Re=
lease Date w/c 2026-07-06</span></div></li></ul><li><div><span class=3D"=
color" style=3D"color:rgb(34, 34, 34);"><span class=3D"highlight" style=3D=
"background-color:rgb(255, 255, 255);"></span>YP 5.0.19</span></div></li=
><ul><li><div><span class=3D"color" style=3D"color:rgb(34, 34, 34);"><sp=
an class=3D"highlight" style=3D"background-color:rgb(255, 255, 255);"></=
span>Build Date w/c 2026-06-30</span></div></li><li><div><span class=3D"=
color" style=3D"color:rgb(34, 34, 34);"><span class=3D"highlight" style=3D=
"background-color:rgb(255, 255, 255);"></span>Release Date w/c 2026-07-1=
3</span></div></li></ul><li><div><span class=3D"color" style=3D"color:rg=
b(0, 0, 0);"><span class=3D"highlight" style=3D"background-color:transpa=
rent;"></span>For future release dates, see </span><a href=3D"https://wi=
ki.yoctoproject.org/wiki/Release_calendar"><span class=3D"color" style=3D=
"color:rgb(17, 85, 204);"><span class=3D"highlight" style=3D"background-=
color:transparent;"></span><u>https://wiki.yoctoproject.org/wiki/Release=
_calendar</u></span></a></div></li></ul><div><br></div><div><span class=3D=
"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D=
"background-color:transparent;"></span>The Yocto Project=E2=80=99s techn=
ical governance is through its Technical Steering Committee, more inform=
ation is available at:</span></div><div><a href=3D"https://wiki.yoctopro=
ject.org/wiki/TSC"><span class=3D"color" style=3D"color:rgb(17, 85, 204)=
;"><span class=3D"highlight" style=3D"background-color:transparent;"></s=
pan><u>https://wiki.yoctoproject.org/wiki/TSC</u></span></a></div><div><=
br></div><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span =
class=3D"highlight" style=3D"background-color:transparent;"></span>The S=
tatus reports are now stored on the wiki at: </span><a href=3D"https://w=
iki.yoctoproject.org/wiki/Weekly_Status"><span class=3D"color" style=3D"=
color:rgb(17, 85, 204);"><span class=3D"highlight" style=3D"background-c=
olor:transparent;"></span><u>https://wiki.yoctoproject.org/wiki/Weekly_S=
tatus</u></span></a></div><div><br></div><div><span class=3D"color" styl=
e=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-=
color:transparent;"></span>[If anyone has suggestions for other informat=
ion you=E2=80=99d like to see on this weekly status update, let us know!=
]</span></div></body></html>
--dde6d65ce87284a7cb60b6fc4da95f14c7d8af83--

