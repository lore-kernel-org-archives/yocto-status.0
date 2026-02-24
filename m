Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E9EF3C99C
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 15:28:54 +0000 (UTC)
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22787.1771946926549570388
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 07:28:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=b4cklXXO;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=syNUsDlQ;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 661FD1400168;
	Tue, 24 Feb 2026 10:28:44 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Tue, 24 Feb 2026 10:28:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1771946924; x=1772033324; bh=Mb8oGBiIo7QtsofO/AuH1wXYFcbt+ioo
	Eh1evXhU+D0=; b=b4cklXXOgmfvHtZjprInSwK/5pEcTsIlQtACYpgZF56reikj
	HSKB8AQyS+vmrsgUBttAPr2tsDuAC+/gw8vTM8T3ehqF9az/Z9f2eFMMXapoeCpb
	sazxTjoKtrl0KGsoMq7PztnTZBAakfbAhDg7FSQd57PAZssJqooN2nTdlFlZ1Akv
	Vc5gMiaw7WNKvUKw8SB/y0JSTaZIpmNUTVuPGTbxN3uvB95hDASyziaMEHNjdXyf
	YpPAgrfhA6YRUV4vcgoEdJi5I77TM3l9VEtDt+d1zY3INqz+TJmAV5iO+Wivl66r
	PtJxnkuUwvn6lPpY0Om8x4wwi+ZzfP4q2UEx+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1771946924; x=
	1772033324; bh=Mb8oGBiIo7QtsofO/AuH1wXYFcbt+iooEh1evXhU+D0=; b=s
	yNUsDlQV821U3Jwwxs5RcBmkTlhKEVbLqSzcdZcx550inbtNzGsei0OiCcdX5jWy
	IKo64EDHu3gtqn4UBLWQnfIe6ByUJA7goxZKLBg03cm8RD3M0dQt/WUtUO+nlhWD
	kFU0bjPaLrRI5QnjBrDYcb5UmjaM/+N0+KMj5QeuV9Sr1OBSaG5WMKysCA5Ub8A4
	B88LSLE45XeeMXKtSz4ko4SGNfoD8y6nRoJOm/tU+ne1a+ovDeX4ibVR7t5AvJxO
	mITdNM1HodUDHbie63Qg1Ij5cn4xwkimQiaLxEpSVL50ae4oIm87GlWituh/ktDr
	jpCE7XZr/oXQWKKrWvI+g==
X-ME-Sender: <xms:rMOdadKNHOoV61mWw0LFNhpUFEot9CCD2IC1SjW1It22jqRYiZfEPQ>
    <xme:rMOdaUlcwX1Z3W_kodsMuMkADP0tQWFHnvxtp8_DSknCNjClsGZEU2zzaCmhN2FgH
    _CyJOugahatyL2MzrlzuVFbUZ7XbGtKoSosOrqSQ2oZhfnIbJGlU58k>
X-ME-Received: <xmr:rMOdaZP0dC0D94qrXt1Mpx2qYl1vK6TChh0jmqiSeL0T1fNs-s_zfY4UKWaFoYaYIDchQOS-yMTrbmo57wY42bfumatQ3rAKSIawvQ_AkoDu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgedtheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucgoufhushhpvggtthffohhmrghinhculdegledmnecujf
    gurhepkffuhffvffgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegrrhhk
    vghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpeefue
    dvleduvdejvdeuiedviedtjeeludfgleffteelhffgkeefvdelfedvvdeitdenucffohhm
    rghinhepiihoohhmrdhushdphihotghtohhprhhojhgvtghtrdhorhhgpdihohgtthhord
    hiohdpohhpvghnvghmsggvugguvggurdhorhhgpdhgohhoghhlvgdrtghomhenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrg
    hrkhgvrhdruggvvhdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohephihotghtoheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpd
    hrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghn
    vghmsggvugguvggurdhorhhgpdhrtghpthhtohephihotghtohdqshhtrghtuhhssehlih
    hsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehsjhholhhlvgih
    rdihphdrphhmsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:rMOdaS0bOXsZdTxJI2dTUyAt21U1fABYQkY4TujwPjyitrVueVZ6WQ>
    <xmx:rMOdaQmTSXwZmShNXpuFww8Rq1Hvhtd94S_uW8q80v54oqi_0jiR_g>
    <xmx:rMOdaRXbWuWWUVDklRZMFXVahDwP7amTtH7X79qb3UtjlHwNW7aIjQ>
    <xmx:rMOdaevi9apg5Qn9o1-Q387ev3ueARzLJtpeF5B2CFKZiL6lzTk3PA>
    <xmx:rMOdaedZcyh-i9v_LeyKVJAEcCVs28ZyOcwzPdcPyEuljCIKmWKVQh-q>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Feb 2026 10:28:43 -0500 (EST)
Message-ID: <c63eaa63b1ceb0f3a78148a6594152889ab9dabc.camel@pbarker.dev>
Subject: Yocto Project Status 24 February 2026 (WW09)
From: Paul Barker <paul@pbarker.dev>
To: yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org, 
	yocto-status@lists.yoctoproject.org
Date: Tue, 24 Feb 2026 15:28:39 +0000
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-/KU88/im0rFsW6Mzlx2d"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Tue, 24 Feb 2026 15:28:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/104


--=-/KU88/im0rFsW6Mzlx2d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Current Dev Position: YP 6.0 M2
Next Deadline: YP 6.0 M2 Build Date 2026-02-16

Next Team Meetings:
- Bug Triage meeting - Thursday 26th Feb. 7:30am PDT
  (https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
- Weekly Project Engineering Sync  - Tuesday 24th Feb. 8am PDT
  (https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
- Yocto Project Patch Review - Thursday 26th Feb. 10am GMT and Monday 2nd M=
ar. 9am
  (https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1)

Project data dashboard: https://dashboard.yoctoproject.org/=20

Key Status/Updates:
- YP 4.0.33 is due for release
- YP 5.0.16 is in QA
- YP 5.2.3 is queued for QA
- YP 6.0 M2 is due to build when we have patches merged
- We have two open high issues which need further work that will block M3:=
=20
    - x86 kvm broken on Fedora 43 (cpu features issue?) (#16074)
    - AB-INT: opkg-build segmentation fault (memory corruption in
      pseudo?) (#16078)
- We also have issues we need to resolve before release:
    - Allowing non-destructive git fetcher updates for bitbake-setup
    - Splitting wic into an external tool
    - Kernel rust support
    - Switching to pkg-config
    - Deprecation of ltp (upstream dropped runltp and mandate kirk)
    - How to improve DEBUG_BUILD?
    - DISTRO_FEATURES changes to =E2=80=98nodistro=E2=80=99 in OE-Core
    - SBOM/cve-check changes
- We updated =E2=80=9Cnodistro=E2=80=9D to use 3 of the include files poky =
was already
  using:
    - Space optimization to reduce build footprint and sstate object
      size
    - Disabling most static libraries by default (build size/speed wins)
    - Enabling security flags by default
- =E2=80=9Cnodistro=E2=80=9D now also enables uninative by default to allow=
 for better
  CDN sstate reuse
- Distros now need to use INIT_MANAGER to select their preferred init
  system with the default being systemd for =E2=80=9Cnodistro=E2=80=9D. Pok=
y=E2=80=99s defaults
  remain unchanged and we don=E2=80=99t have plans to change this at this t=
ime
  due to the work involved and impact (e.g test result comparisons).
- The number of intermittent failures affecting builds, both stable and
  development, continues to be problematic - we continue to prioritise
  addressing these since any given build is now statistically likely to
  hit one or more of them.
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


--=-/KU88/im0rFsW6Mzlx2d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaZ3DpxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bvXiAPwKLv4CsjhZKxbUchr4BpAD3eVE9pwKDfGg
dNEKjVbscwD+P1ESJ7tyUJeH6OnGIsvRCtHVRMnG+A6ifGDWvHWebwY=
=4uX3
-----END PGP SIGNATURE-----

--=-/KU88/im0rFsW6Mzlx2d--

