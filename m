Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12EE5107637F
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:25:01 +0000 (UTC)
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14489.1775053497374340996
 for <yocto-status@lists.yoctoproject.org>;
 Wed, 01 Apr 2026 07:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=BZayCh8a;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=fQ8o8VHv;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.150, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 6E5331D000DD;
	Wed,  1 Apr 2026 10:24:56 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 01 Apr 2026 10:24:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1775053495; x=1775139895; bh=zm9f/jl/+1pIeQRfNdZyoy4PS20fA5qk
	JgSHe1UqWmQ=; b=BZayCh8aKw8ck+70e5prmtswv64+95DUO709BvoJMWMUpe2D
	vZJb1TySo2h/L5sLHe481nv0jEIX9Bxs6OJLcq9P7lEiEFkZrDmNPWKikOdwh2SP
	3TeCgS1KPwTW/s/18D38vDiHhDU7RlZSlzi3fSpDGol02XEFWjJJBQvrqNSsHzYF
	ICDipJIvdJ+I9LAFScI1/uBIbwoITg6D6q5Z+P1yeMoY9EQajxr6z4n1OH4qfDf/
	48PBunqYypTIrPfOSYL5HrmlFx0cE8fXbCLRDumcUbEnRiHESf7sY/0nhA+KF3+W
	S337H/asfkjmchctvhuQLaU/n33RaUICG6aJIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775053495; x=
	1775139895; bh=zm9f/jl/+1pIeQRfNdZyoy4PS20fA5qkJgSHe1UqWmQ=; b=f
	Q8o8VHvd5BXqBt0XL5bfwyFWKdgrmHszPWflLMXK01GkQDz5wYgBc6RgEufYsXtI
	ZDliSU4a/bbOiB1bYz0tuCajXwNAcLMF7kFoGghMKteCtMUVcMytWmMTaFe5ybb5
	KPbT/DZ5iuvZ1a/8k4mxRucjBzB2lN6fe2Vg2Ldj33JPpBMH8wbadMLrPuDTVfz3
	c3X90gDGzTAPlcRvee9ARXOkY1X/slmx+R7qjtuVx+WTHA7BDGZmshi8xCaLFIsW
	3aZbYHoXa+/3IROSfiTYIGc+P4hZzbLOr+7jjrT09PlXIQdCXyk0sIPL8AB6wEs+
	vhBE3nUj37al9SnJNTnWQ==
X-ME-Sender: <xms:tyrNaXzrwYdUaHo_xTDtSiy7sJhcfwUhHOlAHJMsfOZao0x5VLaqUw>
    <xme:tyrNaaPKojQlIp7FTk7hmlijWM7nJcHRzzuh_HrCAgh-DM8umDs5b-IK7aDpjYogM
    gUxLj1BmCfza-MZ0Syz3vZoc3_dtND81w3jga_Y1nD5udsFy69OWlc>
X-ME-Received: <xmr:tyrNaQUwq-H3Jkh0oW_vHO-nPo8JBWft73bkZeX8LME1TNojosrHy67x-zHrtCj9GMvCwYAxL-vF9BF5dQJOOGkTioslzV0qXuadlbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeffeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epkffuhffvvefftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceurghrkhgv
    rhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnhepjefgge
    ffvdeljeeijeeifeejheeiudeiheeffeduvdeujedvkedtgeegheetveejnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrh
    hkvghrrdguvghvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopeihohgtthhosehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprh
    gtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgv
    mhgsvgguuggvugdrohhrghdprhgtphhtthhopeihohgtthhoqdhsthgrthhusheslhhish
    htshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohephihorghnnhdrtgho
    nhhgrghlsehsmhhilhgvrdhfrhdprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivg
    eslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehsjhholhhlvgih
    rdihphdrphhmsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:tyrNaW30cXysI5tQjKtfAilHTWdSOgm8Ss6p3vz7nQgwHUxoZ8dmLA>
    <xmx:tyrNaWrc3iPWS-8AIwuRXQpsMPL5v22bVEQ7QTfP4x1dfEBatss96g>
    <xmx:tyrNaVWDUixYD0qUbUVNmphr7XDt4BJyEeydOwaaFfiuElY-CLJiqw>
    <xmx:tyrNaZYdMRGvWEJ4hDlaiK4XJGLlRibokzhSM3Q14sLYzLffdKE3Bg>
    <xmx:tyrNaZ08zYlM5I5werGll9J7tOx53lDzfxAk5RYL4i_bSHMQQPhkMR3a>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Apr 2026 10:24:54 -0400 (EDT)
Message-ID: <b2b22dae656f5f415374964c3ae94e2ce0bb3434.camel@pbarker.dev>
Subject: Yocto Project release dates for May 2026 to April 2027
From: Paul Barker <paul@pbarker.dev>
To: yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org, 
	yocto-status@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>, Richard Purdie
 <richard.purdie@linuxfoundation.org>, Stephen Jolley
 <sjolley.yp.pm@gmail.com>
Date: Wed, 01 Apr 2026 15:24:44 +0100
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-7aw5kPhXXPHgIC+QH6T2"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Wed, 01 Apr 2026 14:25:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/114


--=-7aw5kPhXXPHgIC+QH6T2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm happy to propose the following Yocto Project release dates, covering
the period of May 2026 to April 2027.

In order to make planning easier for downstream users, we're setting
these dates for a full year instead of just 6 months. The increased
horizon, and the focus on getting ready to build 6.0 M3 does mean that
there's been a little delay getting the dates out, but this should
hopefully put people in a good place to plan now.

We will review these again in 6 months time to see if any adjustments
are needed to the 2027 dates. I'd also like to get dates in the calendar
up to Nov 2027 some time in October this year.


Notes
=3D=3D=3D=3D=3D

- All dates are **week commencing**, the exact day the release is
  published depends on TSC availability to approve releases and time
  taken to upload release artifacts.

- Releases will be built 10-14 days before the target release date to
  give time for QA and review.

- We aim for 6-7 weeks between releases in each series, occasionally
  there will be an 8 week gap due to things like Christmas/New Year
  vacations.

- We aim for 4 weeks between .0 and .1 releases to allow us to get any
  necessary fixes out for the new series.


Feedback
=3D=3D=3D=3D=3D=3D=3D=3D

Please review these and let me know if you have any feedback before the
next weekly tech call on Tues 7th April.

I'd especially like to know:
  **Is 12 months of dates beneficial to you, vs just having 6 months?**

It does take more coordination to plan with a longer horizon.


5.0 "scarthgap" series
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

5.0.18  : w/c 2026-05-25
5.0.19  : w/c 2026-07-13
5.0.20  : w/c 2026-08-31
5.0.21  : w/c 2026-10-19
5.0.22  : w/c 2026-12-14
5.0.23  : w/c 2027-01-25
5.0.24  : w/c 2027-03-08
5.0.25  : w/c 2027-04-19


6.0 "wrynose" series
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

6.0.0   : w/c 2026-05-04
6.0.1   : w/c 2026-06-01
6.0.2   : w/c 2026-07-06
6.0.3   : w/c 2026-08-24
6.0.4   : w/c 2026-10-12
6.0.5   : w/c 2026-12-07
6.0.6   : w/c 2027-01-18
6.0.7   : w/c 2027-03-01
6.0.8   : w/c 2027-04-12


6.1 series
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

6.1 M1  : w/c 2026-06-22
6.1 M2  : w/c 2026-08-03
6.1 M3  : w/c 2026-09-14
6.1.0   : w/c 2026-11-02
6.1.1   : w/c 2026-11-30
6.1.2   : w/c 2027-01-04
6.1.3   : w/c 2027-02-22
6.1.4   : w/c 2027-04-05


6.2 series
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

6.2 M1  : w/c 2026-12-21
6.2 M2  : w/c 2027-02-01
6.2 M3  : w/c 2027-03-15
6.2.0   : w/c 2027-05-03


Best regards,

--=20
Paul Barker


--=-7aw5kPhXXPHgIC+QH6T2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCac0qrBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0brZWAP9K2mbLTwbHxfUAGE2X66uaEztKVFklf7Pm
3ipZYb/CLwEAvYXLIVkKKjusnPFok8GI8K4/b9a+MrWyRDW+G4kbcgQ=
=3dGl
-----END PGP SIGNATURE-----

--=-7aw5kPhXXPHgIC+QH6T2--

