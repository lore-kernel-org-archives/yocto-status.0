Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70562F3C9AF
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 16:00:54 +0000 (UTC)
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23570.1771948845970342848
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 08:00:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=GATPck2a;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=SLQT85a5;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.148, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 21D97EC0620;
	Tue, 24 Feb 2026 11:00:45 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 24 Feb 2026 11:00:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1771948845; x=1772035245; bh=6lID7qVjL2
	dYlRB9Yem/z0jN85bo+KkTktd4rZOMngk=; b=GATPck2awfqlWX4rDhrignMaeN
	01YNTr47+xximvVeC1bLCjWvFyoCMLPxzbzuleAv1sI7317rAoUMoEI+bbHribYT
	pKUvvUcRKyksd+A90MW/DD/PvXBx+vAuISwp4pvhV6DAfXEPHxAcGlbVDQJMMB72
	ZjuhRpMe/1hLSM2n4DNCHgy+tkDWllXGXxcpWg50i/u25+TgEekocbWkuEm4UZCA
	abjOpv12AqR17JpwG4qdkDJ2P3yUM1od8E58oNuLTVjFi7zFusqO6bzb2vCXGaZt
	WnkaoFaKwbq2cP54JvSXHF+Zadivs9aCQISkYi5ScVQ6AvN0uYG30tFGwQ/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771948845; x=1772035245; bh=6lID7qVjL2dYlRB9Yem/z0jN85bo+KkTktd
	4rZOMngk=; b=SLQT85a5Hf1gzrUKhkLJbtyNe6+pUOBuAbbE4s4Jv5TkzI19xrt
	VCpiIPK+8hsF17toBUJx7bzEtpaIbFbTCT4/o7NMeblIcdSzTYlfMJgd0GhFAx1N
	fSmCR3x2OMU6VJoFBHcCP4XwY5arf5x6LYjua7Md1LY/6ae5irknjvDvvySGTRe3
	f2fKYZzcaS+ooHI0tXCvY51j5XzFeHB7zx5s8nY5w8xDlINwHh+8+Jp3tr/Q1hKT
	uUgCvHCH42PjpnmuYiq5jJ0eOFzrZU97WabQe2kH65rd6mEkMAmT7pDYmfN593YS
	0sT9V12QPbigFijBrrbsEzQBTjjCkTCX4HQ==
X-ME-Sender: <xms:LMudaSvdLEp-DR9xU3svgOsnZQ3LLNhkXHS_iJf4JpZ7vXD6mF9BdQ>
    <xme:LMudaXlOBBwxdoHvAcqQ5YF55559ReNihz_dMJTOluR-9MGt7N_pNF1q5_2jtveCq
    PGBIv2vosNtA4CxfyT5xCtBKUryAXYKLTIK0-rKcfy8_TDxu3R9ces>
X-ME-Received: <xmr:LMudaVsptX_r-JgdDaWhCHtl4kG7XCKUTAVKaQAqnMgO0ww3H_gWHwLsXZ427CvBI25lnznQ2FmciICKC0q3iFrgQmm2KVOQivTYuB3g9qp9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgedtheekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepfeeileehudffvdeljedvgfetieeugfetteekfe
    dtgeeggfevtddutddvheegfeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtth
    hopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeihohgtthhosehlihhsthhs
    rdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehophgvnhgvmhgsvgguug
    gvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphht
    thhopeihohgtthhoqdhsthgrthhusheslhhishhtshdrhihotghtohhprhhojhgvtghtrd
    horhhg
X-ME-Proxy: <xmx:LMudaVceXZDN6804Pu3wBf0kIwtnuonLjWqY7BFxbDeiO5sHVGHxwA>
    <xmx:LMudadwiBvnWNCt4_ugKxUa_3YXwGGuluyoT-vTdiNX3bZ_TgwrJZQ>
    <xmx:LMudabGN3k5rveUElg6EXys9AZtZ_YxScFocsKhIXPjgji2efk0-7Q>
    <xmx:LMudaRyQfFJ0TF5yEgpqZpNo94I0-d-v8hak4mrhyDqgIJ6hjDWgmw>
    <xmx:LcudaYXv2m3Vo3rX6sQYaEgYz2IIhWNv-pWAYEqLSotgXJXaVwWzumsm>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Feb 2026 11:00:44 -0500 (EST)
Message-ID: <fcf66960ba997a5d5b74ac627239402cb2c67743.camel@pbarker.dev>
Subject: Re: Yocto Project Status 24 February 2026 (WW09)
From: Paul Barker <paul@pbarker.dev>
To: yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org, 
	yocto-status@lists.yoctoproject.org
Date: Tue, 24 Feb 2026 16:00:40 +0000
In-Reply-To: <c63eaa63b1ceb0f3a78148a6594152889ab9dabc.camel@pbarker.dev>
References: <c63eaa63b1ceb0f3a78148a6594152889ab9dabc.camel@pbarker.dev>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-D0QhabFHsnYnvC4TYXNc"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Tue, 24 Feb 2026 16:00:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/105


--=-D0QhabFHsnYnvC4TYXNc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-02-24 at 15:28 +0000, Paul Barker wrote:
> Key Status/Updates:
> - YP 4.0.33 is due for release
> - YP 5.0.16 is in QA
> - YP 5.2.3 is queued for QA

5.3.2, not 5.2.3, obviously. Thanks Peter for catching this and letting
me know!

Best regards,

--=20
Paul Barker


--=-D0QhabFHsnYnvC4TYXNc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaZ3LKBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bp/BAQDND/8dVgcGBONR0Oj2Uoc8+Dv5X0dkx7Gf
V7cPAg7R3gD+LfSMKcmLGI7KACYs/mKpM6S1efl9y86Fvvl6r0Y0qAY=
=oDlU
-----END PGP SIGNATURE-----

--=-D0QhabFHsnYnvC4TYXNc--

