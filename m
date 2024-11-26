Return-Path: <lw@hqv.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BCB4D65526
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 16:49:34 +0000 (UTC)
Received: from amphora2.sui-inter.net (amphora2.sui-inter.net [80.74.147.34])
 by mx.groups.io with SMTP id smtpd.web11.51204.1732639771767641406
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 26 Nov 2024 08:49:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: hqv.ch, ip: 80.74.147.34, mailfrom: lw@hqv.ch)
Received: from [10.20.1.252] (localhost [127.0.0.1]) by amphora2.sui-inter.net (Postfix) with ESMTPSA id 9425896813D1
	for <yocto-status@lists.yoctoproject.org>; Tue, 26 Nov 2024 17:49:29 +0100 (CET)
Authentication-Results: amphora.sui-inter.net;
        spf=pass (sender IP is 85.195.220.82) smtp.mailfrom=lw@hqv.ch smtp.helo=[10.20.1.252]
Received-SPF: pass (amphora.sui-inter.net: connection is authenticated)
Message-ID: <8757f1f3-d680-49b1-907b-9b96c6a482be@hqv.ch>
Date: Tue, 26 Nov 2024 17:49:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yocto-status@lists.yoctoproject.org
Content-Language: en-US
From: Lukas Woodtli <lw@hqv.ch>
Subject: Rust on MIPS for Yocto
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Tue, 26 Nov 2024 16:49:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/38

Hi

It came to our (arguably a bit late) attention that the 'selftests' for 
Rust on MIPS were disabled.

We are in the unfortunate position to have a MIPS device in one of our 
products. We develop several applications in Rust that run on that 
device. Therefore we would really like to have a well maintained Rust 
toolchain for Yocto on MIPS devices.

To bring back Rust on MIPS support to Yocto, we could invest some 
resources. And we would also be able maintain it.

Where should we start our journey? Wold it be beneficial to join one of 
the regular meetings to discuss that topic?


Regards,

Lukas


