Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA6B10F9302
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 20:46:13 +0000 (UTC)
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1203.1774989971662034019
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 31 Mar 2026 13:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=KS6aDtk3;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=ERsCRDLr;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.150, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id D2717EC026C;
	Tue, 31 Mar 2026 16:46:10 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 31 Mar 2026 16:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1774989970; x=1775076370; bh=sssF3oi12k
	Ow+6JCzxXpj1J0Ra7MpQpn+0UZdNFd0Fk=; b=KS6aDtk3BdmDg7AgwnqLwcSUaN
	pecY/DIt/bgbWX0OTg0qeOdTlJNd8KztUdKAjWGamtwPbiz6VxXzB18DUYlu4f51
	/C7d6bPXM7I85ZxjWjRovy4vAdjrX1p2kMaoFs4Z4jY0txL84F4ynBGdGPCsCV8I
	3m7MQvVW2FdFPJLanlmdNS00rCcRt7TqZCm+lFuSW464miK9CBMr6I71uNRSApFq
	NWrJp54YgfsvvYwW/FPM548RtF7et5pulHXfOentPNh76Pg1MpqQXGJT1iZc4Ojw
	M2XldWPZTgccoInBOParq2su1bt/w9ESbW/gvWKk7i6lMP0QqjE9HDHIwKFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1774989970; x=1775076370; bh=sssF3oi12kOw+6JCzxXpj1J0Ra7MpQpn+0U
	ZdNFd0Fk=; b=ERsCRDLrooK2uGwac+dExNoiSwcWjJVwLvYuyRQkGJRM7pajq+5
	oKAPCB43+RkEijLngwrRuTVh9UzTUdWOdSvpUuMynOa8PrXhBsi7mKXGekUeeYng
	VLmVNh0+l+ZQAwfkMGts5ruu1uiSZTk0h/ugOkBv5HD8ydxd8oSoxLnalIlocVIv
	SBBLJgHCTXrsu/2p1wNvOS4B5j7geZtgOiRYkrAJG0J0LSY3zOotxGD3yfvuvmcR
	5lMh44V1qFEBGitAHnJJ2Fe6AYCBQcqPiLuf+OjCfjm7HCCUYwnznCwhAbwS4eHU
	RTnMb+DmK8IkvUY0+ElFavKCovYx8n+e9wQ==
X-ME-Sender: <xms:kjLMaXlkvLGQCNnosAuaEhJyQG5a4QOxhn81amQBXhc_8M_-GdBNuA>
    <xme:kjLMaTzXA4GXFBDvo50-GEH4NJu3a7giLlvFAHPRVTOP-JRLSR3yhpccECag_gjCQ
    yILFugNzdI-5YsL2Ox2HtDCt34YyASZAM3biBTAV5tqi-Vb1Kxm5lY>
X-ME-Received: <xmr:kjLMaZPUiytdl_Zd819E68w2wqkqQ2TsigctVHYt8cozjMjn5q_2pHudP8-dHjwq0tHrKfzTrZVa8H1YXzLL6_MeNbwmbvZKBYLbwoU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucenucfjughrpefkuffhvfevffgjfhgtfgggsehgtderredtre
    ejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghrrdgu
    vghvqeenucggtffrrghtthgvrhhnpeejudefvdfhheevtdduledvleejieehieevffelhe
    fffedtgfduvdevjeekheffhfenucffohhmrghinhephihotghtohhprhhojhgvtghtrdho
    rhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepph
    gruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopeehpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopeihohgtthhosehlihhsthhsrdihohgtthhophhrohhjvg
    gtthdrohhrghdprhgtphhtthhopeifmhhinhgvrheslhhinhhugihfohhunhgurghtihho
    nhdrohhrghdprhgtphhtthhopeihohgtthhoqdhsthgrthhusheslhhishhtshdrhihotg
    htohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepshhjohhllhgvhidrhihprdhpmhes
    ghhmrghilhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvse
    hlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:kjLMafrVepRQu9reaSDM_sDEc4yniWvTeQ6taRLPCpwWra8ib4Fg4A>
    <xmx:kjLMaSESx-szr860pCk7BlwetwWxoq21BX6dYRwigoZYQmzShywloQ>
    <xmx:kjLMacrNZXYaJTGHjlLPJOoBrqq53dcqhQVu6eOQEtQv2jRh1Y9nvQ>
    <xmx:kjLMaTbq6Sj4_Su8NKBcKDIp5FxSQaXur7Br9S8yt_wXWxXwb20F6w>
    <xmx:kjLMabc0p-TW5I5Q2ulTh85Xt9SfbvLHbubKsM5ZYMOJraHB9ga6Okn1>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 16:46:09 -0400 (EDT)
Message-ID: <2e1a0b2cc85c50c4f6090bcb4067c750a4a3b58c.camel@pbarker.dev>
Subject: Re: [yocto-status] [yocto] Yocto Project Status 31 March 2026 (WW14)
From: Paul Barker <paul@pbarker.dev>
To: yocto@lists.yoctoproject.org, wminer@linuxfoundation.org, 
	yocto-status@lists.yoctoproject.org
Cc: sjolley.yp.pm@gmail.com, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Mar 2026 21:46:05 +0100
In-Reply-To: <CAC_dYdoTbrG-8f2tAYVa5DdHVWYCbr-RR2F13vdqjJwch=7-ow@mail.gmail.com>
References: 
	<CAK5yBb-sFQWmxJHc2MPrSRMWhFRsMFUrm69vtT6FxNV8zL+Ktw@mail.gmail.com>
	 <debd57881df9f7bb1681ff140d35869f81e17fcd.camel@pbarker.dev>
	 <CAC_dYdoTbrG-8f2tAYVa5DdHVWYCbr-RR2F13vdqjJwch=7-ow@mail.gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-2IQXJBb0O1n1crvMRhkm"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Tue, 31 Mar 2026 20:46:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/112


--=-2IQXJBb0O1n1crvMRhkm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-03-31 at 15:58 -0400, Walt Miner via lists.yoctoproject.org
wrote:
> When will we see the plan for after June 5?

Hi Walt,

This is on me. I have provisional dates, I need to make sure they're ok
then get them sent to the list. I've been focused on blocking issues for
the 6.0 M3 build but should get to this later this week.

Best regards,

--=20
Paul Barker


--=-2IQXJBb0O1n1crvMRhkm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCacwyjREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bvy1AP9V5x35eW4sje7Sj1N4FbNMsEovnw16dKhJ
f7zpYw/c+gEAs2FbWmE4tHBB3x5g9+yYAKUHJ9oFs9JyiqTRplJfEAg=
=BicK
-----END PGP SIGNATURE-----

--=-2IQXJBb0O1n1crvMRhkm--

