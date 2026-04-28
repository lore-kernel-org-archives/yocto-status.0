Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A06FF8874
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 14:53:35 +0000 (UTC)
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14983.1777388011452649470
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 07:53:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=Xn76xZHU;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=huVmb/fE;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.153, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 919301400053;
	Tue, 28 Apr 2026 10:53:30 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 28 Apr 2026 10:53:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1777388010; x=1777474410; bh=MhfDJPauhldSRumAolVtYVy9H8305BzW
	ebIGDdloGKU=; b=Xn76xZHU7g1jBYXa4/Iug5AdwJi5t91ouwBkUPfhkTbdSsIo
	GTDhWr4yFBwu4MMi8Qxmty7U84keEjATXcxUljn7x9liU9ksqEirHmJqhcxekG00
	+Chph1nU7FwQHYfUdXPEPrB1EzQui7BsTcw0zk0BZs66+wTNkqJB5VHJLRZ48GNr
	nv5s30fGLTFOGZyusTM0yvrEArpuNTfsExhnX5fw3PFObRmUWYfU1152fGgIBPpM
	KBvW7EnumnsC5igEKJh/QX5My5gbnB4hZUM7mW5yqBVdaHNpI6+aiMYG3rBT2Lb1
	ww1P00mn4XD9BkvAPivCSnhdyD+g70YxQ16OVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777388010; x=
	1777474410; bh=MhfDJPauhldSRumAolVtYVy9H8305BzWebIGDdloGKU=; b=h
	uVmb/fE5HnIWBnST0kbiMA8NxSkCaTmVw4QMghxk1NBE+5UoFKIiK/bO0n2mGJEe
	zZTOy2Y4d6NJ5oy8h0Jg7B9t3qcnErbMOhEioK6e8Q6dkLg5nI6aLQEABmxLFRnV
	tc+sznRL3wxSY4qHuLoovEilX0a9FPkLAaTR5sM+y/HFJ0C0Ygs7Zv08xoCtVOME
	ErBZe9GkFOvngtKMLK52Me9M1qlSn+ZZqVVqIQAc0mWHPZTC38ENFNUph7rs2QKx
	z3VoX/X91qaMuUKJAu1pdjsFe+sRNuF+iscIscjk35bNC0pawAVYHTIym6JgF7K8
	AXNruqg7mHcWhXEAOY3kw==
X-ME-Sender: <xms:6snwaaBI7KzWjOblxDeS8bYKfHStzvUoBje_ieN8KBC9KJENmjwWpg>
    <xme:6snwaf_58Ot94e8kw1NmAZsSYQMfs0wFnGufPkU1g9F6EYYjTnikxHnaqhmEY_BIX
    g0lAu07vrz11p-vVC9_E9Ly8q8PKxGEun0rVNumBDnij6ytkV0l9H8>
X-ME-Received: <xmr:6snwaRGfNBfLhXq5ongkPGbJVRmJrArR-2vRc392opcKV6cTgsj3C_Ao7otxuYHPqTbMCFM_1ceB8pR0MCPMu9IIS1IORypfoOZaJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekudekhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecuogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjug
    hrpefkuffhvffftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceurghrkhgv
    rhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnhepteetgf
    ekfffhvdefueektddutdevhedvfeehfeejheduleelgedujeekleejgfefnecuffhomhgr
    ihhnpeiiohhomhdruhhspdihohgtthhophhrohhjvggtthdrohhrghdpohhpvghnvghmsg
    gvuggvugdrohhrghdphihotghtohdrihhopdhophgvnhgvmhgsvgguuggvugdrohhrghdp
    ghhoohhglhgvrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopeeg
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeihohgtthhosehlihhsthhsrdihoh
    gtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdq
    tghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhope
    ihohgtthhoqdhsthgrthhusheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
    pdhrtghpthhtohepshhjohhllhgvhidrhihprdhpmhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:6snwadPmKaUoKJ6I_rqIm0lAAa5L6BsFFDQ7G7GJF9TJRziZgXJHVA>
    <xmx:6snwabdsz182VQ2xrEpxZgaGxXfQoNkHfdO82otAFkE7BsYSsH2Fyw>
    <xmx:6snwaSveUpfFbkS6HennQNsIsBUXTxp69yqFGod0RVTFj4ZX3U0FYA>
    <xmx:6snwaUn3nDDAc4RfU1P8EKqNqBfqEFPFosUlNf9eU0PtZepTxdqhkQ>
    <xmx:6snwaRGbIoC8bXCSJA54uDCjFs6Ci4BtnOM0RKC9P0gHD7LJ25ip9lq->
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Apr 2026 10:53:29 -0400 (EDT)
Message-ID: <15a043cafb56dfbcf587dd830ab068309af8a467.camel@pbarker.dev>
Subject: Yocto Project Status 28 April 2026 (WW18)
From: Paul Barker <paul@pbarker.dev>
To: yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org, 
	yocto-status@lists.yoctoproject.org
Date: Tue, 28 Apr 2026 15:53:23 +0100
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ld7jhsqWTCRz5kFbOOOe"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Tue, 28 Apr 2026 14:53:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/119


--=-ld7jhsqWTCRz5kFbOOOe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Current Dev Position: YP 6.0 M4
Next Deadline: YP 6.0 Release Date w/c 2026-05-04

Next Team Meetings:
- Bug Triage meeting - Thursday 30th Apr. 7:30am PDT
  (https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
- Weekly Project Engineering Sync  - Tuesday 29th Apr. 8am PDT
  (https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
- Yocto Project Patch Review - Thursday 30th Apr. 10am GMT
  (https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1)

Project data dashboard: https://dashboard.yoctoproject.org/=20

Key Status/Updates:
- YP 4.0.35 is due to release
- YP 5.3.4 is in QA
- YP 6.0 rc1 is in QA
- There will be no patch review on Monday 4th May due to public
  holidays.
- We continue to triage the CVEs being reported by the new tooling.
- There were some last minute changes to DISTRO_FEATURES behaviour to
  resolve some usability issues that users identified.
- There have been several issues in pseudo identified and these have
  been fixed in the various pseudo point releases. We will upgrade
  pseudo in 6.0.1 to pull these in.
- There have been issues with 403 errors from crates.io, there is a
  change in bitbake to use the preferred upstream urls via their CDN.
- The kvm cpu features issue looks to be a host system CPU microcode
  issue and using the latest microcode appears to have resolved the
  issues.
- git:// protocol access to git.yoctoproject.org and git.openembeded.org
  is deprecated and going forward https:// URLs should be used to access
  git repositories. We are aiming to discontinue git protocol use.
- We=E2=80=99re working through the backlog of patches and intermittent bui=
ld
  failures are still problematic. We continue to struggle for bandwidth
  for changes needing in depth review/feedback but are trying to clear
  the backlog.

Want to contribute? We would appreciate help with the following areas:
- We have several open issues for pseudo and limited maintainer time to
  work on them. Help from someone familiar with systems programming in C
  would be greatly appreciated.
  https://bugzilla.yoctoproject.org/buglist.cgi?list_id=3D661406&priority=
=3DHigh&priority=3DMedium%2B&product=3DPseudo&query_format=3Dadvanced&resol=
ution=3D
- There are a large number of intermittent failures on our autobuilder,
  any help with investigating, reproducing or solving these issues would
  be welcome! https://valkyrie.yocto.io/pub/non-release/abint/
- Many recipes in openembedded-core would benefit from a new recipe
  maintainer. Please look at
  https://git.openembedded.org/openembedded-core/tree/meta/conf/distro/incl=
ude/maintainers.inc
  and see if you can adopt any of the unassigned recipes.
- For more ways to contribute, see
  https://docs.google.com/document/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9owFuCW=
bzgjOk/edit?usp=3Dsharing

New to the project?
- We have a list of issues we think are good places to start
  contributing:
  https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DNEWCOMER

Tracking Metrics:
- WDD 2788 (last week 2790)
  (https://wiki.yoctoproject.org/charts/combo.html)
- OE-Core/Poky Patch Metrics
    - Total patches found: 1085 (last week 1078)
    - Patches in the Pending State: 146 (13%) [last week 147 (14%)]
    - https://valkyrie.yocto.io/pub/non-release/patchmetrics/

Upcoming dot releases:
- YP 4.0.35 is in review.
- YP 5.3.4 is in QA
    - Release Date 2026-05-06
- YP 5.0.18
    - Build Date   2026-05-11
    - Release Date 2026-05-25
For future release dates, see
https://wiki.yoctoproject.org/wiki/Release_calendar

The Yocto Project=E2=80=99s technical governance is through its Technical
Steering Committee, more information is available at:
https://wiki.yoctoproject.org/wiki/TSC

The Status reports are now stored on the wiki at:
https://wiki.yoctoproject.org/wiki/Weekly_Status

[If anyone has suggestions for other information you=E2=80=99d like to see =
on
this weekly status update, let us know!]

Best regards,

--=20
Paul Barker

--=-ld7jhsqWTCRz5kFbOOOe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCafDJ4xEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bqpuAQDR3NvVAWNfoZDai2ARuWcn1HRKc+qpfBsL
0RZpICplTAEA/wXH/XPpZP/YhWm8dkB7inFvcvoilRQnRo4K82WotwE=
=bah9
-----END PGP SIGNATURE-----

--=-ld7jhsqWTCRz5kFbOOOe--

