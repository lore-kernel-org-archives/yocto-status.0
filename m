Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF6ECDB479
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 14:53:50 +0000 (UTC)
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22895.1782226421343122637
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 23 Jun 2026 07:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=AAhzm+oL;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=VafRBu5k;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.158, mailfrom: paul@pbarker.dev)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6511C14000E4;
	Tue, 23 Jun 2026 10:53:40 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-11.internal (MEProxy); Tue, 23 Jun 2026 10:53:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1782226420; x=1782312820; bh=YM6BVtfM0s9X3pqMFnBCMynIGPHVmMNB
	sZ/v6Vk1TmQ=; b=AAhzm+oL2vutuQsAMaEX9HmPC3SI6QOJQkzj40zEZFXLR+uc
	+/JQRV2eA4v+UsCZOQ8o5c9KWriI9zrM+74kHIfyagjNgrA056ZrLP4HkkHJvU1c
	/L/hzt1InZc6EABXKzezlxjnOhRbgAvoUOuDkI10dwjInXRmY/o9cpkyocYoWeI0
	31GKngjSUUB/VZ3YeHD0sp2wCAQTUzGfuOLf0SiAbxS49rT+0UUY1uHLd0ODpY9p
	+cXFfEta09OxRUApN03MCeOYL78ZAwcHbNj32mcRB64VK/bEdXM1fVkTM52R8SFx
	FjCsNcGO7H+FHpKkFnzzlrWD6diFZG0xWbOLeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782226420; x=
	1782312820; bh=YM6BVtfM0s9X3pqMFnBCMynIGPHVmMNBsZ/v6Vk1TmQ=; b=V
	afRBu5klo9vCMt19lc8PHzqZNR8dT3en1PPsVj1vQ0BqmOoUUmqnQtk0CA6/nehM
	tm+hANxNHiBl88bj28QCyI54Tkl0OEwrUUb9KUKI4hlpGWQjt8W+pIifG709TM9e
	BeMCglvk3aCof/+ZOB0G29X/a7ZP/nXE2PZUMkRwE147TxUdNe1U+rMCBD0YdCeZ
	meu8HxDJvu2BPUzggdUVZHPItEfOZScfUnbb/H9evdfIgAUOLbkptUhFs5OaCugz
	vcPwH4m7S2XY4dAySkwgQl/64KKIXHVDcEC8VYZMiAf+0pPUDb9mbsQINBzswuAf
	PN89M+9W6uaULC0uIPPHw==
X-ME-Sender: <xms:9J06aqTLrZoPVKrJklSJdQa_8KJsQwJvuslfeD3BlJciSIJNVeXbxg>
    <xme:9J06aqngs88ojurJlxWM1nfz-cvOL8PR93-nOUIEk72I0ndCUeDkGe0NUUwbDIWZC
    6CxEdhnZD0pd1UFwSWTVrE3VZ7gG3WL94F2yCFzO6gMc7qto-aEaWLr>
X-ME-Proxy-Cause: dmFkZTE21n50VB5VAVPIynqjOIWycvOJOuCvX+t0pS9soBJ8+FlYb+2RrW87R8NQOHT16S
    rwE5aI248dSbqctAFeiLiDSisDzapxCrPHAaUmHNnhrIE7l+a5kZBwesE1eW+dhbnk6YxD
    rU5znHcEjRiBN6RbzRwHJbvLtSGShMqvmQOjOrpjsP8WoL1G+xUGzJgKVunyei6D+zAZa0
    fC4qQDfTsmRGAsZJBuTyiEGyUEtH+iPAywRFI+q8Q43N1C5nbkm4x5mnHCE6/+JDUWXSQS
    jhm/lJ0K9zOX+UEz+PfxRWKT0Gm0v4YaBydx3OmbFQcCHdsh0422SofQNkLlHSutX9Ycnn
    Mhk3d538KPCcyeHlhIdQffe70QN0e5B68yYFetiLvQa6ocQCtwn3zbR2RlNXyKgEK32HSG
    tI6noNZQE6SD9sGmLQ/fyKRpTUIB9J3Vjpo5qz1N3kxjYeamC/t98CTRSuP5986xPlA8PO
    LqWn5Nt4ATb2xm+3Uhv76DjLjRQ7eWks/PhTEmw5HdEP3UDWS9XAlKzgB7i+h4CaZUxEaz
    h2Eig2nd1C7VjiX7gAb9jxVfvJT8/FeLv8AT2ZxbmfxVaEJwlCKplb+c+tC64JbjpnKezM
    5dSaEVZm5DdNLZZCIpeB2h9bVV3gqpk2/yRaR9TOJb2hGoTU1jAyUPy7ygJg
X-ME-Proxy: <xmx:9J06aj-ImHOpLewuccO_jXs3CMmrbmJ12jY-XMV0ASX-6xm3eRyPYg>
    <xmx:9J06ammDm5nbZ0AMDKWUwIPETCHohVG6xYH5ng614S18SPE8MlR6Hg>
    <xmx:9J06apXcJfWiutc3eYVbf4ifsA53sxPGAHgSIeLxQaoV108rmaf2kA>
    <xmx:9J06arHzSXpm6L7WjFc-eEzUixLYcxuIyndCXy0IK80NKdqljQbZlg>
    <xmx:9J06akJSy9acmDs5uoBPN9IHyFywaVWuIDNRGBhS8_rIZPK1qlCdbVU9>
Feedback-ID: i51494658:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 23FCD216008A; Tue, 23 Jun 2026 10:53:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 23 Jun 2026 15:53:19 +0100
From: "Paul Barker" <paul@pbarker.dev>
To: yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org,
 yocto-status@lists.yoctoproject.org
Message-Id: <8b75976c-ea66-4d8f-8f4f-39cfb87d51a8@app.fastmail.com>
Subject: Yocto Project Status 23 June 2026 (WW26)
Content-Type: multipart/alternative;
 boundary=e130a2e5e0c3b3d7a44dd495b41384ef2f0b4a25
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Tue, 23 Jun 2026 14:53:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/127

--e130a2e5e0c3b3d7a44dd495b41384ef2f0b4a25
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Current Dev Position: YP 6.1 M2
Next Deadline: YP 6.1 M2: w/c 2026-07-20

Next Team Meetings:
 =E2=80=A2 Bug Triage meeting - Thursday 25th June 7:30am PDT (_https://=
zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09_)
 =E2=80=A2 Weekly Project Engineering Sync  - Tuesday 23rd June. 8am PDT=
 (_https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09__)=
_ <https://zoom.us/j/990892712>
 =E2=80=A2 Yocto Project Patch Review - Thursday 25th June 10am GMT and =
Monday 29th June 9am PDT (_https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp=
9SjEonaTaONwTb6iWry4Eb.1_)

Project data dashboard: _https://dashboard.yoctoproject.org/_=20

Key Status/Updates:
 =E2=80=A2 YP 6.0.1 was released
 =E2=80=A2 YP 6.1 M1 is in review
 =E2=80=A2 AUH is now running daily in incremental mode. We=E2=80=99re s=
till tweaking some of the behaviours and reporting but if anyone has fee=
dback/concerns, let us know. Help is needed with resolving automatic upd=
ate failures and getting the patches into a state where they can be acce=
pted.
 =E2=80=A2 CVE metrics are up on scarthgap & wrynose branches due to del=
ays with kernel upgrades. We=E2=80=99ve had intermittent LTP failures, k=
config type changes, lttng build failures and new warnings in dmesg whic=
h we needed to handle. We=E2=80=99re working through this, help is neede=
d to accelerate testing of future stable kernel upgrades.
 =E2=80=A2 Systemd v260 will require Linux 5.10 or later. We run some sy=
stemd utils on the host during the build, so this presents issues with R=
HEL 8 era distros which have older kernel versions. If you use one of th=
ese distros, assistance may be needed to keep them supported. See _https=
://lists.openembedded.org/g/openembedded-architecture/topic/119870359_
 =E2=80=A2 We continue to see high load on our infrastructure due to bot=
s and AI scraping. This has primarily caused timeouts and errors accessi=
ng _git.openembedded.org_ & _git.yoctoproject.org_. We have mitigations =
in place for now. Traditional git:// protocol continues to be disabled.
 =E2=80=A2 We=E2=80=99re working through the backlog of patches, the ban=
dwidth for changes needing in depth review/feedback continues to be a ch=
allenge.
 =E2=80=A2 Intermittent build failures continue to be problematic:
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
 =E2=80=A2 WDD 2620 (last week 2590) (_https://wiki.yoctoproject.org/cha=
rts/combo.html_)
 =E2=80=A2 OE-Core/Poky Patch Metrics
   =E2=80=A2 Total patches found: 1054(last week 1061)
   =E2=80=A2 Patches in the Pending State: 145 (14%) [last week 146 (14%=
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

Best regards,
Paul Barker

--e130a2e5e0c3b3d7a44dd495b41384ef2f0b4a25
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title></head><body><div>Hi all,</div=
><div><br></div><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"=
>Current Dev Position: YP 6.1 M2</span></div><div><span class=3D"color" =
style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"backgro=
und-color:transparent;"></span>Next Deadline: YP 6.1 M2: w/c 2026-07-20<=
/span></div><div><br></div><div><span class=3D"color" style=3D"color:rgb=
(0, 0, 0);"><span class=3D"highlight" style=3D"background-color:transpar=
ent;"></span>Next Team Meetings:</span></div><ul><li><div><span class=3D=
"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D=
"background-color:transparent;"></span>Bug Triage meeting - Thursday 25t=
h June 7:30am PDT (</span><a href=3D"https://zoom.us/j/454367603?pwd=3DZ=
Gxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09"><span class=3D"color" style=3D"color:rg=
b(17, 85, 204);"><span class=3D"highlight" style=3D"background-color:tra=
nsparent;"></span><u>https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0b=
Fd5aVpHVVZ6dz09</u></span></a><span class=3D"color" style=3D"color:rgb(0=
, 0, 0);"><span class=3D"highlight" style=3D"background-color:transparen=
t;"></span>)</span></div></li><li><div><span class=3D"color" style=3D"co=
lor:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-color:t=
ransparent;"></span>Weekly Project Engineering Sync&nbsp; - Tuesday 23rd=
 June. 8am PDT (</span><a href=3D"https://zoom.us/j/990892712?pwd=3DcHU1=
MjhoM2x6ck81bkcrYjRrcmJsUT09"><span class=3D"color" style=3D"color:rgb(1=
7, 85, 204);"><span class=3D"highlight" style=3D"background-color:transp=
arent;"></span><u>https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcr=
YjRrcmJsUT09</u></span></a><a href=3D"https://zoom.us/j/990892712"><span=
 class=3D"color" style=3D"color:rgb(17, 85, 204);"><span class=3D"highli=
ght" style=3D"background-color:transparent;"></span><u>)</u></span></a><=
/div></li><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><=
span class=3D"highlight" style=3D"background-color:transparent;"></span>=
Yocto Project Patch Review - Thursday 25th June 10am GMT and Monday 29th=
 June 9am PDT (</span><a href=3D"https://zoom.us/j/97762397148?pwd=3D1xk=
0iC9hp9SjEonaTaONwTb6iWry4Eb.1"><span class=3D"color" style=3D"color:rgb=
(17, 85, 204);"><span class=3D"highlight" style=3D"background-color:tran=
sparent;"></span><u>https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEona=
TaONwTb6iWry4Eb.1</u></span></a><span class=3D"color" style=3D"color:rgb=
(0, 0, 0);"><span class=3D"highlight" style=3D"background-color:transpar=
ent;"></span>)</span></div></li></ul><div><br></div><div><span class=3D"=
color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"=
background-color:transparent;"></span>Project data dashboard: </span><a =
href=3D"https://dashboard.yoctoproject.org/"><span class=3D"color" style=
=3D"color:rgb(17, 85, 204);"><span class=3D"highlight" style=3D"backgrou=
nd-color:transparent;"></span><u>https://dashboard.yoctoproject.org/</u>=
</span></a><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span cla=
ss=3D"highlight" style=3D"background-color:transparent;"></span>&nbsp;</=
span></div><div><br></div><div><span class=3D"color" style=3D"color:rgb(=
0, 0, 0);"><span class=3D"highlight" style=3D"background-color:transpare=
nt;"></span>Key Status/Updates:</span></div><ul><li><div><span class=3D"=
color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"=
background-color:transparent;"></span>YP 6.0.1 was released</span></div>=
</li><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span =
class=3D"highlight" style=3D"background-color:transparent;"></span>YP 6.=
1 M1 is in review</span></div></li><li><div><span class=3D"color" style=3D=
"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-colo=
r:transparent;"></span>AUH is now running daily in incremental mode. We=E2=
=80=99re still tweaking some of the behaviours and reporting but if anyo=
ne has feedback/concerns, let us know. Help is needed with resolving aut=
omatic update failures and getting the patches into a state where they c=
an be accepted.</span></div></li><li><div><span class=3D"color" style=3D=
"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-colo=
r:transparent;"></span>CVE metrics are up on scarthgap &amp; wrynose bra=
nches due to delays with kernel upgrades. We=E2=80=99ve had intermittent=
 LTP failures, kconfig type changes, lttng build failures and new warnin=
gs in dmesg which we needed to handle. We=E2=80=99re working through thi=
s, help is needed to accelerate testing of future stable kernel upgrades=
.</span></div></li><li><div><span class=3D"color" style=3D"color:rgb(0, =
0, 0);"><span class=3D"highlight" style=3D"background-color:transparent;=
"></span>Systemd v260 will require Linux 5.10 or later. We run some syst=
emd utils on the host during the build, so this presents issues with RHE=
L 8 era distros which have older kernel versions. If you use one of thes=
e distros, assistance may be needed to keep them supported. See </span><=
a href=3D"https://lists.openembedded.org/g/openembedded-architecture/top=
ic/119870359"><span class=3D"color" style=3D"color:rgb(17, 85, 204);"><s=
pan class=3D"highlight" style=3D"background-color:transparent;"></span><=
u>https://lists.openembedded.org/g/openembedded-architecture/topic/11987=
0359</u></span></a></div></li><li><div><span class=3D"color" style=3D"co=
lor:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-color:t=
ransparent;"></span>We continue to see high load on our infrastructure d=
ue to bots and AI scraping. This has primarily caused timeouts and error=
s accessing </span><a href=3D"http://git.openembedded.org/"><span class=3D=
"color" style=3D"color:rgb(17, 85, 204);"><span class=3D"highlight" styl=
e=3D"background-color:transparent;"></span><u>git.openembedded.org</u></=
span></a><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=
=3D"highlight" style=3D"background-color:transparent;"></span> &amp; </s=
pan><a href=3D"http://git.yoctoproject.org/"><span class=3D"color" style=
=3D"color:rgb(17, 85, 204);"><span class=3D"highlight" style=3D"backgrou=
nd-color:transparent;"></span><u>git.yoctoproject.org</u></span></a><spa=
n class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight=
" style=3D"background-color:transparent;"></span>. We have mitigations i=
n place for now. Traditional git:// protocol continues to be disabled.</=
span></div></li><li><div><span class=3D"color" style=3D"color:rgb(0, 0, =
0);"><span class=3D"highlight" style=3D"background-color:transparent;"><=
/span>We=E2=80=99re working through the backlog of patches, the bandwidt=
h for changes needing in depth review/feedback continues to be a challen=
ge.</span></div></li><li><div><span class=3D"color" style=3D"color:rgb(0=
, 0, 0);"><span class=3D"highlight" style=3D"background-color:transparen=
t;"></span>Intermittent build failures continue to be problematic:</span=
></div></li><ul><li><div><span class=3D"color" style=3D"color:rgb(0, 0, =
0);"><span class=3D"highlight" style=3D"background-color:transparent;"><=
/span>several qemu =E2=80=98hang=E2=80=99 type issues</span></div></li><=
li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D=
"highlight" style=3D"background-color:transparent;"></span>sometimes yoc=
to-check-layer is showing checksum mismatch issues</span></div></li><li>=
<div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"=
highlight" style=3D"background-color:transparent;"></span>siggen reset i=
ssues (=E2=80=9CResourceWarning: unclosed transport=E2=80=9D)</span></di=
v></li><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><spa=
n class=3D"highlight" style=3D"background-color:transparent;"></span>gro=
ff build race issues</span></div></li><li><div><span class=3D"color" sty=
le=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background=
-color:transparent;"></span>intermittent ptest failures in many recipes<=
/span></div></li></ul><li><div><span class=3D"color" style=3D"color:rgb(=
0, 0, 0);"><span class=3D"highlight" style=3D"background-color:transpare=
nt;"></span>We would like to know what people are planning to work on fo=
r Yocto Project 6.1 and beyond. We have a roadmap document in Google Doc=
s: </span><a href=3D"https://docs.google.com/document/d/12xgAzSjDj5zVlo4=
eQIbiv1s3QMjtBTCvBFY3_T7OPto"><span class=3D"color" style=3D"color:rgb(1=
7, 85, 204);"><span class=3D"highlight" style=3D"background-color:transp=
arent;"></span><u>https://docs.google.com/document/d/12xgAzSjDj5zVlo4eQI=
biv1s3QMjtBTCvBFY3_T7OPto</u></span></a></div></li></ul><div><br></div><=
div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"h=
ighlight" style=3D"background-color:transparent;"></span>Want to contrib=
ute? We would appreciate help with the following areas:</span></div><ul>=
<li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=
=3D"highlight" style=3D"background-color:transparent;"></span>We have se=
veral open issues for pseudo and limited maintainer time to work on them=
. Help from someone familiar with systems programming in C would be grea=
tly appreciated. </span><a href=3D"https://bugzilla.yoctoproject.org/bug=
list.cgi?list_id=3D661406&amp;priority=3DHigh&amp;priority=3DMedium%2B&a=
mp;product=3DPseudo&amp;query_format=3Dadvanced&amp;resolution=3D---"><s=
pan class=3D"color" style=3D"color:rgb(17, 85, 204);"><span class=3D"hig=
hlight" style=3D"background-color:transparent;"></span><u>https://bugzil=
la.yoctoproject.org/buglist.cgi?list_id=3D661406&amp;priority=3DHigh&amp=
;priority=3DMedium%2B&amp;product=3DPseudo&amp;query_format=3Dadvanced&a=
mp;resolution=3D---</u></span></a></div></li><li><div><span class=3D"col=
or" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"bac=
kground-color:transparent;"></span>There are a large number of intermitt=
ent failures on our autobuilder, any help with investigating, reproducin=
g or solving these issues would be welcome! </span><a href=3D"https://va=
lkyrie.yocto.io/pub/non-release/abint/"><span class=3D"color" style=3D"c=
olor:rgb(17, 85, 204);"><span class=3D"highlight" style=3D"background-co=
lor:transparent;"></span><u>https://valkyrie.yocto.io/pub/non-release/ab=
int/</u></span></a></div></li><li><div><span class=3D"color" style=3D"co=
lor:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-color:t=
ransparent;"></span>Many recipes in openembedded-core would benefit from=
 a new recipe maintainer. Please look at </span><a href=3D"https://git.o=
penembedded.org/openembedded-core/tree/meta/conf/distro/include/maintain=
ers.inc"><span class=3D"color" style=3D"color:rgb(17, 85, 204);"><span c=
lass=3D"highlight" style=3D"background-color:transparent;"></span><u>htt=
ps://git.openembedded.org/openembedded-core/tree/meta/conf/distro/includ=
e/maintainers.inc</u></span></a><span class=3D"color" style=3D"color:rgb=
(0, 0, 0);"><span class=3D"highlight" style=3D"background-color:transpar=
ent;"></span> and see if you can adopt any of the unassigned recipes.</s=
pan></div></li><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0=
);"><span class=3D"highlight" style=3D"background-color:transparent;"></=
span>For more ways to contribute, see </span><a href=3D"https://docs.goo=
gle.com/document/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9owFuCWbzgjOk/edit?usp=
=3Dsharing"><span class=3D"color" style=3D"color:rgb(17, 85, 204);"><spa=
n class=3D"highlight" style=3D"background-color:transparent;"></span><u>=
https://docs.google.com/document/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9owFuC=
WbzgjOk/edit?usp=3Dsharing</u></span></a></div></li></ul><div><br></div>=
<div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"=
highlight" style=3D"background-color:transparent;"></span>New to the pro=
ject?</span></div><ul><li><div><span class=3D"color" style=3D"color:rgb(=
0, 0, 0);"><span class=3D"highlight" style=3D"background-color:transpare=
nt;"></span>We have a list of issues we think are good places to start c=
ontributing: </span><a href=3D"https://bugzilla.yoctoproject.org/buglist=
.cgi?quicksearch=3DNEWCOMER"><span class=3D"color" style=3D"color:rgb(17=
, 85, 204);"><span class=3D"highlight" style=3D"background-color:transpa=
rent;"></span><u>https://bugzilla.yoctoproject.org/buglist.cgi?quicksear=
ch=3DNEWCOMER</u></span></a></div></li></ul><div><br></div><div><span cl=
ass=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" st=
yle=3D"background-color:transparent;"></span>Tracking Metrics:</span></d=
iv><ul><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><spa=
n class=3D"highlight" style=3D"background-color:transparent;"></span>WDD=
 2620 (last week 2590) </span><span class=3D"color" style=3D"color:rgb(0=
, 0, 0);"><span class=3D"highlight" style=3D"background-color:transparen=
t;"></span>(</span><a href=3D"https://wiki.yoctoproject.org/charts/combo=
.html"><span class=3D"color" style=3D"color:rgb(17, 85, 204);"><span cla=
ss=3D"highlight" style=3D"background-color:transparent;"></span><u>https=
://wiki.yoctoproject.org/charts/combo.html</u></span></a><span class=3D"=
color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"=
background-color:transparent;"></span>)</span></div></li><li><div><span =
class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" =
style=3D"background-color:transparent;"></span>OE-Core/Poky Patch Metric=
s</span></div></li><ul><li><div><span class=3D"color" style=3D"color:rgb=
(0, 0, 0);"><span class=3D"highlight" style=3D"background-color:transpar=
ent;"></span>Total patches found: 1054(last week 1061)</span></div></li>=
<li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=
=3D"highlight" style=3D"background-color:transparent;"></span>Patches in=
 the Pending State: 145 (14%) [last week 146 (14%)]</span></div></li><li=
><div><a href=3D"https://valkyrie.yocto.io/pub/non-release/patchmetrics/=
"><span class=3D"color" style=3D"color:rgb(17, 85, 204);"><span class=3D=
"highlight" style=3D"background-color:transparent;"></span><u>https://va=
lkyrie.yocto.io/pub/non-release/patchmetrics/</u></span></a></div></li><=
/ul></ul><div><br></div><div><span class=3D"color" style=3D"color:rgb(0,=
 0, 0);"><span class=3D"highlight" style=3D"background-color:transparent=
;"></span>Upcoming development releases:</span></div><ul><li><div><span =
class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" =
style=3D"background-color:transparent;"></span>6.1 M1:&nbsp;</span></div=
></li><ul><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><=
span class=3D"highlight" style=3D"background-color:transparent;"></span>=
Build Date: w/c 2026-06-08</span></div></li><li><div><span class=3D"colo=
r" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"back=
ground-color:transparent;"></span>Release Date: w/c 2026-06-22</span></d=
iv></li></ul><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);=
"><span class=3D"highlight" style=3D"background-color:transparent;"></sp=
an>6.1 M2:</span></div></li><ul><li><div><span class=3D"color" style=3D"=
color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-color=
:transparent;"></span>Build Date: w/c 2026-07-20</span></div></li><li><d=
iv><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"hi=
ghlight" style=3D"background-color:transparent;"></span>Release Date: w/=
c 2026-08-03</span></div></li></ul><li><div><span class=3D"color" style=3D=
"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-colo=
r:transparent;"></span>6.1 M3:</span></div></li><ul><li><div><span class=
=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=
=3D"background-color:transparent;"></span>Build Date: w/c 2026-08-31</sp=
an></div></li><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0)=
;"><span class=3D"highlight" style=3D"background-color:transparent;"></s=
pan>Release Date: w/c 2026-09-14</span></div></li></ul><li><div><span cl=
ass=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" st=
yle=3D"background-color:transparent;"></span>6.1.0:</span></div></li><ul=
><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span clas=
s=3D"highlight" style=3D"background-color:transparent;"></span>Build Dat=
e (M4): w/c 2026-10-12</span></div></li><li><div><span class=3D"color" s=
tyle=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"backgrou=
nd-color:transparent;"></span>Release Date: w/c 2026-11-02</span></div><=
/li></ul></ul><div><br></div><div><span class=3D"color" style=3D"color:r=
gb(0, 0, 0);"><span class=3D"highlight" style=3D"background-color:transp=
arent;"></span>Upcoming dot releases:</span></div><ul><li><div><span cla=
ss=3D"color" style=3D"color:rgb(34, 34, 34);"><span class=3D"highlight" =
style=3D"background-color:rgb(255, 255, 255);"></span>YP 6.0.2</span></d=
iv></li><ul><li><div><span class=3D"color" style=3D"color:rgb(34, 34, 34=
);"><span class=3D"highlight" style=3D"background-color:rgb(255, 255, 25=
5);"></span>Build Date w/c 2026-06-23</span></div></li><li><div><span cl=
ass=3D"color" style=3D"color:rgb(34, 34, 34);"><span class=3D"highlight"=
 style=3D"background-color:rgb(255, 255, 255);"></span>Release Date w/c =
2026-07-06</span></div></li></ul><li><div><span class=3D"color" style=3D=
"color:rgb(34, 34, 34);"><span class=3D"highlight" style=3D"background-c=
olor:rgb(255, 255, 255);"></span>YP 5.0.19</span></div></li><ul><li><div=
><span class=3D"color" style=3D"color:rgb(34, 34, 34);"><span class=3D"h=
ighlight" style=3D"background-color:rgb(255, 255, 255);"></span>Build Da=
te w/c 2026-06-30</span></div></li><li><div><span class=3D"color" style=3D=
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
div><div><br></div><div>Best regards,</div><div id=3D"sig133588112"><div=
 class=3D"signature">Paul Barker</div></div><div><br></div></body></html=
>
--e130a2e5e0c3b3d7a44dd495b41384ef2f0b4a25--

