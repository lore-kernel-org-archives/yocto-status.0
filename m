Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AACFE77188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 11:09:54 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.41829.1736850922434223757
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 14 Jan 2025 02:35:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JEamJlEN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43623f0c574so37824455e9.2
        for <yocto-status@lists.yoctoproject.org>; Tue, 14 Jan 2025 02:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736850921; x=1737455721; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xVu2Tr+h42qtbFcyrXBB38bFPhqXWNpAoEgHPvsiLss=;
        b=JEamJlENRUw+t8UQNgd0ai/mYGiOvahgk/3ZbweJGAXiP6C0f34Rw/jVfOuWG/L6jr
         DBsxIohaLA/iP8psknds6xSalqEOKKEvsJ5LbbXufRddcUwn5cz6vMNQfRc2paMcZM7t
         pT3qxwHzj0zlHCCksTNCRDHwFHz7IjSRw6GYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736850921; x=1737455721;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xVu2Tr+h42qtbFcyrXBB38bFPhqXWNpAoEgHPvsiLss=;
        b=AgSMOjYJvMvWPOn7Xovj3f4tbsxD1UCUF/JV6rdXDQhDOHb8ZYNDjwAWpxlHv0YffO
         z4jrCqzx6E+gug6cGc4fkzS3Zjkk59D9AZ9SHMMKK2/iMQ3AitOWc9lyrwk9Yls5KEVY
         5TJaof/t450RfhJEM2ft6yP8qw7D7Catb7UDOGthvc5MAaXtOJgeSE1S7IRmmMUx/uwB
         0UpQKE2/9N5166CStcVQQqShBesldYtkwsVuyQZEiU77mbgCv+kDvEVGF40LpOR8Ha3e
         21aKl7vsA6H7OgpVARQPib7IUZRLqgfas5mXu5/pw3GM2A16LiGIwA0ssMKXoVSDObgf
         Dp8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGBi15wsGts5cWVpybTQ3O+8IDEiSliyq7c9G6AmAO53k1Tniv/16OTzYHQ5gIwAxFoC7IWAWfwBbSTUw=@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Ywj79nt/0y+6cEtKD8xFwFAP5hyaSZOaFT0bpaih6YFE1zojF/z
	ABhDOMTY4k98gqgPxnMxeZ6qzrYiXkxEIzAZqTjEAKxOmtepasHc0FMn4vn+GsM=
X-Gm-Gg: ASbGnct2DpMfx89CDz5EbMso1gfif79mV0nBYKAsSUDB5cHQ/AgMzp7ewntpYtK56hm
	G21Py09293zN/FNIb4oaKvnkb6YTQPf/VwXmmOj41AaTyTlTaGDc62xk8DGVK9aWwS0ZrxE7D6T
	ZlyGsixU9/CHkWtZBGqPOlONSaKuPgDIDKhLM8H9+7CNCOLiQqnjj9ii1by6p+LhbhYdHQMjDWm
	M6gx9Kb+IvvBpfVRGAWeNYeGQc4iO9e+BnT7apwB9PFgOF1/pnHYAxYHpL5+BJfkVzRY6Jqoda2
	Hx6tyT56b8/sDqQfkV+28y6hXY4XhPQILygOW3DdUNXLLA==
X-Google-Smtp-Source: AGHT+IEw2KyHQ4egvctFwsLcSAb3aoDK/fv+/ePBTIQsndS6MJD889ZB/4uozyFRZWMRjalf/J0sIA==
X-Received: by 2002:a05:600c:3b94:b0:434:e2ea:fc94 with SMTP id 5b1f17b1804b1-436e2696cb8mr241546065e9.11.1736850920715;
        Tue, 14 Jan 2025 02:35:20 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:682b:98f8:ba86:ec04? ([2001:8b0:aba:5f3c:682b:98f8:ba86:ec04])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2ddc5f5sm204934965e9.18.2025.01.14.02.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 02:35:20 -0800 (PST)
Message-ID: <f389aa26db3303d50bcc88fe31c5434163394719.camel@linuxfoundation.org>
Subject: Re: [yocto] [yocto-status] Yocto Project Status 7 Jan. 2025 (WW02)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: yocto@lists.yoctoproject.org, wminer@linuxfoundation.org, 
	yocto-status@lists.yoctoproject.org
Cc: ",openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Jan 2025 10:35:19 +0000
In-Reply-To: <CAC_dYdrbwJPe8YQqvFpnpDU+Wq6NxMcj5sj2SSWRqao0zcZc0A@mail.gmail.com>
References: 
	<CAK5yBb8dbPpVqDweeU0xsWAZ07k1x29MMtzvWWDtJesqinKE-g@mail.gmail.com>
	 <CAC_dYdrbwJPe8YQqvFpnpDU+Wq6NxMcj5sj2SSWRqao0zcZc0A@mail.gmail.com>
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Tue, 14 Jan 2025 11:09:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/44

On Mon, 2025-01-13 at 10:32 -0500, Walt Miner via lists.yoctoproject.org wr=
ote:
> What is happening with the 5.0.6 release? =C2=A0

The TSC met and approved it last week, I sent the email to the release
people on Thursday. It should therefore be in the process of being
released.

Cheers,

Richard

