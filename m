Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6962DC41513
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:56:24 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.74])
 by mx.groups.io with SMTP id smtpd.web10.167204.1719305780659968638
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 25 Jun 2024 01:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mubg6srR;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mubg6srR;
 spf=pass (domain: arm.com, ip: 40.107.20.74, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XGJnfsW8MRlfbp/fwKno0neZ9Zqo+LV363/DIie2FhffRq1HcpgLaeE2RXA/JdkrThIChl2UiWeHVXLciTREiIK/Ae8BsGgSEjABew6cmPgrWFOldI7CBRG+vTrmquAHxzOOnhUUrwdSwKQglP5H4pGqEQ20GgYVjB4zEhXPn4Q3Jjnf1a9xy0a8Z/zx1qd8WaG0Y5sfNuCscVttkZQ6raUf8BuZw8LQLw7LoJMgnouHhBlUFGzTdwVoFmg3oF5uCyFWFFVLEDWyZCkEjRDRXL/JAZexCCx7q7Gw22SmmjnLKzNXfwGU9OFI9s2O5Dle2OquHbMdPapJywgdAfxpAA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=syut+mV9CqtjVFARkLpAurxz4G3SsTLBNEdzNh8FiCk=;
 b=bCl04ajS1Etggevk+ICnu40cUrKHmZleqgXpEbIFQN2rsQRkeETPuWwMjFzlVDTwS3gZVUrEfkrYqGPkfRQ+5At05Y+yRUfOmRWWWVbxU6aRLw09v0+G4/GSiURoLMey9/Hr8rlHEKUQLT0AQiZ9zfcz8tmg7TNQyvxmEUBQxPu4wiTYQigTduLHo0NBFJw1TF55In24g3/lQfP3gTcMvw5DAdd4h7Fik+5eZEHezOgUs+1CkgEXlJmTOyrxs1IhMay1qeJCPTR9X2UTOM3RKULOF1iHfM+J+JVGGLlBEdGNX2UXUgGW5yt6xqPl00kNcj0F641uCV2tdjGyXuRdXQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syut+mV9CqtjVFARkLpAurxz4G3SsTLBNEdzNh8FiCk=;
 b=mubg6srRNnyNi8GikumXhDyuDsZfctW3PESq2cUGzXziLB9108red9+8UN60OACKBP4LynS/7ECTbiMP0gPYpU5Bc4Lod2Ji3bFTvxW+GgJrM5ZAJO6EU4SMtw24dmjRWINu/TWeieVOszVKuEILIfPfmzW/k/d217jwmlwjEBU=
Received: from AS9PR06CA0201.eurprd06.prod.outlook.com (2603:10a6:20b:45d::19)
 by GVXPR08MB11010.eurprd08.prod.outlook.com (2603:10a6:150:1f8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Tue, 25 Jun
 2024 08:56:16 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:20b:45d:cafe::25) by AS9PR06CA0201.outlook.office365.com
 (2603:10a6:20b:45d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.38 via Frontend
 Transport; Tue, 25 Jun 2024 08:56:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Tue, 25 Jun 2024 08:56:14 +0000
Received: ("Tessian outbound c82ff893d892:v347"); Tue, 25 Jun 2024 08:56:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a949e36303bd08f4
X-CR-MTA-TID: 64aa7808
Received: from b9183c260823.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C7F41D30-A50D-4A9C-AA1C-D1C499909E60.1;
	Tue, 25 Jun 2024 08:56:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b9183c260823.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 25 Jun 2024 08:56:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=my48ndCze7Gecg3sNz78FxnpWNBd6CZ7Av3Fx4BZFcUSbRFvc5c7G9rpwaDpPiPOcjeN+RzLyUODASlrOanvPFpO1agJ8YlaiwFGzPt49UH854XzITlJTlGiT5JQZM3xuCAPaz2d9UpRQoU6b2XkfKS7lSwvt7mPVpM9eRhHIX70jXNRAnDDEMty5Cf2+wGTobpRWt1J3Ge4ZYLdQgRwAAf+VOBTnlvv8nW0UU/ChN/MjmJKy5I4VFxJDu8w7mOL98kRxFf2xW5Vkyn5kEJK94aIb8+SP0muwiWrzAdNU7OUQBcuz7y/N4jHWCg6IA8fvltPBP/cafcZHA3u5L6FyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=syut+mV9CqtjVFARkLpAurxz4G3SsTLBNEdzNh8FiCk=;
 b=eEdjeHCXw902jACrcsRew7+L4oR6oRIP2ICm4d5s72ughcybzWrux9s2DvLXm3Rfu6nkHYPEk+FJ76JDjp6E+vA4UywyJGyBk1Bg04H/LOONrlEquvKLRBx2IIGd2PVZyeODGYBezCnf3FyAKu6GNJuXVspp0xOMKMoluiRk6PDq9HE/quCveoa1wFRfsPe1Ron84B2Akzf4cBmLbWu5yl0UjxCH9otxsDwqifVwuAYWGkKHlxdsEOUq2UtEPOQ4hjd18Zvd7Bp7BYL1sbc6rd3+4vzwggzUw/X0XUSOh+HN3IT0RCYjc6UoDwg0cu6UF92+V/fqIogCoZd81ZbqpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syut+mV9CqtjVFARkLpAurxz4G3SsTLBNEdzNh8FiCk=;
 b=mubg6srRNnyNi8GikumXhDyuDsZfctW3PESq2cUGzXziLB9108red9+8UN60OACKBP4LynS/7ECTbiMP0gPYpU5Bc4Lod2Ji3bFTvxW+GgJrM5ZAJO6EU4SMtw24dmjRWINu/TWeieVOszVKuEILIfPfmzW/k/d217jwmlwjEBU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB10812.eurprd08.prod.outlook.com (2603:10a6:150:153::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.25; Tue, 25 Jun
 2024 08:56:07 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 08:56:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Zoran Stojsavljevic <zoran.stojsavljevic@gmail.com>
CC: Yocto-mailing-list <yocto@lists.yoctoproject.org>, Stephen K Jolley
	<sjolley.yp.pm@gmail.com>, ",openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"yocto-status@lists.yoctoproject.org" <yocto-status@lists.yoctoproject.org>
Subject: Re: [yocto] Yocto Project Status 11 June 2024 (WW24)
Thread-Topic: [yocto] Yocto Project Status 11 June 2024 (WW24)
Thread-Index: AQHavA8uc232STa4QkKB8j9JcVBMzrHYNiDygAAMvoA=
Date: Tue, 25 Jun 2024 08:56:07 +0000
Message-ID: <DEEF93C6-732C-40B1-8759-0E25B6E2C5E6@arm.com>
References: 
 <CAK5yBb-XZMRnfJuC66B=FoOhOXkvwfpsFDES2FH+Vcp61vR=_w@mail.gmail.com>
 <17DBE622025D9B67.28936@lists.yoctoproject.org>
 <CAGAf8LxiZOtRBWye6i0KMkZ-jBv9T8RM3Mu024naen-M15rAPg@mail.gmail.com>
In-Reply-To: 
 <CAGAf8LxiZOtRBWye6i0KMkZ-jBv9T8RM3Mu024naen-M15rAPg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB10812:EE_|AMS0EPF0000019F:EE_|GVXPR08MB11010:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ede21f9-67ec-448c-8676-08dc94f4ab8a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230037|1800799021|376011|366013|38070700015;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?WGrdjhmoTpetKGquDh/n1GtzQTxJZ2x73alwWhCEzgJqHWfsGUbT1TWLPuAU?=
 =?us-ascii?Q?s5+B0qwuFs8o1iJhSTjQcp/c7JwcpwWxdHShCzXemhpyOjYSMh2K/4DZlBR6?=
 =?us-ascii?Q?joXwOIlzUkSODXmYS15WLp2+kZVnry4JF8hfnFfI+zwJpSIog4ti6LC1D6mK?=
 =?us-ascii?Q?RJYBvNj37me5WNzVD73hraoT7l9bNqYGe4Ie7ZnjxdeW7/ft+N2M828ii2pK?=
 =?us-ascii?Q?jB64OrcM09eVVvE1VdD8GtD27xf1OEhH8m+s3b0tZ4euqevVLGczL93RClBv?=
 =?us-ascii?Q?VhGc2QcilwchKcrRADxZVwOfEdSIZ3qjYWXnF8Or6u/I7SG+zuuFrUAVDWZr?=
 =?us-ascii?Q?GId4Lda0tUyLXmcqCfDkArjiOwiO73RY5RzGDCBXJW25XiwUcedSVgSBvxOw?=
 =?us-ascii?Q?up+b+uFLrGnL8+RmCx0SP7PNpwANBPvJvP8gelgf2wCCaIFf0OkM87bHY6uR?=
 =?us-ascii?Q?lQWkb50wjmcM+0sfEqH5hUHD0wwcu4PqgtPR8JCpQssRTOC6lskQ+6AQHGSt?=
 =?us-ascii?Q?EiZ9uMojVIX29pIn8C4J4WdZZYN4p0SbLMBcSKb1tHG4Od4SBObC53Rbc5vc?=
 =?us-ascii?Q?j/i8uVwWHpv9mcleDUX3v4vBNy3rYAgXkzirKJz1xlvuLusdzqPg34SwfevT?=
 =?us-ascii?Q?yQSDMhMOuOl9lk5PphE8tOoYAL067ZsqOd68BFtlMf2AAVbnoPX+YCkeENkP?=
 =?us-ascii?Q?TyoU3kWemUwHt9b06iarIV/hde4VNaGZabLtw0oz59rG7oTVEYIOcT9ONt0B?=
 =?us-ascii?Q?5DW7MhxWAIpUJm8B4VEchvsYesYyRane6bqDe/sfF6nbN0di4zMwiDAl5aYV?=
 =?us-ascii?Q?q017gvOqGdyRVKztXORRfpAcclpOwjNSCaHmnJbTgTAEa7XFaFMeo1FbdOLa?=
 =?us-ascii?Q?aQKrR54sBr9RYRRPHpOgKVGbvvPFn/0wWIn9o2AIoWGqvSzp63ZL9HaT5EoK?=
 =?us-ascii?Q?Mv6rOXhgiyT7vkYHP3VGCxMF7ORVn9KTm3z6u3tj6edyY+q4JYDg422SzTKh?=
 =?us-ascii?Q?i64OAIwjcn3PxjpX4rZbA1YhSbN+KWNXvfX1a+zyTaJu3Uct6yQJy/4zVHLH?=
 =?us-ascii?Q?lfOWbjOqu3Eb7HXWkdTZibbf8LNLGMKwY1XFzCReNP4cFmV4L3d7FIH1jngf?=
 =?us-ascii?Q?YWrxtDnp8k/LhD1n36IwaOST6D7Xyh5rJPRS9UdbGeVjor4N/+PCriANNlYW?=
 =?us-ascii?Q?yrwt2lwQ2d+zcQmZ9ozmnpoDkPRspTEBYRLYBbMpDKgO8cPOeddPUCIcZGrA?=
 =?us-ascii?Q?HMU+iP39PMATcmoq1xJg6vinmD6tu2U119VlVyqVpJPHFERQW3gGMIVL3k/q?=
 =?us-ascii?Q?sX2TJzlh22vRigIueGZE0ZjmXCb3x/Tq1dFLEpLRPcrROMpItts2mwmqOKJH?=
 =?us-ascii?Q?pjU8Y64=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(376011)(366013)(38070700015);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6A09F4E2EABBE2489979CD125E35959C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10812
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5bda3bcc-a2bb-4417-581e-08dc94f4a6c8
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|1800799021|82310400023|36860700010|376011|35042699019;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ItflnUIlkXoP2rkmILTh0obUHFgbGiojHb6QHE+AXxNtrqGET3rBFjxIUWDY?=
 =?us-ascii?Q?mUZ8fRDrA1ZT5vwAdqFoHCrOa69AR0zQmZ4MMt6JfKmfcjHqJFL+zgqVy6l4?=
 =?us-ascii?Q?fNpjv8UpgNOsMADDFneU0OEou4HYgkfzd/p2nIUkEnxdlMRjztqqI7sLfIGZ?=
 =?us-ascii?Q?HGvuVtSmNpt4XSPMvepdk7Mq9sb7gM3HlK4cKfvdDpTtt1Ohfoj3ZGC722pZ?=
 =?us-ascii?Q?xI2DvQiMvS1A9opoTmeuT5XCSw36lq+hF4L2/f6ocVcMiyzP2SZMx4e1ytRP?=
 =?us-ascii?Q?ooUHa+mS/Y2eFdfkcAsTFPpVDTX7ZH7MMuW/6dVLtp7yzgithXyU2Qo+1Uq8?=
 =?us-ascii?Q?XXCs3d9ciqcpPDlxx0rvHEXptTkVFGVGYCq2mTObIo4IorzZR496XL0NO/UK?=
 =?us-ascii?Q?h7dhvuiPclrBRaX0DCYM6No5dhakeZqhMNRzomvX5Ym6e0mrHmc2d/WFZyui?=
 =?us-ascii?Q?Jsi+zkhySDKx7Mc2EO75W8lDjYSyLn8uoEBiGZFrmjmM/otYxvhRQ4uSY7i0?=
 =?us-ascii?Q?Q3oZAxBe07J0htAc6KNk+weQ5xN2DVaYt+s71AmjJBqwYp6XfSOd3ta+s4u7?=
 =?us-ascii?Q?sWQjE6D5JJh+TZIJvQoiKS528oXwGa6AB3H3p1nmMEhG98Zo6uvhupPk9y7X?=
 =?us-ascii?Q?K98N+UIetg+C5M3Iq4zLTQBozDHtmWPz1TkBZ15vwWCzGZSvt4TMg9oBe09R?=
 =?us-ascii?Q?zt097LsUBD91AhS9kKwLmeBKwskkk4Qxzse4yqdGjV+oX8Br/qGA7bCQIRgw?=
 =?us-ascii?Q?VMMC4NSasOcd/h/U/HTF7qnoZvruNXsBgFcFQqURLFqeaaqJGqZbIbhJoDas?=
 =?us-ascii?Q?qCTWVDFubSPAViY5Bm788WI/Wif+w4kvzI7EY8W7u4p4E+Op9dFA+iyM3QOx?=
 =?us-ascii?Q?idojdTkrFZDpuilXRCAOpZ3WFaqZ6H2Mgt/H3watFfAblWFeCJ/vGHvuJJLO?=
 =?us-ascii?Q?uaLzyWjxaz7v3DANJ4WWDf9WwrRdC7/elvuNdr1WR10DdAldfPG+uZM3eBoS?=
 =?us-ascii?Q?9b3ti8tKOPgqR5GR7Y3QwWq0j18Pk0qEmnLExyA+r+wV7/Onqy3w4gG0LvkR?=
 =?us-ascii?Q?zD0fbEnUo9u9ND37MXkpq3vOMLtzrC0qotyoDWtwRNgb80NqWpQ0pq2VT+wQ?=
 =?us-ascii?Q?Sgf2ae6J/6VD29kMdlKL4Z/aH9asdrcQqqxaF9SnZPq5A4wKR0CscMfvOb8N?=
 =?us-ascii?Q?K/sFKVrFBL1k+A6atu5g+Xkawqi6TwGarL/YuPyJOE8N52v9hHNFR3wYNocK?=
 =?us-ascii?Q?iTJg4zu5TGkNL5fOsKDhgRoBh3qLltrhd1sC53IEdNbxpRc498q9qe/yOyHs?=
 =?us-ascii?Q?uKQ1Zc5z10tSKpQ6pawmhp7a+F3mFD57bUYIRj3In4VaFog0nEI5EEUBExJW?=
 =?us-ascii?Q?M+GP5aJpE9iI71lExljGtt3EnknCjoXUP4RRuQct6F0OtbPWXA56JuykQ0WU?=
 =?us-ascii?Q?6Fsl4YDOrWsGf/RgPZkfsA/lS9oyOdwz?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230037)(1800799021)(82310400023)(36860700010)(376011)(35042699019);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 08:56:14.9899
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ede21f9-67ec-448c-8676-08dc94f4ab8a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11010
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Tue, 25 Jun 2024 08:56:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/13



> On 25 Jun 2024, at 09:09, Zoran Stojsavljevic <zoran.stojsavljevic@gmail.=
com> wrote:
> 13.3.0-rc0 in poky-5.0.2???
>=20
> What about 14.1???
>=20
> I am all scrambled and lost... Or?

As was said earlier in this thread, the 5.0 long term stable release will n=
ot be getting a major upgrade to the compiler.

Ross=

