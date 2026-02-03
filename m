Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 477F1E87839
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 14:17:16 +0000 (UTC)
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17460.1770128100208784971
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 03 Feb 2026 06:15:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=IJzSiGcA;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=tLjI6Jje;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.149, mailfrom: paul@pbarker.dev)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 4D5A4EC0302;
	Tue,  3 Feb 2026 09:14:59 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Tue, 03 Feb 2026 09:14:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1770128099; x=1770214499; bh=g2VLGjhe5OVEQtBXkGuAv3DiRNBu5JGb
	H3bZUr5fpu4=; b=IJzSiGcA3bZ5gY91i3cZDSVgOhhdiY5gZinj2P1qbG+8IpL8
	Py/ayM3G/ADJ65xo5tM6qI7i38IlPxau764ygoFPRWSOO+dYk7MEPN8VL4oC0Cu1
	Qvn6gpTNdRa8iAduUofS/1KwndwTKeagqU1L5U6eQLNenyj8zVZEIwpLr0eeT4Xf
	gFX6VIAHv74Tx9ZpN4BAK1pXGW95QrXt/VRWzUv0H/p4XJOHDkzWBVBbtbj/3meT
	YU5lJgIWcasQ0on8kYOnVzWuXi9jlPLC9ucJkxYjEBWGmuSVqQ3rAf/RLoMlBNca
	Nm98cEeu++2x4GMB/AdYv6L1kNSDWI4dFMji3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770128099; x=
	1770214499; bh=g2VLGjhe5OVEQtBXkGuAv3DiRNBu5JGbH3bZUr5fpu4=; b=t
	LjI6JjexX9uXnDFi3RfecWPNGZO9nin0vg3O2v5fF0nfdQbuoHUkAwYCqwBUGuI2
	ZLJL9t4dND9ZIf4GDeZbpc7feYFrmCJZFPF7PG1UNIPLhnVRI/rd//u8ipQ5UTuJ
	Y/XEL1ladOg9IjSom1JlbtoWu8nnfQGq9TmL/sFv6mW1v1p4n4ZapF9o9gHHKQwU
	88FgNekqfEcB/Q4wl/vUOqpjqIufp4pPErkJCW+8CsV93WTzpqLgoSEc58wja7cY
	MoJM0cS9VPNpo3CXmLfkZ+EY01Moy69pbXgayEGFYdC/m9upRI3aLYQyP9jVCX1K
	7llJUpTU/HZJ1f2ArKgZA==
X-ME-Sender: <xms:4gKCaU_Byi4mTtgsAUzc4T5S5GU78s87mxmjRs1SOLLZVun2W7lekw>
    <xme:4gKCaVqi0dDSeJYRXLzLvY12ye_iNw7VS979l6_LTZbV_hY2QeVXt2yjJrf9SU6r5
    sWiudb40L26usPU0LJGML57DQ33jrdU-3ELKDCiv5pbYDY2VhT7Bw>
X-ME-Received: <xmr:4gKCaVlEUE7OzlLIFhUijG3l5rB0zCE2JCEkWU37jpHmyFYDo7E6B4kWzG4z5vT3omI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukedtvdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucgoufhushhpvggtthffohhmrghinhculdegledmnecujf
    gurhepkffuhffvffgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegrrhhk
    vghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpeefue
    dvleduvdejvdeuiedviedtjeeludfgleffteelhffgkeefvdelfedvvdeitdenucffohhm
    rghinhepiihoohhmrdhushdphihotghtohhprhhojhgvtghtrdhorhhgpdihohgtthhord
    hiohdpohhpvghnvghmsggvugguvggurdhorhhgpdhgohhoghhlvgdrtghomhenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrg
    hrkhgvrhdruggvvhdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohephihotghtoheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpd
    hrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghn
    vghmsggvugguvggurdhorhhgpdhrtghpthhtohephihotghtohdqshhtrghtuhhssehlih
    hsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehsjhholhhlvgih
    rdihphdrphhmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepphgruhhlsehpsggrrhhkvg
    hrrdguvghv
X-ME-Proxy: <xmx:4gKCaUhREp2wsLunNAMNHTZt6ODew9wfjnwoAigPvic8HelDRrZQBQ>
    <xmx:4gKCaVem9vzmRKqqxhn10K99KkYukacXMwhMlD8LanZO5KEhIdmHBQ>
    <xmx:4gKCachsmPwFIF11ovfL-BxRPwhdY5MY2u1mqQpfGs2iwc6JGzd72A>
    <xmx:4gKCaVzQd52kwRZQPzfJqWyVAVpAmHTEKGU4hT3Av6KbSJ5iMpOMHw>
    <xmx:4wKCafHzmL7vb0z3f-Kfv5wYUI0AxUUNyArkVEnn5h0uQH63lJ8HCp_Z>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Feb 2026 09:14:53 -0500 (EST)
Message-ID: <86903073f72de528b3037b6f317905b88b04bf17.camel@pbarker.dev>
Subject: Yocto Project Status 3 February 2026 (WW06)
From: "Paul Barker" <paul@pbarker.dev>
To: yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org, 
	yocto-status@lists.yoctoproject.org
Date: Tue, 03 Feb 2026 14:14:34 +0000
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=mQINBGC756sBEADXL6cawsZRrDvICz9Y1SG0/lW1me4xpq36obh7a0IGAzp3ywNRb/4MO
 DTqP4+DD0cIFuDY41/N17g0sNlp8z+/k/IIDmNPtYQOTVmAkrkdDU4BP8dD3Cp1PUw6nrbInfujAJ
 NrVM0IVDkwKTbL2Nu1P+xns4MIpF9Kj4XN5celYJ9vEJ2n0Bo0nO5T5vg46dihIaDl+24iNIHSsHq
 YyEdMBfY8kY2RulpaAyFOuaaHdIeDkejVvO5xLSiYLjB5qrRhgH134lJXsuLOsFQ64ybGECuOasnb
 auevsPBAaroQW0pqVb9FneGrWHxMCLlQHJRqQJRdVa6bsUdp6NWra8/0msPawSrFwGQdfJBTA3aXJ
 C2CG1JxEgj6QQjEQA49DSjgzdhInbiIK8Vbp/zedM4aVue7qJnwPMTFQM9lYx63b7wLN4Tu8B9YZ0
 UFdSwMCJuqmYGsYRUYdwM3ArjS0VO6WpU+HBKvzLK5GQfUTSM8KaZ5eA2Uo2ain8SSZb+WptUYKpx
 F9jbtCPbjpZKzGuX4iHFl9eT75TM9iXJNGAjB5xigkADLwVfPoJ5E53S+KdNVuOWHugyLMPNAQHOw
 pw5Rey+0zxyzPd4wphutc93UIU5g/029ngAc7DuKCq12jl7fhkjqFlFtYPIc1k7nd+RSezmH/qRes
 bMErHSX1MBSZQARAQABtB5QYXVsIEJhcmtlciA8cGF1bEBwYmFya2VyLmRldj6JAlcEEwEIAEECGw
 EFCwkIBwIGFQoJCAsCBBYCAwECHgECF4ACGQEWIQSYsqrBAKw/grtdVGd0l1yBt+ZrrAUCaWoNAgU
 JCxiQFgAKCRB0l1yBt+ZrrLhdD/sH+qTaxCDUg47eW329yJWCDZmO+iuYzNSyHMs1x0DHKNIQQ8zN
 pA2S/de4jElQuPHjw/IS8B3VmM62Wuq5vHuxNlFv9IMwrwqi6zhCDui8+nCN/AQGGXousJI/SeZjm
 Y5gS9cqh4vNY+huqEEfdTFXIfTBRkmnvYozSO2uDB3EMuiWgBlw2uLrtmkvPLn/m/GvEouLNox6wv
 tcJcIbL59a0+3jv/m7pnWoZXOkWmKQnfFWikqjuKCISNU0gzBSL4UOj8gtQ2z+vu7ffi29b6SV5IL
 m1yzdbkigEn4HL44lz3N+oHZ3wWsRqqeyGSX5fCfx3tGWg6scZQrpsjT5yq+LiffiXVNpjeJ9KzQw
 0cbAZ/9uhk1sWBroP+/gMhsWjlbFYXVlRvkNKGPI22eZtOEz4jF6OrOONyOoY3i26niJUyIgdBpca
 H0hKUSVQ8VnG7qVTNrQk9BbeoSszqRwViN7lfyVtK9b1TCFuGewOETGn0TPvSzruYCtD3CLm7mjuX
 AMBpIGoRUiCFVmF1hlOgqDyH4F6zRTHhKLpfmNzfQcg+Uo147Q2IHpoh0mJsL4FEZEI8hFyecX1Pq
 7HqnvxGD2OhCof1Z6LDxptX0wbgocnYFNxN5S1owcXZUQOFnzYLlLugrcEjlGCm4Gn7k4SiFERSBj
 UFsQgIhw/7lVVn4o4rQjUGF1bCBCYXJrZXIgPHBhdWxAcGF1bGJhcmtlci5tZS51az6JAlQEEwEIA
 D4CGwEFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSYsqrBAKw/grtdVGd0l1yBt+ZrrAUCaWoNAw
 UJCxiQFgAKCRB0l1yBt+ZrrHy+EADNMt+ewz8H7BUKpEMMhpaA1VxyXO5IqlKXS0gElMgHYXl7L7C
 0/qLfRH96vwVD33zM+f0Vl9aWWkom/k8s42tLyPvX7D5zTrj3r5muJ+d9dXWGwBFXxXlE9YjSP26K
 bYfRusmRHbbEPlLPSnrr9KYS2FGVD6ViRNhhVguflgPv2i18+fNBE3YyByfNCiQgO/SgaSdh172Ql
 tuYE1Chk6FD45tCUv3dI9lO2PlVwrciiVYvIv/jiTDEwZOISOClTE/Ha18pxDJfLhS8QQnLWuBNX6
 HUkLi78fVmVYbcWIkTuSHjfNoGTMaFijMg9Wl6poFrY++Pl0S40681zEIrwZhW5pKoqXoaElt29Yf
 OwVo6BIsSOLEqKiWsdP7PJTaJYU1ovnshBcOmuXMgc13AjQ4AhEGqI1TaEJ/E1jEDDyTQFeWgrfew
 YaWdqpgiDmRMTj/tIGVj9iy7qZQICUUtlfm0QK6w6M7qq0GdO2o+S3uVF6y2AxQo8l9LSHiW9O35I
 juR37zeqv72puYyOteVYJsJaw999HUmhXc/X/J9FQFw8twxPKDLLu+w8MqDo9bhllzR93Zy/OShuG
 yGybcX3DKO2R+AQ90tXLbxKmHLtrnG/zyDPhLv/LGD480v5hEoT+IS0u9wPD2vP5q36a5DtzqXA/7
 t9PCamLoCvZLleg7GY7QbUGF1bCBCYXJrZXIgPHBhdWxAcGJya3IudWs+iQJeBDABCgBIFiEEmLKq
 wQCsP4K7XVRndJdcgbfma6wFAmlqDRwqHSBwYnJrci51ayBkb21haW4gd2lsbCBiZSBhbGxvd2VkI
 HRvIGxhcHNlAAoJEHSXXIG35muspk0P/1G08N6zGSdw2p8+8f/1HhaYEb9KdQHT1JmQfZUrIHIpD2
 ELNb91Z6Pz197d/igGpox1dzYOwE0WolWo44ZHX2yw+p9V+HJAUKRe0SPc1iNLkTzaAZ7oYJ1DnFh
 aaqZi4VtKKabKeorJjcDvl2apMwT0agRuDklU97n++ZUuXIEo1Z9uRqEvXz0iTSY7wPxwfoVOQsgf
 dN1cBLd9OpoOtJRdDJzQUYqjNoQi+5M6KRfBxPLZkmYb4uCGlp1H4AV50eC61j84LBg1ItvU2u+Fx
 X2JB7lHTswubprD2ZsSwp1VziU6pUj3vtslMWKpBGslpLtnaO561dihGyElayMd4VFg7VR/TsglJv
 A10EDs2DMhoYPfRQWvwlr5+jPP6s9H8KSTCGFvQt438rP/gk0lcEZUJK0iE2/yq5gQfaCNI5FLN7C
 q8LVr00oS4doXfmFFxMq6z1rs5SXZorWssjG7v5DILnPxLqYloQK/ebM5Ixbzm0Lq/8vWL7sw7yOH
 JVYCHCApGzKNii6rYyHdi0K8UwvpD++GCWLyvbgP/H3l5FqL63gAN0Rw1CO5r22+SmG7aOmekJH3N
 ChZPI3NMLnKZPJC8ZQZ4S8yb5oA3rqTA2DMODvsrEVlaB2cQ6IWHSa/mvBwA8Ias3771cp4fZS7W7
 LUewj8JVy0aJsGTwI4invl
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-xvJ/YDz0pzbXNt/tQta8"
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Tue, 03 Feb 2026 14:17:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/101

--=-xvJ/YDz0pzbXNt/tQta8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Current Dev Position: YP 6.0 M2
Next Deadline: YP 6.0 M2 Build Date 2026-02-16

Next Team Meetings:
- Bug Triage meeting - Thursday 5th Feb. 7:30am PDT
  (https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
- Weekly Project Engineering Sync  - Tuesday 3rd Feb. 8am PDT
  (https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
- Yocto Project Patch Review - Thursday 5th Feb. 10am GMT and Monday 9th Fe=
b. 9am PDT
  (https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1)

Project data dashboard: https://dashboard.yoctoproject.org/=20

Key Status/Updates:
- YP 5.3.1 is due to be released
- YP 6.0 M1 is in QA
- YP 4.0.33 is queued for QA after 6.0 M1
- YP 6.0 M2 is now targeting a build date of 16th Feb. This will give us
  three weeks each for M3 (target date 9th March) and M4 (target build
  date 30th March).
- Good progress has been made with the autobuilder issues but we still
  don=E2=80=99t have the stability in builds we need for reliable project
  operations.
- There are currently 5 high open bugs, which will block M2. Three have
  line of sight to being resolved (Thanks Alex and Michael!):
    - Issues reusing binaries from fedora 42/43 on older systems (#16087)
    - Hangs of the autobuilder controller (database locking?) (#16129)
    - Generation of releases.json needs updating (#16138)
- Two are currently needing further work:=20
    - rust do_test_compile/do_install segfault (#16058)
    - x86 kvm broken on Fedora 43 (#16074)
- =E2=80=9Cbuild-sysroots: useradd command did not succeed=E2=80=9D (#16135=
) was fixed,
  thanks Adrian!
- The number of intermittent failures affecting builds, both stable and
  development, continues to be problematic. Any given build is now
  statistically likely to hit one or more of them and we often don=E2=80=99=
t
  have successful builds. Since we struggle to get help in addressing
  these, we need to change and start potentially blocking releases
  (including stable/LTS) until these get addressed in some way. We are
  holding some dedicated meetings to triage these and find ways of
  removing the failures from our builds which may include reducing
  testing.
- Patches are merging again but there is a backlog and we=E2=80=99ve had to
  prioritize simpler changes. We continue to struggle for bandwidth for
  changes needing in depth review/feedback. This could impact features
  making it into the LTS.

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
- We have a list of issues we think are good places to start contributing:
  https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DNEWCOMER

Tracking Metrics:
- WDD 2945 (last week 2978) (https://wiki.yoctoproject.org/charts/combo.htm=
l)
- OE-Core/Poky Patch Metrics
    - Total patches found: 1100 (last week 1097)
    - Patches in the Pending State: 152 (14%) [last week 152 (14%)]
    - https://valkyrie.yocto.io/pub/non-release/patchmetrics/

YP 6.0 Milestone Dates:
- YP 6.0 M2 Build Date 2026-02-16
- YP 6.0 M2 Release Date 2026-02-27
- YP 6.0 M3 Build Date 2026-03-09
- YP 6.0 M3 Release Date 2026-03-20
- YP 6.0 M4 Build Date 2026-03-30
- YP 6.0 M4 Release Date 2026-04-26

Upcoming dot releases:
- YP 5.3.1 is under review.
- YP 4.0.33 is queued for QA after 6.0 M1.
- YP 5.0.16 Build Date 2026-02-09
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

Best regards,

--=20
Paul Barker


--=-xvJ/YDz0pzbXNt/tQta8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaYICyhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0buc8AQCN06mYXXdr8Iw0uI66M6DrU8FrODwmf1jj
+4av9Oo79AD/QJmO2zfmw2BKuWCpQUkg0JOSh8w22Lk4l+BtgNm8lwE=
=TjAM
-----END PGP SIGNATURE-----

--=-xvJ/YDz0pzbXNt/tQta8--

