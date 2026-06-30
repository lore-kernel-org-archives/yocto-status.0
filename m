Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 144F3C43327
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 14:52:14 +0000 (UTC)
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23331.1782831126776983518
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 07:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=BoR3pDGU;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=RbHLTqWc;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id B92D8EC00D8;
	Tue, 30 Jun 2026 10:52:05 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-11.internal (MEProxy); Tue, 30 Jun 2026 10:52:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1782831125; x=1782917525; bh=KIje7XZE2J1r8/WKTBv10rt4ebybtlRz
	iDE4hCEmMvk=; b=BoR3pDGUlAvh7tU+3sfMTYTlpB658PbH1Tl7nmjupzYulfS2
	Htn2ge6RBHV+Asa84DecjPQKEKybksSmtJXkV32GrvHkI0RmMjpUbgpLpIkXJlKm
	CLLqJmpv/+JETJ34AylyqGS4Xv3Q+y5q58NHbTLNGaWAd2ECktxQzd+TjCAeO4Ea
	2h9advoAw8Edt94O9GAcCTunIO/u2O8ofkU9SHiYWN+fiuF35ICJDCp7ggen/ECn
	viB3C8V1ty7LotZGynJJW+pmBzMyk/ffsN2QIlxUFpq5y0xiJeVwNpJCSFdlOf/Q
	hjBkcssPxAMxCoF7APIDoqyXMxacCggZ3Eza1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782831125; x=
	1782917525; bh=KIje7XZE2J1r8/WKTBv10rt4ebybtlRziDE4hCEmMvk=; b=R
	bHLTqWctlY0KV/ko/NPx1oiVUVLcz1AdnVn8HyTSgZHFgZNrTTLvq7bdI+IJWXr8
	j0Ksxc0GxXs8SeCyJji0FzRj8gpBNH2f7YtexwiKoCME94jH3XWRRrauxo6NMEQW
	7d/ClpQ/29r5KgxPtIUN76TOYr+XQQLaQzbRQftI6XFGYElnEEhsRSHne9TX3F9f
	yHwCvCeklTYBxO/txrq7UGgF9NjKUF1zku7/2E7MRU4Jwfsz7L1m7Q+l2uONpTgp
	CLgGTCPfdZo6nQCm0U/fejJg1MQoFED1vGV7aNDHd8NElCu2svmdi5BbWM9KjT/O
	5oQ+9LUyRnRPmaoKP2bJw==
X-ME-Sender: <xms:FdhDaiKHCL2GayHxZBfY5p_WdkwzQZWSoCCAnDRppfe381rcV_Lnzg>
    <xme:FdhDak_p8BAf8lXhqlLyFOfVQsPRiBiRDfl4IoWugYVio_J0gZqYwovuJrXnDm4X1
    UaPMzm043jQqwToEBQ_KGuH1YPHyGx5-1H0B5ED7uF7GI8pWifp-nAi>
X-ME-Proxy-Cause: dmFkZTF3yPLGuKzTsKPtNUBRYbspg90w2Y8h0Z/M1MduSzJMse696He1d908TSyLTnnts5
    +9QDQaB4AA5r36xO2xAMNdWUr26WEbf7qaIVJ5hBomXaKTMu/dHnfy2hTfQvKql1kivRUA
    5atSKZaXh8mfkxKXS8mCPxIBvQEm3WMh2CoY3G/c+1QVlA7Ojojyv97alH1NTZ/iuHRcWY
    oKvBX3ux5IeznoSn8Y0dwX1cwswq8puV2h/QPPkQxHF1pwnAakxN5G1VUa32BdZsbfxofE
    FS61KFyH0F3c0ZZvGRx7XAN2oNaQ3tTjv+BlN+gVwlTpU+kNfGSW1IqDQKewhP55j+qcY3
    KvgXtrBCbphXpMUfKWzMVA1us0FnU0gf/qOUryWVfheEAEPB2ZsejDoyPBDq7fQqbhuho6
    9SdL3WRgI1+nmLg6vKwGYi8WoPlsGIzi6BFwVqE8LvcEmQUi7zQi1odrjxCy7lG9Yp1v/Y
    dFEIceNhokvV0Y4NEJ/GBOoSX9zfldcuhxg2u/nsWWP72rA+ktbLz4yIoedgm8tA7h+tMM
    xGPkUc17yNZeCAfNvIEpYlvt3eU5evpeDopbahqHJXptNxlciDrn59svfcYYRK5LsFkTzS
    hKbUA3Ijt/zi0F6XNKgrsWNxicAuD3ToIKSG8pUc1ZA3uW/yx9exqgIpng7Q
X-ME-Proxy: <xmx:FdhDar3anNlTHIyK5k2Se2nHLCGwOPpbKrARslGyV5qWhudtEg8SSw>
    <xmx:FdhDag_Xtzsd_8vLdHqpZ8uitzxCv551cdXO-Jv-xabGSlOaI0_khQ>
    <xmx:FdhDakOeZH8CSx56GoSPcmgjrDwHi88Ez3MAN91zE4GSgY-BHCD3vA>
    <xmx:FdhDase-bCl5ME2Hkd8hVWLcg6UaQ22Y4XPK3PZle4Nu9-snfwGq4Q>
    <xmx:FdhDarhemtE4zBHyYkBDXjMVgJG92pEBsBmUEcj52g-ynefhrOno8b-h>
Feedback-ID: i51494658:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 47C08216008A; Tue, 30 Jun 2026 10:52:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 30 Jun 2026 15:51:44 +0100
From: "Paul Barker" <paul@pbarker.dev>
To: yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org,
 yocto-status@lists.yoctoproject.org
Message-Id: <150c6e1c-6cb3-4844-a926-671c59390873@app.fastmail.com>
Subject: Yocto Project Status 30 June 2026 (WW27)
Content-Type: multipart/alternative;
 boundary=c2c890e24ed0cb67ee7f7704658acf30e45d3ad2
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Tue, 30 Jun 2026 14:52:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/128

--c2c890e24ed0cb67ee7f7704658acf30e45d3ad2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi All,

Current Dev Position: YP 6.1 M2
Next Deadline: YP 6.1 M2: w/c 2026-07-20

Next Team Meetings:
 =E2=80=A2 Bug Triage meeting - Thursday 2nd July 7:30am PDT (_https://z=
oom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09_)
 =E2=80=A2 Weekly Project Engineering Sync  - Tuesday 30th June 8am PDT =
(_https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09__)_=
 <https://zoom.us/j/990892712>
 =E2=80=A2 Yocto Project Patch Review - Thursday 2nd July 10am GMT and M=
onday 6th July 9am PDT (_https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9S=
jEonaTaONwTb6iWry4Eb.1_)

Project data dashboard: _https://dashboard.yoctoproject.org/_=20

Key Status/Updates:
 =E2=80=A2 YP 6.1 M1 was released
 =E2=80=A2 YP 6.0.2 is in QA
 =E2=80=A2 The number of open CVEs on scarthgap has been reduced with st=
able kernel updates merging. We have identified a few linux-yocto CVEs w=
hich need triaging due to missing version information in the CVE databas=
es, see the email sent to the list: _https://lists.yoctoproject.org/g/yo=
cto/topic/120036383_
 =E2=80=A2 Systemd v260+ will require a host Linux kernel of 5.10 or lat=
er due to systemd utils run during the build process. This presents issu=
es with RHEL 8 era distros which have older kernel versions. We have pat=
ches in progress but if you=E2=80=99re using these distros, assistance w=
ill be needed to keep them supported. See _https://lists.openembedded.or=
g/g/openembedded-architecture/topic/119870359_
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
 =E2=80=A2 WDD 2647 (last week 2620) (_https://wiki.yoctoproject.org/cha=
rts/combo.html_)
 =E2=80=A2 OE-Core/Poky Patch Metrics
   =E2=80=A2 Total patches found: 1036 (last week 1054)
   =E2=80=A2 Patches in the Pending State: 145 (14%) [last week 145 (14%=
)]
   =E2=80=A2 _https://valkyrie.yocto.io/pub/non-release/patchmetrics/_

Upcoming development releases:
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
 =E2=80=A2 YP 5.0.19
   =E2=80=A2 Build Date w/c 2026-06-30
   =E2=80=A2 Release Date w/c 2026-07-13
 =E2=80=A2 YP 6.0.3
   =E2=80=A2 Build Date w/c 2026-08-10
   =E2=80=A2 Release Date w/c 2026-08-24
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

--c2c890e24ed0cb67ee7f7704658acf30e45d3ad2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title></head><body><div>Hi All,</div=
><div><br></div><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"=
>Current Dev Position: YP 6.1 M2</span></div><div><span class=3D"color" =
style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"backgro=
und-color:transparent;"></span>Next Deadline: YP 6.1 M2: w/c 2026-07-20<=
/span></div><div><br></div><div><span class=3D"color" style=3D"color:rgb=
(0, 0, 0);"><span class=3D"highlight" style=3D"background-color:transpar=
ent;"></span>Next Team Meetings:</span></div><ul><li><div><span class=3D=
"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D=
"background-color:transparent;"></span>Bug Triage meeting - Thursday 2nd=
 July 7:30am PDT (</span><a href=3D"https://zoom.us/j/454367603?pwd=3DZG=
xoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09"><span class=3D"color" style=3D"color:rgb=
(17, 85, 204);"><span class=3D"highlight" style=3D"background-color:tran=
sparent;"></span><u>https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bF=
d5aVpHVVZ6dz09</u></span></a><span class=3D"color" style=3D"color:rgb(0,=
 0, 0);"><span class=3D"highlight" style=3D"background-color:transparent=
;"></span>)</span></div></li><li><div><span class=3D"color" style=3D"col=
or:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-color:tr=
ansparent;"></span>Weekly Project Engineering Sync&nbsp; - Tuesday 30th =
June 8am PDT (</span><a href=3D"https://zoom.us/j/990892712?pwd=3DcHU1Mj=
hoM2x6ck81bkcrYjRrcmJsUT09"><span class=3D"color" style=3D"color:rgb(17,=
 85, 204);"><span class=3D"highlight" style=3D"background-color:transpar=
ent;"></span><u>https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYj=
RrcmJsUT09</u></span></a><a href=3D"https://zoom.us/j/990892712"><span c=
lass=3D"color" style=3D"color:rgb(17, 85, 204);"><span class=3D"highligh=
t" style=3D"background-color:transparent;"></span><u>)</u></span></a></d=
iv></li><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><sp=
an class=3D"highlight" style=3D"background-color:transparent;"></span>Yo=
cto Project Patch Review - Thursday 2nd July 10am GMT and Monday 6th Jul=
y 9am PDT (</span><a href=3D"https://zoom.us/j/97762397148?pwd=3D1xk0iC9=
hp9SjEonaTaONwTb6iWry4Eb.1"><span class=3D"color" style=3D"color:rgb(17,=
 85, 204);"><span class=3D"highlight" style=3D"background-color:transpar=
ent;"></span><u>https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaON=
wTb6iWry4Eb.1</u></span></a><span class=3D"color" style=3D"color:rgb(0, =
0, 0);"><span class=3D"highlight" style=3D"background-color:transparent;=
"></span>)</span></div></li></ul><div><br></div><div><span class=3D"colo=
r" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"back=
ground-color:transparent;"></span>Project data dashboard: </span><a href=
=3D"https://dashboard.yoctoproject.org/"><span class=3D"color" style=3D"=
color:rgb(17, 85, 204);"><span class=3D"highlight" style=3D"background-c=
olor:transparent;"></span><u>https://dashboard.yoctoproject.org/</u></sp=
an></a><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D=
"highlight" style=3D"background-color:transparent;"></span>&nbsp;</span>=
</div><div><br></div><div><span class=3D"color" style=3D"color:rgb(0, 0,=
 0);"><span class=3D"highlight" style=3D"background-color:transparent;">=
</span>Key Status/Updates:</span></div><ul><li><div><span class=3D"color=
" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"backg=
round-color:transparent;"></span>YP 6.1 M1 was released</span></div></li=
><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span clas=
s=3D"highlight" style=3D"background-color:transparent;"></span>YP 6.0.2 =
is in QA</span></div></li><li><div><span class=3D"color" style=3D"color:=
rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-color:trans=
parent;"></span>The number of open CVEs on scarthgap has been reduced wi=
th stable kernel updates merging. We have identified a few linux-yocto C=
VEs which need triaging due to missing version information in the CVE da=
tabases, see the email sent to the list: </span><a href=3D"https://lists=
.yoctoproject.org/g/yocto/topic/120036383"><span class=3D"color" style=3D=
"color:rgb(17, 85, 204);"><span class=3D"highlight" style=3D"background-=
color:transparent;"></span><u>https://lists.yoctoproject.org/g/yocto/top=
ic/120036383</u></span></a></div></li><li><div><span class=3D"color" sty=
le=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background=
-color:transparent;"></span>Systemd v260+ will require a host Linux kern=
el of 5.10 or later due to systemd utils run during the build process. T=
his presents issues with RHEL 8 era distros which have older kernel vers=
ions. We have patches in progress but if you=E2=80=99re using these dist=
ros, assistance will be needed to keep them supported. See </span><a hre=
f=3D"https://lists.openembedded.org/g/openembedded-architecture/topic/11=
9870359"><span class=3D"color" style=3D"color:rgb(17, 85, 204);"><span c=
lass=3D"highlight" style=3D"background-color:transparent;"></span><u>htt=
ps://lists.openembedded.org/g/openembedded-architecture/topic/119870359<=
/u></span></a></div></li><li><div><span class=3D"color" style=3D"color:r=
gb(0, 0, 0);"><span class=3D"highlight" style=3D"background-color:transp=
arent;"></span>We continue to see high load on our infrastructure due to=
 bots and AI scraping. This has primarily caused timeouts and errors acc=
essing </span><a href=3D"http://git.openembedded.org/"><span class=3D"co=
lor" style=3D"color:rgb(17, 85, 204);"><span class=3D"highlight" style=3D=
"background-color:transparent;"></span><u>git.openembedded.org</u></span=
></a><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"=
highlight" style=3D"background-color:transparent;"></span> &amp; </span>=
<a href=3D"http://git.yoctoproject.org/"><span class=3D"color" style=3D"=
color:rgb(17, 85, 204);"><span class=3D"highlight" style=3D"background-c=
olor:transparent;"></span><u>git.yoctoproject.org</u></span></a><span cl=
ass=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" st=
yle=3D"background-color:transparent;"></span>. We have mitigations in pl=
ace for now. Traditional git:// protocol continues to be disabled.</span=
></div></li><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"=
><span class=3D"highlight" style=3D"background-color:transparent;"></spa=
n>We=E2=80=99re working through the backlog of patches, the bandwidth fo=
r changes needing in depth review/feedback continues to be a challenge.<=
/span></div></li><li><div><span class=3D"color" style=3D"color:rgb(0, 0,=
 0);"><span class=3D"highlight" style=3D"background-color:transparent;">=
</span>Intermittent build failures continue to be problematic:</span></d=
iv></li><ul><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"=
><span class=3D"highlight" style=3D"background-color:transparent;"></spa=
n>several qemu =E2=80=98hang=E2=80=99 type issues</span></div></li><li><=
div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"h=
ighlight" style=3D"background-color:transparent;"></span>sometimes yocto=
-check-layer is showing checksum mismatch issues</span></div></li><li><d=
iv><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"hi=
ghlight" style=3D"background-color:transparent;"></span>siggen reset iss=
ues (=E2=80=9CResourceWarning: unclosed transport=E2=80=9D)</span></div>=
</li><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span =
class=3D"highlight" style=3D"background-color:transparent;"></span>groff=
 build race issues</span></div></li><li><div><span class=3D"color" style=
=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-c=
olor:transparent;"></span>intermittent ptest failures in many recipes</s=
pan></div></li></ul><li><div><span class=3D"color" style=3D"color:rgb(0,=
 0, 0);"><span class=3D"highlight" style=3D"background-color:transparent=
;"></span>We would like to know what people are planning to work on for =
Yocto Project 6.1 and beyond. We have a roadmap document in Google Docs:=
 </span><a href=3D"https://docs.google.com/document/d/12xgAzSjDj5zVlo4eQ=
Ibiv1s3QMjtBTCvBFY3_T7OPto"><span class=3D"color" style=3D"color:rgb(17,=
 85, 204);"><span class=3D"highlight" style=3D"background-color:transpar=
ent;"></span><u>https://docs.google.com/document/d/12xgAzSjDj5zVlo4eQIbi=
v1s3QMjtBTCvBFY3_T7OPto</u></span></a></div></li></ul><div><br></div><di=
v><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"hig=
hlight" style=3D"background-color:transparent;"></span>Want to contribut=
e? We would appreciate help with the following areas:</span></div><ul><l=
i><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D=
"highlight" style=3D"background-color:transparent;"></span>We have sever=
al open issues for pseudo and limited maintainer time to work on them. H=
elp from someone familiar with systems programming in C would be greatly=
 appreciated. </span><a href=3D"https://bugzilla.yoctoproject.org/buglis=
t.cgi?list_id=3D661406&amp;priority=3DHigh&amp;priority=3DMedium%2B&amp;=
product=3DPseudo&amp;query_format=3Dadvanced&amp;resolution=3D---"><span=
 class=3D"color" style=3D"color:rgb(17, 85, 204);"><span class=3D"highli=
ght" style=3D"background-color:transparent;"></span><u>https://bugzilla.=
yoctoproject.org/buglist.cgi?list_id=3D661406&amp;priority=3DHigh&amp;pr=
iority=3DMedium%2B&amp;product=3DPseudo&amp;query_format=3Dadvanced&amp;=
resolution=3D---</u></span></a></div></li><li><div><span class=3D"color"=
 style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"backgr=
ound-color:transparent;"></span>There are a large number of intermittent=
 failures on our autobuilder, any help with investigating, reproducing o=
r solving these issues would be welcome! </span><a href=3D"https://valky=
rie.yocto.io/pub/non-release/abint/"><span class=3D"color" style=3D"colo=
r:rgb(17, 85, 204);"><span class=3D"highlight" style=3D"background-color=
:transparent;"></span><u>https://valkyrie.yocto.io/pub/non-release/abint=
/</u></span></a></div></li><li><div><span class=3D"color" style=3D"color=
:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-color:tran=
sparent;"></span>Many recipes in openembedded-core would benefit from a =
new recipe maintainer. Please look at </span><a href=3D"https://git.open=
embedded.org/openembedded-core/tree/meta/conf/distro/include/maintainers=
.inc"><span class=3D"color" style=3D"color:rgb(17, 85, 204);"><span clas=
s=3D"highlight" style=3D"background-color:transparent;"></span><u>https:=
//git.openembedded.org/openembedded-core/tree/meta/conf/distro/include/m=
aintainers.inc</u></span></a><span class=3D"color" style=3D"color:rgb(0,=
 0, 0);"><span class=3D"highlight" style=3D"background-color:transparent=
;"></span> and see if you can adopt any of the unassigned recipes.</span=
></div></li><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"=
><span class=3D"highlight" style=3D"background-color:transparent;"></spa=
n>For more ways to contribute, see </span><a href=3D"https://docs.google=
.com/document/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9owFuCWbzgjOk/edit?usp=3D=
sharing"><span class=3D"color" style=3D"color:rgb(17, 85, 204);"><span c=
lass=3D"highlight" style=3D"background-color:transparent;"></span><u>htt=
ps://docs.google.com/document/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9owFuCWbz=
gjOk/edit?usp=3Dsharing</u></span></a></div></li></ul><div><br></div><di=
v><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"hig=
hlight" style=3D"background-color:transparent;"></span>New to the projec=
t?</span></div><ul><li><div><span class=3D"color" style=3D"color:rgb(0, =
0, 0);"><span class=3D"highlight" style=3D"background-color:transparent;=
"></span>We have a list of issues we think are good places to start cont=
ributing: </span><a href=3D"https://bugzilla.yoctoproject.org/buglist.cg=
i?quicksearch=3DNEWCOMER"><span class=3D"color" style=3D"color:rgb(17, 8=
5, 204);"><span class=3D"highlight" style=3D"background-color:transparen=
t;"></span><u>https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3D=
NEWCOMER</u></span></a></div></li></ul><div><br></div><div><span class=3D=
"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D=
"background-color:transparent;"></span>Tracking Metrics:</span></div><ul=
><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span clas=
s=3D"highlight" style=3D"background-color:transparent;"></span>WDD 2647 =
(last week 2620) </span><span class=3D"color" style=3D"color:rgb(0, 0, 0=
);"><span class=3D"highlight" style=3D"background-color:transparent;"></=
span>(</span><a href=3D"https://wiki.yoctoproject.org/charts/combo.html"=
><span class=3D"color" style=3D"color:rgb(17, 85, 204);"><span class=3D"=
highlight" style=3D"background-color:transparent;"></span><u>https://wik=
i.yoctoproject.org/charts/combo.html</u></span></a><span class=3D"color"=
 style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"backgr=
ound-color:transparent;"></span>)</span></div></li><li><div><span class=3D=
"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D=
"background-color:transparent;"></span>OE-Core/Poky Patch Metrics</span>=
</div></li><ul><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0=
);"><span class=3D"highlight" style=3D"background-color:transparent;"></=
span>Total patches found: 1036 (last week 1054)</span></div></li><li><di=
v><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"hig=
hlight" style=3D"background-color:transparent;"></span>Patches in the Pe=
nding State: 145 (14%) [last week 145 (14%)]</span></div></li><li><div><=
a href=3D"https://valkyrie.yocto.io/pub/non-release/patchmetrics/"><span=
 class=3D"color" style=3D"color:rgb(17, 85, 204);"><span class=3D"highli=
ght" style=3D"background-color:transparent;"></span><u>https://valkyrie.=
yocto.io/pub/non-release/patchmetrics/</u></span></a></div></li></ul></u=
l><div><br></div><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);=
"><span class=3D"highlight" style=3D"background-color:transparent;"></sp=
an>Upcoming development releases:</span></div><ul><li><div><span class=3D=
"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D=
"background-color:transparent;"></span>6.1 M2:</span></div></li><ul><li>=
<div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"=
highlight" style=3D"background-color:transparent;"></span>Build Date: w/=
c 2026-07-20</span></div></li><li><div><span class=3D"color" style=3D"co=
lor:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-color:t=
ransparent;"></span>Release Date: w/c 2026-08-03</span></div></li></ul><=
li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D=
"highlight" style=3D"background-color:transparent;"></span>6.1 M3:</span=
></div></li><ul><li><div><span class=3D"color" style=3D"color:rgb(0, 0, =
0);"><span class=3D"highlight" style=3D"background-color:transparent;"><=
/span>Build Date: w/c 2026-08-31</span></div></li><li><div><span class=3D=
"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D=
"background-color:transparent;"></span>Release Date: w/c 2026-09-14</spa=
n></div></li></ul><li><div><span class=3D"color" style=3D"color:rgb(0, 0=
, 0);"><span class=3D"highlight" style=3D"background-color:transparent;"=
></span>6.1.0:</span></div></li><ul><li><div><span class=3D"color" style=
=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-c=
olor:transparent;"></span>Build Date (M4): w/c 2026-10-12</span></div></=
li><li><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span cl=
ass=3D"highlight" style=3D"background-color:transparent;"></span>Release=
 Date: w/c 2026-11-02</span></div></li></ul></ul><div><br></div><div><sp=
an class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highligh=
t" style=3D"background-color:transparent;"></span>Upcoming dot releases:=
</span></div><ul><li><div><span class=3D"color" style=3D"color:rgb(34, 3=
4, 34);"><span class=3D"highlight" style=3D"background-color:rgb(255, 25=
5, 255);"></span>YP 5.0.19</span></div></li><ul><li><div><span class=3D"=
color" style=3D"color:rgb(34, 34, 34);"><span class=3D"highlight" style=3D=
"background-color:rgb(255, 255, 255);"></span>Build Date w/c 2026-06-30<=
/span></div></li><li><div><span class=3D"color" style=3D"color:rgb(34, 3=
4, 34);"><span class=3D"highlight" style=3D"background-color:rgb(255, 25=
5, 255);"></span>Release Date w/c 2026-07-13</span></div></li></ul><li><=
div><span class=3D"color" style=3D"color:rgb(34, 34, 34);"><span class=3D=
"highlight" style=3D"background-color:rgb(255, 255, 255);"></span>YP 6.0=
.3</span></div></li><ul><li><div><span class=3D"color" style=3D"color:rg=
b(34, 34, 34);"><span class=3D"highlight" style=3D"background-color:rgb(=
255, 255, 255);"></span>Build Date w/c 2026-08-10</span></div></li><li><=
div><span class=3D"color" style=3D"color:rgb(34, 34, 34);"><span class=3D=
"highlight" style=3D"background-color:rgb(255, 255, 255);"></span>Releas=
e Date w/c 2026-08-24</span></div></li></ul><li><div><span class=3D"colo=
r" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"back=
ground-color:transparent;"></span>For future release dates, see </span><=
a href=3D"https://wiki.yoctoproject.org/wiki/Release_calendar"><span cla=
ss=3D"color" style=3D"color:rgb(17, 85, 204);"><span class=3D"highlight"=
 style=3D"background-color:transparent;"></span><u>https://wiki.yoctopro=
ject.org/wiki/Release_calendar</u></span></a></div></li></ul><div><br></=
div><div><span class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=
=3D"highlight" style=3D"background-color:transparent;"></span>The Yocto =
Project=E2=80=99s technical governance is through its Technical Steering=
 Committee, more information is available at:</span></div><div><a href=3D=
"https://wiki.yoctoproject.org/wiki/TSC"><span class=3D"color" style=3D"=
color:rgb(17, 85, 204);"><span class=3D"highlight" style=3D"background-c=
olor:transparent;"></span><u>https://wiki.yoctoproject.org/wiki/TSC</u><=
/span></a></div><div><br></div><div><span class=3D"color" style=3D"color=
:rgb(0, 0, 0);"><span class=3D"highlight" style=3D"background-color:tran=
sparent;"></span>The Status reports are now stored on the wiki at: </spa=
n><a href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status"><span cla=
ss=3D"color" style=3D"color:rgb(17, 85, 204);"><span class=3D"highlight"=
 style=3D"background-color:transparent;"></span><u>https://wiki.yoctopro=
ject.org/wiki/Weekly_Status</u></span></a></div><div><br></div><div><spa=
n class=3D"color" style=3D"color:rgb(0, 0, 0);"><span class=3D"highlight=
" style=3D"background-color:transparent;"></span>[If anyone has suggesti=
ons for other information you=E2=80=99d like to see on this weekly statu=
s update, let us know!]</span></div><div><br></div><div>Best regards,</d=
iv><div><br></div><div id=3D"sig133588112"><div class=3D"signature">Paul=
 Barker</div></div><div><br></div></body></html>
--c2c890e24ed0cb67ee7f7704658acf30e45d3ad2--

