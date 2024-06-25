Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9383CC2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 09:11:57 +0000 (UTC)
Received: from outbound.mail.protection.outlook.com (outbound.mail.protection.outlook.com [40.107.20.56])
 by mx.groups.io with SMTP id smtpd.web10.167503.1719306707511173861
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 25 Jun 2024 02:11:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nDeA4Bh7;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nDeA4Bh7;
 spf=pass (domain: arm.com, ip: 40.107.20.56, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=a+jM+gDwUobavzc/8kVhKBw7vzAHt3FwShGdZmtfIfcdqcDd/CSpm6I58jb2TNYoGiGX4TgETpJe3fs3s8OPrSyfO3hJr9av5VPL+gJdN1Jzg068qqQItUoLO/Rd2nk8XRoReg1S4/0wVk9Idxs1OyjcJQ7FyL2t5Rta5nHugHxpmSuUn402BNqhAvslaqt3y9BPKstSTA1fByg2BuCDOgvAG07NRsUZ2RL2IZP6eeK5hULOGJ7WPc9CtUb06fsEgOFF6Q/EfBs9BpA9ZXOnxfcZMFNJC/qZKjW/aTqQjReU0P+Rf7MTDZcCjlkHcOuC8mdTIaI+K+CXHfX8zdwNLA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4O1Nak7vO7d0H7y8Ym6NHVgMeMn6Y1mo1i+Up0CSt9o=;
 b=H82tKkiT3uqAzlKbq7M5CH7eIQosga1ke0CRTd1m+74YwMhCvJcJOAGip1Oq5SyrFbnI3IZd63XEnwYBdeoaJz3dGf1NXb18mQYW7Bl6hNLrbDeXNl4pVv7wpdnXXDeFKv3U4ZtSJUawOcYYMZ3MckwnNw2AOAzus0MeGGJGsX4iDLceZ84rk3SbNJttmpZ1ShRHvdlx+FrLTE2SRxIKdaaiXEZ4Xf22kD0mh5VPmIu0F/fZynOrKwVVUsp9R8KF+WdgTFhtzZgvr7r7ylFADDxKjPM0wvprZiXNgE1a1q/jzX504cFHd4X6ZZgdRcf0O2FyXsmVNMaD8kPld3AMNQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4O1Nak7vO7d0H7y8Ym6NHVgMeMn6Y1mo1i+Up0CSt9o=;
 b=nDeA4Bh7RPXdzVjLQ9C+lKylx0Rs4zWLQ7nL9H5Gi7xyUw6D6DkZi+ZTIwsztndO4KxkbgUWq17JVBdhYldqHcYfZV5aLoXPkbymcukUaiu1mM66lfP4tJpi1WLdW5zYe11MT04cHVId4yk+OPV7FWNisA/AeVZn9UyrGnnb7K0=
Received: from DU2PR04CA0022.eurprd04.prod.outlook.com (2603:10a6:10:3b::27)
 by DB3PR08MB9900.eurprd08.prod.outlook.com (2603:10a6:10:43e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Tue, 25 Jun
 2024 09:11:42 +0000
Received: from DB1PEPF0003922D.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::15) by DU2PR04CA0022.outlook.office365.com
 (2603:10a6:10:3b::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.38 via Frontend
 Transport; Tue, 25 Jun 2024 09:11:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF0003922D.mail.protection.outlook.com (10.167.8.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Tue, 25 Jun 2024 09:11:42 +0000
Received: ("Tessian outbound a2b2216f02e2:v347"); Tue, 25 Jun 2024 09:11:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 33347cb2eb50a54a
X-CR-MTA-TID: 64aa7808
Received: from 5b5a6954c98e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D17B4253-0F9D-4E84-A2E2-FD0419774301.1;
	Tue, 25 Jun 2024 09:11:36 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5b5a6954c98e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 25 Jun 2024 09:11:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZBl5iFnroQGP9Syo1iSr9qwv5718/PR5n6fyEpTMVidvkGeD1alUS30GrgQNToTN3Fq3iB/zcYa9Gj5xacE1TTOSrE1zSUmH68Q3CzjE4MbkC3CxORXJbS6MYfXUjDUGsVr+U2KdtLAzfR67fOUlZi7bM6VcAC24k9GlGAxw7FYLtMFFSlPVgX2ZuI/yTDvzGcDRWqT+jY4RlOanUnlVHEGMZYmpifBdVNLxn2qjJ6og4ws/wdBIcF5KVyOfSxawWkkWnbDD9yACEXJgSAQ997nsgjDgoOeNCjMVPggh7mbCjlGos/oaUgQlgNwJb1BBg3HN/PCFGafoYUneMLzcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4O1Nak7vO7d0H7y8Ym6NHVgMeMn6Y1mo1i+Up0CSt9o=;
 b=faNfKWAPBxawCRRRYw1BVQO9wwkAwuKItjm8OKFboPbfs0OaPu8TteEMXxMJOPwgo7X/YmK1ynyviyEuqdtFLDwdeIcGHQMhPe5+RlFtPYnFII7lYdDH4pdG2ZrWOn8SB8LMYB0rgkEzlrH4ziyxe6oue+1Mr3GoG4rwHUtkEWINaI0D/AkFvx4Luy6AbLI13jFD/oRLHsNQCClgvhFnTAEw6jkbALt/AENZMcBoxop6bIU0p9K6ifGwU5Yh0LCypER+370nyEY0OsNTBYnvt+7FbqsWcQXHU7Zi5dKG3nkxQzz+qIa8eUXtmXQYu0Rkwx88IXsmt7/zx2UJDRrANQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4O1Nak7vO7d0H7y8Ym6NHVgMeMn6Y1mo1i+Up0CSt9o=;
 b=nDeA4Bh7RPXdzVjLQ9C+lKylx0Rs4zWLQ7nL9H5Gi7xyUw6D6DkZi+ZTIwsztndO4KxkbgUWq17JVBdhYldqHcYfZV5aLoXPkbymcukUaiu1mM66lfP4tJpi1WLdW5zYe11MT04cHVId4yk+OPV7FWNisA/AeVZn9UyrGnnb7K0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB11010.eurprd08.prod.outlook.com (2603:10a6:150:1f8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Tue, 25 Jun
 2024 09:11:34 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 09:11:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Zoran Stojsavljevic <zoran.stojsavljevic@gmail.com>
CC: Yocto-mailing-list <yocto@lists.yoctoproject.org>, Stephen K Jolley
	<sjolley.yp.pm@gmail.com>, ",openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"yocto-status@lists.yoctoproject.org" <yocto-status@lists.yoctoproject.org>
Subject: Re: [yocto] Yocto Project Status 11 June 2024 (WW24)
Thread-Topic: [yocto] Yocto Project Status 11 June 2024 (WW24)
Thread-Index: AQHavA8uc232STa4QkKB8j9JcVBMzrHYNiDygAAMvoCAAAL3AIAAAVmA
Date: Tue, 25 Jun 2024 09:11:33 +0000
Message-ID: <4A5683B6-72C7-4E00-BA7B-3AD26A3E4877@arm.com>
References: 
 <CAK5yBb-XZMRnfJuC66B=FoOhOXkvwfpsFDES2FH+Vcp61vR=_w@mail.gmail.com>
 <17DBE622025D9B67.28936@lists.yoctoproject.org>
 <CAGAf8LxiZOtRBWye6i0KMkZ-jBv9T8RM3Mu024naen-M15rAPg@mail.gmail.com>
 <DEEF93C6-732C-40B1-8759-0E25B6E2C5E6@arm.com>
 <CAGAf8LyfuhMTHJj=bo+GRkJffi+S=7YnMMv5i2TB8OM9bxBqcA@mail.gmail.com>
In-Reply-To: 
 <CAGAf8LyfuhMTHJj=bo+GRkJffi+S=7YnMMv5i2TB8OM9bxBqcA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB11010:EE_|DB1PEPF0003922D:EE_|DB3PR08MB9900:EE_
X-MS-Office365-Filtering-Correlation-Id: cea99040-5b5c-43a8-2bbf-08dc94f6d496
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230037|366013|1800799021|376011|38070700015;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?MTdiTVorVEUxa09lMDNxT0FMSEoyNjZoZDdibjN3NFlVNTh4VHhSY1JrWFEw?=
 =?utf-8?B?UUtMM1gwK29Pb29JaHdnbmdONWRodStIc2Mwa2xvbTFVYUIyK2o2K05WdnA5?=
 =?utf-8?B?MUFMb25PQVIrNmV0VmtkUFF2UXEzQll5V1lUbWZmeWtNVGNMcFg2cnNRQmFS?=
 =?utf-8?B?N214SzZQcVROc3hDdyt0dkF2MUU2U1J5eEpkRmpDWU1HeGVXUXNXSm91Q1FK?=
 =?utf-8?B?bXpCdVd2T0RSWFVBdTBIbjlxb1FkWXVEWE02MXVpK0dEWGpOb3pDTm5sT0Yy?=
 =?utf-8?B?alJpU3JwUUJsdlBaeVZLaDFBL3NMYy9vM1BEY0s4OVR1N1BYSC9HR2FRU3Fj?=
 =?utf-8?B?c0ZJWTV6bEh0RWJCQ2hEcVJxOVR4MEx5cG1UcDRMbFArM2h0KytReUZoZ3Rt?=
 =?utf-8?B?N29nT2VLaDNvMjZCNmprMGVvaEFTSUNlU3ZIVCtYZG9JTUxRTkNvOGZaL0Va?=
 =?utf-8?B?OU43a1R6N2g5SlpXMWtxc2ZxZ0xDeS96TFp1U0hxZzdtTjlWbVEwV1lodE02?=
 =?utf-8?B?OU93bTFCVjlzK1ZnQ3BESjNIN09RWWVZQzZBdW1mcFhkVlo1WEZXdGdqdlN0?=
 =?utf-8?B?ZWZhM2FnY0dKQThWNjk0V25JcE9uRy9CL0E1V0VIOHRUT0tjRE96Ri9WQ2VD?=
 =?utf-8?B?dk9KS094dTM4VnVtZ2h5QVRUOXo5ZUZBTFBpbDNqdk5lRjlBSHJIQUhaSGVE?=
 =?utf-8?B?QXFYeFZSbDVkSkxwY0NwdW5QUXMwWjlIbnVjN1VUWHRubnZpSUR0VE1aOUw0?=
 =?utf-8?B?OEx3N1NFM2RlQjNlZFUzYXB0c1I3M1RiK0ZZdVhDWncwa1RzRmh2YlBEcDN2?=
 =?utf-8?B?Sm40TitJZCtEYmt1NHlscWtzYXAzWENncWxpLzgxU0g2d1U2WGNYM0paSjJ5?=
 =?utf-8?B?OXlPQjJ3U1ZsMS9SYzRhRi8vbVllVStaUXhkWHpVY1o4MTdodkVpTnhNREdI?=
 =?utf-8?B?VVNTZW5TaFRZUEpaOUZsWmRzMTBzQ0Z3Z1FuM3dCTE1BM2VwSlI5b2RZblQr?=
 =?utf-8?B?cjhjcTJBSXpsQ0NacnBDMlhzZTVsR2MxaEx5Q013a3dhNjVMUFc5NHZaR3pW?=
 =?utf-8?B?UjAxNmtGYVZGTHRidUd1OUNJVGl3RjFaNVo4eGlhRUR1WHpEZHI1UXd3UnRS?=
 =?utf-8?B?M3ZvL2h2czFDZHdLaTVjWmw4NWQ1K20xRFBHZ2FuaU5pSlpFdHlTRkgvVGhz?=
 =?utf-8?B?NVRwNk1vNGRMZFd4SWtnT1d3UnFZd2dDdWJHNkx2dGJRWGRNTDlDUnd1VFYr?=
 =?utf-8?B?VWFieUgvTUdHT3ZDNi93VWkwUUZwcFZrNzlROUJ5K2pQelVkVWlpVFBHWk5M?=
 =?utf-8?B?MStpNTVjaisrdGZxK0xkaWxvc2ZkejBGSjIrQ2dOSG1HUVVVVlA0UGhaNDlo?=
 =?utf-8?B?UmNTa21Ddi9sSDZKTndLdXNSZVJmRlRya21CWDVZTVMvaWpzU09JYVdQRDRp?=
 =?utf-8?B?OVZEOVlKTElwZkVqcGg3VGt3WnVtSTJHVTBqNUJHWUdNZS9SZTdRNlZvT2tJ?=
 =?utf-8?B?NDh1dVhNNEl2S00ycnNhYmo2ajdicmZqLzYxMktjRDhPQ1BDYjdXQ0h4WDBy?=
 =?utf-8?B?TmNGVGtVNmh3dDNRcFJCY1ZhdG9QK3VxRC9PZ09EUnVuY1ZDNjluQVRML1hw?=
 =?utf-8?B?NlZtWXlCTUl0UUtjQlBRNE9lem5nTUFIZFR1RGloN3FiWHZhZTRXVWtWUENS?=
 =?utf-8?B?Smd4UFo2OWpSRzBYU1dJMjRrVFV5U2dsVXpIVWowTTJqOVZhL3hEM1lpbDN4?=
 =?utf-8?B?NnZzY1EwQTJFVTYxMFErSnhXRnpRL1RQRnV5WjNFNFRIQUhYc241WitDOXd6?=
 =?utf-8?Q?5eT0y1WtFRcqbGxibs1m3u7ySHkCAne1dvYfY=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(1800799021)(376011)(38070700015);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F04C22C7B1D9B54A9096FA3F12BBAA79@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11010
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4bd925dd-6d7b-4ef0-319d-08dc94f6cf47
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|1800799021|35042699019|376011|82310400023|36860700010;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M1JOSzlUOGNYbEszZ0ZMUUdvb1NMV25nSSt3VExtanRGc3VmaVVvaUlXSnl4?=
 =?utf-8?B?dGJIVTJjTEYwWkY5VjRBRXBPYjJSZHBRaFhuT2lRRjRoeW84dXA2Ky9hTWNI?=
 =?utf-8?B?SEFna1llaDRwa3JNZEFIL3BQNWxJYm5JWFJwd2pKeldvTFB4bDZzK2V5cS9w?=
 =?utf-8?B?dXJyR0gzZlNjRWVXeFI3MGE2eGhhMk50a2ZNc1liTGhlcmVmSm04cDRzR1kz?=
 =?utf-8?B?VjcySGlyNFhCWFBYNXZvRzVpTHBodmpNZEd1UXNGQ216dGlpRTVmVXNZeDhv?=
 =?utf-8?B?WldnYzhhYzlBdDJHMmdhdmMzcTJvMnlyeGljTzFrMmpTL2pkS0k1N1Ywakoz?=
 =?utf-8?B?SjVzUjk5MW8zdDE4SjlQZ3E3RldIZGlab2M4Tm0zUWlGN0w0Q01zQTJWL2dk?=
 =?utf-8?B?cTVHOUZ1ZGp3elUxUGZSWldlUlk1VkVZbmZmK0oxSmQvVGI2MkFvemU1Tkxr?=
 =?utf-8?B?aWY5UWpCNWFkWU53anpGejdVRms2Z1E0L3JPUnZ1WG9qb3VRWk8vdElYMnNV?=
 =?utf-8?B?TGxCWjZOa25aMU96SjBKdVkzMHhNL1RpL1laYXN2WllHM1prUDhiVEsyN1RE?=
 =?utf-8?B?VjBVYUtmbWZIOHpoYjZUbTZvM1Z3ZTdndjZ0MERNZEh4cHByVHFlVTh2b0M1?=
 =?utf-8?B?VnFLNUxBOHhmUUlGd09TcTlmZkhXMkJsdEIvZFFqcnkweXRLTGNtdE0zWFY3?=
 =?utf-8?B?V2o4ZjFyRzRybFJBb3NtNzZMQWYyQnlwN0oxREVTNm5WVFNjNmd4aVRobjBv?=
 =?utf-8?B?WEVmV3VXTnNlaUZldjdKRGZ0UnVQdTFXa0NTQ09XdDg4SXkxRU54bXczeWxv?=
 =?utf-8?B?ano4TEVYMUo1NW5FZ1FpMytNSG1NU3dVOVF0UCtQS3VTVDlDUmxVby9zVmhm?=
 =?utf-8?B?NFRLazlZcUFwcmFoQ3paamRZbDhmVFcxRnlrdlMvNjlSaU9Qd3R2dGI1VjVx?=
 =?utf-8?B?VmdZYVMvMDFjZEt1Y3NTS3F3czJZelkrTERKaFFxNTV3bFlYWHJSMi9EZmEz?=
 =?utf-8?B?M2NqME5ZbVlNa1I5dkw1S0ZBWXhvNzZNUG1sUlJTUGhWZzJ0NFBmb21wQkFJ?=
 =?utf-8?B?OTFYQWFmMVNYK3lCS05mTDZqQmxScEdMZUJUejZZUmVKRGZ0ZEdLNnhZUlow?=
 =?utf-8?B?bFVPcExGNUJ2WlJUSHRnQnYvTGJkRWJiM2psYitjbW1jZ3pmNXViSFpMYnRH?=
 =?utf-8?B?TWFyNm1XWG84Qm9rWlF3Nkl4ZWRyQnVQWk9kNHZKaXJHMmxoUVlRV2pxL0lC?=
 =?utf-8?B?TjF2bEtKQXVVejIyMG5FZHlmcmVHakl4aEJzTlJ2cmxHV0lKei91UGtpOXlS?=
 =?utf-8?B?L3p6Wm9kbVhaZHEzV0NVTGVQeGdRUUMwem16eG1GeEtMaDZNVHJRc0svOE5Z?=
 =?utf-8?B?b2hsblphOEt2R0k3SmMvTWpWT2tJcXM0WVRzRDZYK3BxYm11QkxISytES3hr?=
 =?utf-8?B?Q0I0azdBSGhRaTY1b3RLRFJuVENCQm42c0RPaTZQOTNac0piK0NBSkxDWllD?=
 =?utf-8?B?UXRXUlhzVGRBOTRPc056S0tYWlh1RXlNdlZzSzhMRUM3cmxjb25HYU0wK2FF?=
 =?utf-8?B?eUJjeWNOYXI3cHV4QXk5M2FBNXlrY2JGZlA3OEVJWHNsSUlWbmRYVC9QNWcy?=
 =?utf-8?B?ZC9ZRzZpQnE4ck10ckFhL0hiOTRmQy9Sd3Z0VXcwY0xNOHkwTHk5ODhiUVcx?=
 =?utf-8?B?UmtwdUkrZ0ZMTVlQalo2NGZ4MjJUVjVOa1VCYUNQZ2xjNGFIcld5NEE4TzRt?=
 =?utf-8?B?M2dCc05VWUJiOVZ2TVg5TFJRTlhrTmhuelprMmV4NDUxMTFFdERqekl2VHkz?=
 =?utf-8?Q?Ply62OFFvy8qPbzbN/DJXCmCp6D0mWXCTvH7g=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230037)(1800799021)(35042699019)(376011)(82310400023)(36860700010);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 09:11:42.9244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cea99040-5b5c-43a8-2bbf-08dc94f6d496
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9900
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Tue, 25 Jun 2024 09:11:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/14

T24gMjUgSnVuIDIwMjQsIGF0IDEwOjA2LCBab3JhbiBTdG9qc2F2bGpldmljIDx6b3Jhbi5zdG9q
c2F2bGpldmljQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBTZWVtcyB5b3UgdGFrZSB0aGUgY29u
c2VydmF0aXZlIGFwcHJvYWNoLg0KPiANCj4gU3VwcG9ydGluZyBxdWl0ZSBsb3Qgb2YgZGlzdHJv
cy4gSnVzdCBsYW1lbnRpbmcgdG8gZ2V0IHRoZSBpZGVhLg0KDQpJZiByZWZ1c2luZyB0byB1cGdy
YWRlIHRvIGEgbmV3IG1ham9yIHZlcnNpb24gb2YgR0NDIHdoaWNoIF9kb2VzXyBpbnRyb2R1Y2Ug
YSBsb3Qgb2YgYnJlYWthZ2UgaW4gYSBtaW5vciBwb2ludCByZWxlYXNlIG9mIGEgbG9uZy10ZXJt
IHN1cHBvcnQgc2VyaWVzIHRoYXQgd2XigJl2ZSBleHBsaWNpdGx5IHNhaWQgaXMgc3RhYmxlIGFu
ZCB3b27igJl0IGhhdmUgYnJlYWtpbmcgY2hhbmdlcyBpcyBjb25zZXJ2YXRpdmUsIHRoZW4geWVz
Lg0KDQpTY2FydGhnYXAgd2lsbCBzdXBwb3J0IGJlaW5nIGJ1aWx0IF9vbl8gYSBzeXN0ZW0gd2l0
aCBHQ0MgMTQuMSAoZWcgRmVkb3JhIDQwKSwgYnV0IHdl4oCZcmUgc3RpbGwgZmluZGluZyBzdWJ0
bGUgYnJlYWthZ2UgY2F1c2VkIGJ5IHRoYXQgY2hhbmdlLCBzdWNoIGFzIGh0dHBzOi8vZ2l0Lnlv
Y3RvcHJvamVjdC5vcmcvcG9reS9jb21taXQvP2lkPTI4ZGVmM2VkYmFhZDJmYWI0NzgxODVlZTZj
ZjMzOTliMjZhM2JlNGIuDQoNClJvc3M=

