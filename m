Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07551E909D0
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 15:52:58 +0000 (UTC)
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15165.1771343568243010642
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 07:52:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=D5JEmzfZ;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=g9NMQ2Rw;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 67175EC0018;
	Tue, 17 Feb 2026 10:52:47 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 17 Feb 2026 10:52:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1771343567; x=1771429967; bh=guD6V+FlcBFda/3ya97uP5oehRMz3xo3
	s2vy3yJW+YY=; b=D5JEmzfZ6+nY+vYU3JAa5yX/YhjsC4sYRSQ2Jg9ovy/aTFeR
	JNYMsXSoL7mEehN17x846M4avf+pSN+aqheJFvWp/1MZlPj6vzV0dxp+xmSwAmyc
	XvqhgzB3sfc7g0v7IURs6jknDSlZrN+e8Guaif1YY5Lgea88Fj1/jzZHuK7Vsivc
	2d/cxphiWo+utkEmmDEl08KHOsfC/R+bnVnKkoLw+lvaHap1AbI98d9zOYmYEyAW
	5wpxwxybkR7/N3ryTC38biPMFPLTCxXX/udqnSACj0yEkqS744RFv5B1kMtNpWig
	u/0RllBWIPJD95tiKP/EejR9Glr14/oqATlWhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1771343567; x=
	1771429967; bh=guD6V+FlcBFda/3ya97uP5oehRMz3xo3s2vy3yJW+YY=; b=g
	9NMQ2RwS9jmdi+HJwjrgwd6yz7sbMgcxtjVsLEPIdyfPlDhsHzWCGK7LXsMKoKRt
	Qd6hnkmmq1wgCc/JMqhwvThI8k/yBlEuodPany598i+cvlw3t/GRQRLDofYXfZqn
	G0qOKr5zYff7Wak1nLgGIw4ytOpHI0LfnEt0cTvs0PSGAr0LuaZhIIbW8D+BiEGW
	uc2/JQmuI6o91/IAJ8UsBfKf2TYWmTuxwL2oxf+Ws2rJ/0I6WVVVHRief5Cg8B3h
	kz+jdnmSHDnz0su3BkCAlwT7RflOgIu85TGeSqTHzlpNZ2xHT2TMwSc2+qhbNdC8
	hGS/pqfh6KMg4W1sCPtGg==
X-ME-Sender: <xms:z46UaYVmVGapzn5bikTZWCUauFQManG080PhGmQ4td_x2dm9cAUMnQ>
    <xme:z46UaVh-o0I4ZyMvuWdxGTKM2z7brWlu9N0ad2M0JDryEX2R5Aw7hBxESiX7OffQV
    Wt3sjee-igV1lQw-C2DxULHYeouLQSpacpkbCo7GbbCkxkAWxhH97w>
X-ME-Received: <xmr:z46UaX8jeWL6RAOyXN-P9w-cw1fx9Bg6jlIUSnZHy-a4ig_FDSQoVgb60vXKaptQ05ezYL3Te5IHKYfv71eF_peVakdEZI2acqer1Uj6RlQH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvddtudejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucgoufhushhpvggtthffohhmrghinhculdegledmnecujf
    gurhepkffuhffvffgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegrrhhk
    vghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpeduve
    elleefgfeuudejheefjeetkeejgffhkefftefgieekgfehhedulefhiefgtdenucffohhm
    rghinhepiihoohhmrdhushdphihotghtohhprhhojhgvtghtrdhorhhgpdhophgvnhgvmh
    gsvgguuggvugdrohhrghdphihotghtohdrihhopdhgohhoghhlvgdrtghomhenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrg
    hrkhgvrhdruggvvhdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohephihotghtoheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpd
    hrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghn
    vghmsggvugguvggurdhorhhgpdhrtghpthhtohephihotghtohdqshhtrghtuhhssehlih
    hsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehsjhholhhlvgih
    rdihphdrphhmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepphgruhhlsehpsggrrhhkvg
    hrrdguvghv
X-ME-Proxy: <xmx:z46UaXZ4_ZVXjxBQNY3v8PDwMLSILHOcchqdUO-FIaSguHUL5GvgyQ>
    <xmx:z46Uae2osUBHFPHeSf95BnwqkKsBp5hCzSLch8fL8KFEOLDqtIUz6Q>
    <xmx:z46UaaZK00068_LOmnO1e3mlE1xvitkmw6FgMMnxyNOlOic5_vUx_w>
    <xmx:z46UaeK7hSNybY2iO5VgtlEI8kfv3xliNI7GxqmrA-RD7U5CErz0WA>
    <xmx:z46UaX_9pCbsiznZ_wQlfISZuxBcbGj9g_VPye1vCvK_BoTgwnlZo-1_>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Feb 2026 10:52:46 -0500 (EST)
Message-ID: <207c307fe05f93e3f12a39fb93dab0cbdd77b6bf.camel@pbarker.dev>
Subject: Yocto Project Status 17 February 2026 (WW08)
From: Paul Barker <paul@pbarker.dev>
To: yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org, 
	yocto-status@lists.yoctoproject.org
Date: Tue, 17 Feb 2026 15:52:42 +0000
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-kWLtrU5RBeFnS0D1ugBg"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Tue, 17 Feb 2026 15:52:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/103


--=-kWLtrU5RBeFnS0D1ugBg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Current Dev Position: YP 6.0 M2
Next Deadline: YP 6.0 M2 Build Date 2026-02-16

Next Team Meetings:
- Bug Triage meeting - Thursday 19th Feb. 7:30am PDT
  (https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
- Weekly Project Engineering Sync  - Tuesday 17th Feb. 8am PDT
  (https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
- Yocto Project Patch Review - Thursday 19th Feb. 10am GMT and Monday 23rd =
Feb. 9am PDT
  (https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1)

Project data dashboard: https://dashboard.yoctoproject.org/=20

Key Status/Updates:
- YP 4.0.33 is awaiting approval
- YP 5.0.16 is in QA
- YP 6.0 M2 is due to build this week but is blocked by high priority
  bugs
- There are currently 5 high open bugs, which will block M2. Three have
  line of sight to being resolved:
    - rust do_test_compile/do_install segfault (#16058)
    - Generation of releases.json needs updating (#16138)
    - AB-INT: do_image_wic: tar command return exit status 2 (#16143)
- Two are currently needing further work:=20
    - x86 kvm broken on Fedora 43 (#16074)
    - AB-INT: opkg-build segmentation fault (#16078)
- We removed the bazaar, osc and cvs fetchers since they are obsolete
  and nobody should be using them
- We removed sysvinit compatibility support from systemd images since
  this will not be supported by upstream during the lifespan of our
  upcoming LTS release.
- We removed legacy tls support from openssl in the interests of
  providing better secure defaults.
- The number of intermittent failures affecting builds, both stable and
  development, continues to be problematic - we continue to prioritise
  addressing these since any given build is now statistically likely to
  hit one or more of them.
- Patch review is now using two branches:
    - =E2=80=9Cmaster-review=E2=80=9D  - patches which pass on the autobuil=
der and will
      be discussed on the patch review call
      (https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dmast=
er-review)
    - =E2=80=9Cmaster-backlog=E2=80=9D - patches which have been discussed =
and need
      further investigation or more detailed feedback which we haven=E2=80=
=99t
      had time for yet
      (https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dmast=
er-backlog)
- Patches are merging but there is a backlog and we=E2=80=99ve had to prior=
itize
  simpler changes. We continue to struggle for bandwidth for changes
  needing in depth review/feedback. This could impact features making it
  into the LTS.

Want to contribute? We would appreciate help with the following areas:
- We have several open issues for pseudo and limited maintainer time to
  work on them. Help from someone familiar with systems programming in C
  would be greatly appreciated.
  https://bugzilla.yoctoproject.org/buglist.cgi?list_id=3D661406&priority=
=3DHigh&priority=3DMedium%2B&product=3DPseudo&query_format=3Dadvanced&resol=
ution=3D---
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
- WDD 2941 (last week 2973) (https://wiki.yoctoproject.org/charts/combo.htm=
l)
- OE-Core/Poky Patch Metrics
    - Total patches found: 1108 (last week 1106)
    - Patches in the Pending State: 151 (14%) [last week 152 (14%)]
    - https://valkyrie.yocto.io/pub/non-release/patchmetrics/

YP 6.0 Milestone Dates:
- YP 6.0 M2 Build Date 2026-02-16
- YP 6.0 M2 Release Date 2026-02-27
- YP 6.0 M3 Build Date 2026-03-09
- YP 6.0 M3 Release Date 2026-03-20
- YP 6.0 M4 Build Date 2026-03-30
- YP 6.0 M4 Release Date 2026-04-26

Upcoming dot releases:
- YP 5.0.16 Release Date 2026-02-20
- YP 5.3.2 Build Date 2026-02-16
- YP 5.3.2 Release Date 2026-02-27
- YP 4.0.34 Build Date 2026-02-23
- YP 4.0.34 Release Date 2026-03-06
- YP 5.3.3 Build Date 2026-03-09
- YP 5.3.3 Release Date 2026-03-20
- YP 5.0.17 Build Date 2026-03-16
- YP 5.0.17 Release Date 2026-03-23
- YP 4.0.35 Build Date 2026-04-06
- YP 4.0.35 Release Date 2026-04-17
- YP 5.3.4 Build Date 2026-04-13
- YP 5.3.4 Release Date 2026-04-24
- YP 5.0.18 Build Date 2026-04-20
- YP 5.0.18 Release Date 2026-05-01
- YP 5.0.19 Build Date 2026-05-26
- YP 5.0.19 Release Date 2026-06-05

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


--=-kWLtrU5RBeFnS0D1ugBg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaZSOyhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bvMqAP9cV6jQ18YpjJqqSEGCMOW7Yr+MQseALWtz
nqudAjjz/gD/fl4OBH069m6aRcuotE9bqi4QWvBfh2QBIvYqq5ohpgU=
=IA5m
-----END PGP SIGNATURE-----

--=-kWLtrU5RBeFnS0D1ugBg--

