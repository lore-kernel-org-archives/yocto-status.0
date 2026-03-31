Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76190109B48F
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 15:31:54 +0000 (UTC)
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23090.1774971112797023747
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 31 Mar 2026 08:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=m7K58qhK;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=Uy93zLli;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 057C51D00053;
	Tue, 31 Mar 2026 11:31:51 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 31 Mar 2026 11:31:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1774971111; x=1775057511; bh=6MBWCxAAT7
	uC1QYrCVu9XffVWQR05J7vX5Act6FTIiE=; b=m7K58qhKnb2nG2cW5Eoo/OhZuB
	3YOKgyDxRMjXhYj0WZIACFUp2/E0sSQOKRbF1ietB7rZQk+BvymCSEIYnJZt/sxP
	cKTQyMTCM7hWcHwesbcX96oyUTAHCOlpjcOhtER6i2jO95ek/oQQZ3o5H/7lEXKB
	WTFakwBOmME6WFaDno1Yjes6gTe/nDmLfau4zmzMJ7icLA2Hzk+0jgY+/tMWAN3s
	YEfr0O20KX9No3dEDZ0bGohijfNa12iR/RVkwVi0XuaJXFTjJDpj2No5uwA6/TYu
	2j36NtbP4JCaohfti98XcaTkDYKCcAwmwAEnv6GZL1oboYWnkakxegbfrrEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1774971111; x=1775057511; bh=6MBWCxAAT7uC1QYrCVu9XffVWQR05J7vX5A
	ct6FTIiE=; b=Uy93zLlivauH3lW6F3q/0IbC57hD+ua/XpsxRwQQvAvjDCMrTN6
	/v2NDljtSxgqx41AXdyne9cQTOgZGB5sPUok8KA8Rm1E/VzIevYlutWZKtUAyUTb
	yWe12YJx0tDAfUwt9maByfXlXK4i/m6fMH/gxIyunB8YCriwW5KefPvUNA1rxehD
	bOVrNI0SQplaVOx9F6kJukLoBnsahq8AHpmptkWas5DOujCDh7oHZrZx/SpYCS9g
	VlFjJZlGRAhYoLwdjkaJLzCiih8fuoUzj13P8xhepycLigdScQ1xoRykX8OfnRuo
	CGG4NbgLOK/9gf1MDQc+nPonV4HRWZE0r3w==
X-ME-Sender: <xms:5-jLaWMu_xwmGmIn4A9PMZMioCJg_UPbTq52gPUvxfuAebohFunLEA>
    <xme:5-jLaQYALogg3LjUgwzbtBcc4LnQ1AB3E5_RdxzF2sIsX8asTN8ZBrm7jjzZgoY54
    dhEJsh3aabZOM4WvuGr2ZCLtDFTJEeWjGORWygmAAcx-xrpP_TvG4Iu>
X-ME-Received: <xmr:5-jLaQx6DhG8AB3O2imTbnH0pIxoVcCCT2qp4o2bM5pp-I5yRmuSdUtQEM2hYH_oMhSpfNtyuhejSDuwX2gqoPBLIvrAxHoLUTtZzbU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdehjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecunecujfgurhepkffuhffvffgjfhgtfgggsehgtderredtreejne
    cuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghv
    qeenucggtffrrghtthgvrhhnpeetjeekueeghfeiudegieehgefhgfffgfehhfdutdfffe
    fgtdehleetjefgieeuhfenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhg
    pdiiohhomhdruhhsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopeegpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopeihohgtthhosehlihhsthhsrdihohgtth
    hophhrohhjvggtthdrohhrghdprhgtphhtthhopehsjhholhhlvgihrdihphdrphhmsehg
    mhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslh
    hishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohephihotghtohdq
    shhtrghtuhhssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:5-jLabKlDUvPSLnf4VJWHmOx21SeJKxnaJMBIMIB85v9YvClAZRyfA>
    <xmx:5-jLaaoL2PYD8QGDnG41_a_OEB4asQM4aNoKxRMBKMns8frlk1tqmQ>
    <xmx:5-jLaaLd0OYYi3KV4voIkWdsfMY2SxNfxZzhlpQjuFUbBQq_kyXIqQ>
    <xmx:5-jLafSme_CC-UUcUQYldjOas3pFVUoXE6P5036SOd0sozSDrqRx_A>
    <xmx:5-jLaWwNJ13w4ltzThZJ15Ep8Ej9O9SHptZuBv7eLKnyqbhHllF3x8Gz>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 11:31:50 -0400 (EDT)
Message-ID: <debd57881df9f7bb1681ff140d35869f81e17fcd.camel@pbarker.dev>
Subject: Re: [yocto] Yocto Project Status 31 March 2026 (WW14)
From: Paul Barker <paul@pbarker.dev>
To: yocto@lists.yoctoproject.org, sjolley.yp.pm@gmail.com, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Date: Tue, 31 Mar 2026 16:31:46 +0100
In-Reply-To: <CAK5yBb-sFQWmxJHc2MPrSRMWhFRsMFUrm69vtT6FxNV8zL+Ktw@mail.gmail.com>
References: 
	<CAK5yBb-sFQWmxJHc2MPrSRMWhFRsMFUrm69vtT6FxNV8zL+Ktw@mail.gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-uX3hrPDd/Y8MKvoW4LJr"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Tue, 31 Mar 2026 15:31:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/111


--=-uX3hrPDd/Y8MKvoW4LJr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-03-31 at 07:50 -0700, Stephen Jolley via
lists.yoctoproject.org wrote:
> Current Dev Position: YP 6.0 M3
>=20
> Next Deadline: YP 6.0 M3 Build Date 2026-03-23
>=20
> Next Team Meetings:
>=20
>    -
>=20
>    Bug Triage meeting - Thursday 2nd Apr. 7:30am PDT (
>    https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
>    -
>=20
>    Weekly Project Engineering Sync  - Tuesday 31st Mar. 8am PDT (
>    https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
>    <https://zoom.us/j/990892712>
>    -
>=20
>    Yocto Project Patch Review - Thursday 2nd Apr. 10am GMT and Monday 6th
>    Apr. 9am PDT (https://zoom.us/j/9776239
>    <https://zoom.us/j/97762397148?pwd=3D1xkiC9hp9SjEonaTaONwTb6iWry4Eb.1>=
7
>    148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1
>    <https://zoom.us/j/97762397148?pwd=3D1xkiC9hp9SjEonaTaONwTb6iWry4Eb.1>=
)

Hi all,

Monday 6th April is a public holiday here in the UK so Ross, Richard and
myself will all be out of office. So, there will be no patch review call
on Monday!

Best regards,

--=20
Paul Barker


--=-uX3hrPDd/Y8MKvoW4LJr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCacvo4hEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bmiDAP0cOc/qq+6WDlawUZktLBepS/9ciB8QgKb8
YXB9b0YE3AEA1vrVisNh0MIdoooVwF9+eE3Cyw8WPQKBbGUsjT33hQA=
=O24I
-----END PGP SIGNATURE-----

--=-uX3hrPDd/Y8MKvoW4LJr--

