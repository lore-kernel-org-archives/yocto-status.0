Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077DBD6552A
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 16:50:24 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.51224.1732639820430184696
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 26 Nov 2024 08:50:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jY9dxmcM;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ea4c5b8fbcso4306149a91.0;
        Tue, 26 Nov 2024 08:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732639819; x=1733244619; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nI5k2hkm2dCv8yL12TKqGqnIPBIIVYi7NEBUEEik/eU=;
        b=jY9dxmcMuyxMCGVmr3XPG8JjHgYVXiFuYLAEof71+K/l05YB1jbiHg9hogzCeht5iv
         kY2t6/Q+lw5Sd1zvxwBJHcL9wXtkQwLsxvC9QnuFZ+IbabowyxNRFS2EqE4raJwJc/0c
         79XQxYbY9RJFIQdsLmjyHfTfKK8WIketlR4ECuJ7iwVBg5y/SW1h+Jp6bpCGye78qLeE
         qsfSQVx9L/bgL+IEnUTbT55lmJh0+K1mX38kt+SOHiXoTzDCinhELpis5DEOAetOwJTE
         YtjBEa2vzMMwtka8+j83XlfnxnxS0/zgEGO2GvHFP/nmdGrb5M+hTL4pqGuPiBymx40P
         bflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732639819; x=1733244619;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nI5k2hkm2dCv8yL12TKqGqnIPBIIVYi7NEBUEEik/eU=;
        b=DOVn6dnrWHa3VXOOIzzjyISmY5060AZyevApiHnE3Onl7YOk7+LwD6qFo/qfwWxRd8
         p+mMpVTPnor1h2oEWW3i03c3FOPTJNwFFyPTrtqALVCrQfGfi8UaukKls5jAWS2NmQXn
         obWOE6dsnAx9MiCl2THQOeOEu0wdhYVIw5QVfVWHhCWSM12JGYRa8qtnLy7pq4MkJmyN
         mr41XzXQR/gaSAkaz9nfifCnEQveNSwU0+8Ado7g8vjBpmCkT4VscRvHI9+9pR8cy8O8
         6UdN6PsDk9n79D924Wqg14VpZ/xUTyXgqZ+Vo23PxMHXiVzk7CY9BaCXJ5XUOMpIVOOP
         wblA==
X-Forwarded-Encrypted: i=1; AJvYcCV0nsKoP1Bqntn5pMl5qXxUEztTGfRzDVQWAtxFbcLpsvwhwt7htqip9TfMgBy1cB/KUPn4YApTTqzBOqA=@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwbMchUgfzEH8nUomqz078c10e93/OnmLtakH+uXrixKPfm51oy
	Ihc014Cra+DNIkSy6OYsfIpsTK1WDZODy6+/LSTxwyWvKXxHpwObg22HOH4IObTwhNk24QSFj/D
	IbPF+s1PSVXkSzpe0YcRdhSuv0bmSB3jIKSM=
X-Gm-Gg: ASbGncvaef5C+PKPLPs5jUUQR0asiTyKyqNnblzMUjs4GhAt/KMQsPyffTzqZtNnAZh
	+wOajdrdzC9sb3uiJo+Swk25eQyW+0EViIPozOFfc3Y9+kupxlR9iBAOduoc46TObuQ==
X-Google-Smtp-Source: AGHT+IEnGU2k6ktSw9Jj1u1G++jJaUtokCzdshME9yTt7ZNNeyzT20cRgVP3u+isB/ikKJ1c9NqXeewsxIG/oU7hwBE=
X-Received: by 2002:a17:90a:b786:b0:2ea:5658:9ed6 with SMTP id
 98e67ed59e1d1-2edebe2e3eemr6241649a91.12.1732639819151; Tue, 26 Nov 2024
 08:50:19 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb8T+_60Cewuu4==Kn+S=4Zs7YvGb_13Bg0FAjizJhVwFg@mail.gmail.com>
In-Reply-To: <CAK5yBb8T+_60Cewuu4==Kn+S=4Zs7YvGb_13Bg0FAjizJhVwFg@mail.gmail.com>
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 26 Nov 2024 09:50:07 -0700
Message-ID: <CAK5yBb864c=vbhRL_ahEiqowpGR+-YNt_Dfrnep0S2G+dmsynw@mail.gmail.com>
Subject: Re: Yocto Project Status 26 Nov. 2024 (WW48)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000f1c18a0627d3a415"
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Tue, 26 Nov 2024 16:50:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/39

--000000000000f1c18a0627d3a415
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Next week will be Yocto Project Virtual Summit 2024.12.  See:
https://www.yoctoproject.org/event/2024-12/

On Tue, Nov 26, 2024 at 8:54=E2=80=AFAM Stephen K Jolley <sjolley.yp.pm@gma=
il.com>
wrote:

> Current Dev Position: YP 5.2 M1
>
> Next Deadline: YP 5.2 M1 Build date 2024-12-09
>
> Next Team Meetings:
>
>    -
>
>    Bug Triage meeting Thursday Nov. 28th at 7:30 am PST (
>    https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
>    -
>
>    Weekly Project Engineering Sync Tuesday Nov. 26th at 8 am PST (
>    https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
>    <https://zoom.us/j/990892712>
>    -
>
>    Twitch -  See https://www.twitch.tv/theyoctojester
>
>
> Key Status/Updates:
>
>    -
>
>    YP 5.0.5 was released.
>    -
>
>    YP 4.0.23 is in under review.
>    -
>
>    Patch merging is continuing to flow but there are a lot of upgrades
>    pending that were recently posted.
>    -
>
>    BB_DANGLINGAPPENDS_WARNONLY was removed.
>    -
>
>    yocto-check-layer is now checking for SECURITY files and there are
>    changes planned for increasing the QA checks tested for.
>    -
>
>    The yocto-testresults repository was reworked and the commits
>    recreated to avoid problems with the size of the repository. The log f=
iles
>    were separated to an http share here:
>    https://valkyrie.yocto.io/pub/non-release/testresult-logarchives/
>
> These changes pose a question/challenge for the stable branches. The
> changes mean we should avoid breaking git mirroring.
>
>    -
>
>    As a result of this work, the reproducible builds summary page now
>    functions much faster.
>    -
>
>    Several performance tweaks were made for bitbake pipe handling for
>    large amounts of log data to avoid slow ptest builds and hangs.
>    -
>
>    A potential new =E2=80=9Cinclude_all=E2=80=9D conf file directive (dis=
cussed on the
>    openembedded-architecture list:
>
> https://lists.openembedded.org/g/openembedded-architecture/message/2055 )
> has no strong objections and is proceeding to proof of concept
>
>    -
>
>    There are patches under review for the addition of configuration
>    fragment management to bitbake. It does require the addition of suppor=
t for
>    =E2=80=98/=E2=80=99 characters in variable flag names (which has been =
requested in the past
>    too).
>    -
>
>    The 5.2 development plans are being developed in this document:
>    https://docs.google.com/document/d/1xsnN_HcaMhqg6Dn1P_19AnumDaUMQSdFZ_=
I4rjD830A/edit?usp=3Dsharing
>
> We need to continue to develop this, thanks to all who have contributed s=
o
> far!
>
> Ways to contribute:
>
>    -
>
>    As people are likely aware, the project has a number of components
>    which are either unmaintained, or have people with little to no time t=
rying
>    to keep them alive. These components include: devtool, toaster, wic, o=
eqa,
>    autobuilder, CROPs containers, pseudo and more. Many have open bugs. H=
elp
>    is welcome in trying to better look after these components!
>    -
>
>    There is an issue open upstream with the openssl project related to
>    making path relocation of openssl easier (as used in our buildtools ta=
rball
>    and SDK). We=E2=80=99d love assistance in moving this forward and gett=
ing some kind
>    of upstream feature merged to make this easier:
>    https://github.com/openssl/openssl/pull/19260
>    -
>
>    There are bugs identified as possible for newcomers to the project:
>    https://wiki.yoctoproject.org/wiki/Newcomers
>    -
>
>    There are bugs that are currently unassigned for YP 5.2. See:
>    https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium+_5.2_Unassigned_E=
nhancements/Bugs
>    -
>
>    We=E2=80=99d welcome new maintainers for recipes in OE-Core. Please se=
e the
>    list at:
>    http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/includ=
e/maintainers.inc
>    and discuss with the existing maintainer, or ask on the OE-Core mailin=
g
>    list. We will likely move a chunk of these to =E2=80=9CUnassigned=E2=
=80=9D soon to help
>    facilitate this.
>    -
>
>    Help is very much welcome in trying to resolve our autobuilder
>    intermittent issues. You can see the list of failures we=E2=80=99re co=
ntinuing to
>    see by searching for the =E2=80=9CAB-INT=E2=80=9D tag in bugzilla:
>    https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DAB-INT.
>    -
>
>    Help us resolve CVE issues: CVE metrics
>    <https://autobuilder.yocto.io/pub/non-release/patchmetrics/>
>    -
>
>    We have a growing number of bugs in bugzilla, any help with them is
>    appreciated.
>    -
>
>    Regarding bugs, even if you can=E2=80=99t fix a bug, submitting a fail=
ing test
>    case that can reproduce the issue significantly improves the chances i=
t
>    might get fixed.
>    -
>
>    Further help on optimizing build disk usage would be most welcome.
>
>
> Tracking Metrics:
>
>    -
>
>    WDD 2736 (last week 2721) (
>    https://wiki.yoctoproject.org/charts/combo.html)
>    -
>
>    OE-Core/Poky Patch Metrics
>    -
>
>       Total patches found: 1073 (last week 1077)
>       -
>
>       Patches in the Pending State: 178 (17%) [last week 178 (17%)]
>       -
>
>       https://autobuilder.yocto.io/pub/non-release/patchmetrics/
>
>
> YP 5.2 Milestone Dates:
>
>    -
>
>    YP 5.2 M1 Build Date 2024-12-09
>    -
>
>    YP 5.2 M1 Release Date 2024-12-20
>    -
>
>    YP 5.2 M2 Build Date 2025-01-20
>    -
>
>    YP 5.2 M2 Release Date 2025-01-31
>    -
>
>    YP 5.2 M3 Build Date 2025-03-03
>    -
>
>    YP 5.2 M3 Release Date 2025-03-14
>    -
>
>    YP 5.2 M4 Build Date 2025-03-31
>    -
>
>    YP 5.2 M4 Release Date 2025-04-25
>
>
> Upcoming dot releases:
>
>    -
>
>    YP 5.0.5 was released.
>    -
>
>    YP 4.0.23 is in review.
>    -
>
>    YP 5.1.1 Build Date 2024-12-02
>    -
>
>    YP 5.1.1 Release Date 2024-12-13
>    -
>
>    YP 5.0.6 Build Date 2024-12-16
>    -
>
>    YP 5.0.6 Release Date 2024-12-27
>    -
>
>    YP 4.0.24 Build Date 2025-01-06
>    -
>
>    YP 4.0.24 Release Date 2025-01-17
>    -
>
>    YP 5.1.2 Build Date 2025-01-13
>    -
>
>    YP 5.1.2 Release Date 2025-01-24
>    -
>
>    YP 5.0.7 Build Date 2025-01-27
>    -
>
>    YP 5.0.7 Release Date 2025-02-07
>    -
>
>    YP 4.0.25 Build Date 2025-02-17
>    -
>
>    YP 4.0.25 Release Date 2025-02-28
>    -
>
>    YP 5.1.3 Build Date 2025-02-24
>    -
>
>    YP 5.1.3 Release Date 2025-03-07
>    -
>
>    YP 5.0.8 Build Date 2025-03-10
>    -
>
>    YP 5.0.8 Release Date 2025-03-21
>    -
>
>    YP 5.1.4 Build Date 2025-03-24
>    -
>
>    YP 5.1.4 Release Date 2025-04-04
>    -
>
>    YP 4.0.26 Build Date 2025-04-07
>    -
>
>    YP 4.0.26 Release Date 2025-04-18
>    -
>
>    YP 5.0.9 Build Date 2025-04-21
>    -
>
>    YP 5.0.9 Release Date 2025-05-02
>    -
>
>    YP 4.0.27 Build Date 2025-05-19
>    -
>
>    YP 4.0.27 Release Date 2025-05-30
>    -
>
>    YP 5.0.10 Build Date 2025-06-02
>    -
>
>    YP 5.0.10 Release Date 2025-06-13
>    -
>
>    YP 4.0.28 Build Date 2025-06-30
>    -
>
>    YP 4.0.28 Release Date 2025-07-11
>
>
> The Yocto Project=E2=80=99s technical governance is through its Technical=
 Steering
> Committee, more information is available at:
>
> https://wiki.yoctoproject.org/wiki/TSC
>
> The Status reports are now stored on the wiki at:
> https://wiki.yoctoproject.org/wiki/Weekly_Status
>
> [If anyone has suggestions for other information you=E2=80=99d like to se=
e on this
> weekly status update, let us know!]
>
> Thanks,
>
>
>
> *Stephen K. Jolley*
>
> *Yocto Project Program Manager*
>
> (    *Cell*:                (208) 244-4460
>
> * *Email*:                 *s
> <stephen.k.jolley@intel.com>jolley.yp.pm@gmail.com <jolley.yp.pm@gmail.co=
m>*
>


--=20

Thanks,



*Stephen K. Jolley*

*Yocto Project Program Manager*

(    *Cell*:                (208) 244-4460

* *Email*:                 *s
<stephen.k.jolley@intel.com>jolley.yp.pm@gmail.com <jolley.yp.pm@gmail.com>=
*

--000000000000f1c18a0627d3a415
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Next week will be Yocto Project Virtual Summit 2024.12.=C2=
=A0 See:=C2=A0<a href=3D"https://www.yoctoproject.org/event/2024-12/">https=
://www.yoctoproject.org/event/2024-12/</a></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 26, 2024 at 8:54=E2=
=80=AFAM Stephen K Jolley &lt;<a href=3D"mailto:sjolley.yp.pm@gmail.com">sj=
olley.yp.pm@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div><span id=3D"m_-45001813187852424=
90gmail-docs-internal-guid-dd037f42-7fff-e0cf-b007-37a7db0af039"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span styl=
e=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;font-variant-alternates:normal;vertical-align:baseline">Current Dev Pos=
ition: YP 5.2 M1</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,=
sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;font-variant-alternates:normal;ver=
tical-align:baseline">Next Deadline: YP 5.2 M1 Build date 2024-12-09</span>=
</p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rg=
b(0,0,0);background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;font-variant-alternates:normal;vertical-align:baselin=
e">Next Team Meetings:</span></p><ul style=3D"margin-top:0px;margin-bottom:=
0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:9.5pt;font-fam=
ily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:=
normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;vertical-align:baseline">Bug Triage meeting Thursday Nov. 28th at 7:30 am =
PST (</span><a href=3D"https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bF=
d5aVpHVVZ6dz09" style=3D"text-decoration-line:none" target=3D"_blank"><span=
 style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;font-variant-alternates:normal;text-d=
ecoration-line:underline;vertical-align:baseline">https://zoom.us/j/4543676=
03?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</span></a><span style=3D"font-siz=
e:11pt;background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline"=
>)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:9=
.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varian=
t-alternates:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D=
"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"p=
resentation"><span style=3D"font-size:11pt;background-color:transparent;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;font-variant-altern=
ates:normal;vertical-align:baseline">Weekly Project Engineering Sync Tuesda=
y Nov. 26th at 8 am PST (</span><a href=3D"https://zoom.us/j/990892712?pwd=
=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09" style=3D"text-decoration-line:none" ta=
rget=3D"_blank"><span style=3D"font-size:11pt;background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alt=
ernates:normal;text-decoration-line:underline;vertical-align:baseline">http=
s://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</span></a><a=
 href=3D"https://zoom.us/j/990892712" style=3D"text-decoration-line:none" t=
arget=3D"_blank"><span style=3D"font-size:11pt;background-color:transparent=
;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-al=
ternates:normal;text-decoration-line:underline;vertical-align:baseline">)</=
span></a></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:9=
.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varian=
t-alternates:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D=
"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"p=
resentation"><span style=3D"font-size:11pt;background-color:transparent;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;font-variant-altern=
ates:normal;vertical-align:baseline">Twitch -=C2=A0 See </span><a href=3D"h=
ttps://www.twitch.tv/theyoctojester" style=3D"text-decoration-line:none" ta=
rget=3D"_blank"><span style=3D"font-size:11pt;background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alt=
ernates:normal;text-decoration-line:underline;vertical-align:baseline">http=
s://www.twitch.tv/theyoctojester</span></a><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;font-variant-alternates:normal;vertical-align:baseline">=C2=A0</=
span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans=
-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-variant-alternates:normal;vertica=
l-align:baseline">Key Status/Updates:</span></p><ul style=3D"margin-top:0px=
;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size=
:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varia=
nt-alternates:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">YP 5.0.5 was released.</span></p>=
</li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fami=
ly:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:n=
ormal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><=
span style=3D"font-size:11pt;background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;ve=
rtical-align:baseline">YP 4.0.23 is in under review.</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;font-variant-alternates:normal;vertic=
al-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline">Patch merging is continuing to flow but there are a lot of upg=
rades pending that were recently posted.</span></p></li><li dir=3D"ltr" sty=
le=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;vertical-align:bas=
eline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:=
11pt;background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-variant-alternates:normal;vertical-align:baseline">B=
B_DANGLINGAPPENDS_WARNONLY was removed.</span></p></li><li dir=3D"ltr" styl=
e=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;vertical-align:baseline">yo=
cto-check-layer is now checking for SECURITY files and there are changes pl=
anned for increasing the QA checks tested for.</span></p></li><li dir=3D"lt=
r" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-seri=
f;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font=
-size:11pt;background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;font-variant-alternates:normal;vertical-align:basel=
ine">The yocto-testresults repository was reworked and the commits recreate=
d to avoid problems with the size of the repository. The log files were sep=
arated to an http share here: </span><a href=3D"https://valkyrie.yocto.io/p=
ub/non-release/testresult-logarchives/" style=3D"text-decoration-line:none"=
 target=3D"_blank"><span style=3D"font-size:11pt;background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-=
alternates:normal;text-decoration-line:underline;vertical-align:baseline">h=
ttps://valkyrie.yocto.io/pub/non-release/testresult-logarchives/</span></a>=
</p></li></ul><p dir=3D"ltr" style=3D"line-height:1.38;margin-left:36pt;mar=
gin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Ar=
ial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;vertical-align:baseline">These changes pose a question/challenge for the s=
table branches. The changes mean we should avoid breaking git mirroring.</s=
pan></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" styl=
e=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;vertical-align:baseline">As=
 a result of this work, the reproducible builds summary page now functions =
much faster.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;f=
ont-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fo=
nt-variant-alternates:normal;vertical-align:baseline;white-space:pre-wrap">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" =
role=3D"presentation"><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varia=
nt-alternates:normal;vertical-align:baseline">Several performance tweaks we=
re made for bitbake pipe handling for large amounts of log data to avoid sl=
ow ptest builds and hangs.</span></p></li><li dir=3D"ltr" style=3D"list-sty=
le-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;font-variant-alternates:normal;vertical-align:baseline;white-sp=
ace:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;font-variant-alternates:normal;vertical-align:baseline">A potential new=
 =E2=80=9Cinclude_all=E2=80=9D conf file directive (discussed on the openem=
bedded-architecture list:</span></p></li></ul><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-left:36pt;margin-top:0pt;margin-bottom:0pt"><a href=3D"h=
ttps://lists.openembedded.org/g/openembedded-architecture/message/2055" sty=
le=3D"text-decoration-line:none" target=3D"_blank"><span style=3D"font-size=
:11pt;font-family:Arial,sans-serif;background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:nor=
mal;text-decoration-line:underline;vertical-align:baseline">https://lists.o=
penembedded.org/g/openembedded-architecture/message/2055</span></a><span st=
yle=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;font-variant-alternates:normal;vertical-align:baseline"> ) has no str=
ong objections and is proceeding to proof of concept</span></p><ul style=3D=
"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type=
:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;font-variant-alternates:normal;vertical-align:baseline;white-space:pre=
-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fon=
t-variant-alternates:normal;vertical-align:baseline">There are patches unde=
r review for the addition of configuration fragment management to bitbake. =
It does require the addition of support for =E2=80=98/=E2=80=99 characters =
in variable flag names (which has been requested in the past too).</span></=
p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates=
:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;vertical-align:baseline">The 5.2 development plans are being developed in =
this document: </span><a href=3D"https://docs.google.com/document/d/1xsnN_H=
caMhqg6Dn1P_19AnumDaUMQSdFZ_I4rjD830A/edit?usp=3Dsharing" style=3D"text-dec=
oration-line:none" target=3D"_blank"><span style=3D"font-size:11pt;backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;font-variant-alternates:normal;text-decoration-line:underline;vertical=
-align:baseline">https://docs.google.com/document/d/1xsnN_HcaMhqg6Dn1P_19An=
umDaUMQSdFZ_I4rjD830A/edit?usp=3Dsharing</span></a></p></li></ul><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-left:36pt;margin-top:0pt;margin-botto=
m:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb=
(0,0,0);background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline=
">We need to continue to develop this, thanks to all who have contributed s=
o far!</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-s=
erif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-=
align:baseline">Ways to contribute:</span></p><ul style=3D"margin-top:0px;m=
argin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:1=
1pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant=
-alternates:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pr=
esentation"><span style=3D"font-size:11pt;background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alterna=
tes:normal;vertical-align:baseline">As people are likely aware, the project=
 has a number of components which are either unmaintained, or have people w=
ith little to no time trying to keep them alive. These components include: =
devtool, toaster, wic, oeqa, autobuilder, CROPs containers, pseudo and more=
. Many have open bugs. Help is welcome in trying to better look after these=
 components!</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;f=
ont-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;vertical-align:baseline;white-space:pre-wrap"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
 role=3D"presentation"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;font-vari=
ant-alternates:normal;vertical-align:baseline">There is an issue open upstr=
eam with the openssl project related to making path relocation of openssl e=
asier (as used in our buildtools tarball and SDK). We=E2=80=99d love assist=
ance in moving this forward and getting some kind of upstream feature merge=
d to make this easier: </span><a href=3D"https://github.com/openssl/openssl=
/pull/19260" style=3D"text-decoration-line:none" target=3D"_blank"><span st=
yle=3D"font-size:11pt;background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;font-variant-alternates:normal;text-deco=
ration-line:underline;vertical-align:baseline">https://github.com/openssl/o=
penssl/pull/19260</span></a></p></li><li dir=3D"ltr" style=3D"list-style-ty=
pe:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-variant-alternates:normal;vertical-align:baseline;white-space:p=
re-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;vertical-align:baseline">There are bugs ident=
ified as possible for newcomers to the project: </span><a href=3D"https://w=
iki.yoctoproject.org/wiki/Newcomers" style=3D"text-decoration-line:none" ta=
rget=3D"_blank"><span style=3D"font-size:11pt;background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alt=
ernates:normal;text-decoration-line:underline;vertical-align:baseline">http=
s://wiki.yoctoproject.org/wiki/Newcomers</span></a></p></li><li dir=3D"ltr"=
 style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;=
color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-variant-alternates:normal;vertical-align=
:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-s=
ize:11pt;background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;font-variant-alternates:normal;vertical-align:baselin=
e">There are bugs that are currently unassigned for YP 5.2. See: </span><a =
href=3D"https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium+_5.2_Unassigne=
d_Enhancements/Bugs" style=3D"text-decoration-line:none" target=3D"_blank">=
<span style=3D"font-size:11pt;background-color:transparent;font-variant-num=
eric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;t=
ext-decoration-line:underline;vertical-align:baseline">https://wiki.yoctopr=
oject.org/wiki/Bug_Triage#Medium+_5.2_Unassigned_Enhancements/Bugs</span></=
a></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fon=
t-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;font-variant-altern=
ates:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentat=
ion"><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:nor=
mal;vertical-align:baseline">We=E2=80=99d welcome new maintainers for recip=
es in OE-Core. Please see the list at: </span><a href=3D"http://git.yoctopr=
oject.org/cgit.cgi/poky/tree/meta/conf/distro/include/maintainers.inc" styl=
e=3D"text-decoration-line:none" target=3D"_blank"><span style=3D"font-size:=
11pt;background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-variant-alternates:normal;text-decoration-line:under=
line;vertical-align:baseline">http://git.yoctoproject.org/cgit.cgi/poky/tre=
e/meta/conf/distro/include/maintainers.inc</span></a><span style=3D"font-si=
ze:11pt;background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline=
"> and discuss with the existing maintainer, or ask on the OE-Core mailing =
list. We will likely move a chunk of these to =E2=80=9CUnassigned=E2=80=9D =
soon to help facilitate this.</span></p></li><li dir=3D"ltr" style=3D"list-=
style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0=
);background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;font-variant-alternates:normal;vertical-align:baseline;white=
-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-variant-alternates:normal;vertical-align:baseline">Help is very=
 much welcome in trying to resolve our autobuilder intermittent issues. You=
 can see the list of failures we=E2=80=99re continuing to see by searching =
for the =E2=80=9CAB-INT=E2=80=9D tag in bugzilla: </span><a href=3D"https:/=
/bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DAB-INT" style=3D"text-=
decoration-line:none" target=3D"_blank"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;font-variant-alternates:normal;text-decoration-line:underline;verti=
cal-align:baseline">https://bugzilla.yoctoproject.org/buglist.cgi?quicksear=
ch=3DAB-INT</span></a><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varia=
nt-alternates:normal;vertical-align:baseline">.</span></p></li><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-al=
ign:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line">Help us resolve CVE issues: </span><a href=3D"https://autobuilder.yoc=
to.io/pub/non-release/patchmetrics/" style=3D"text-decoration-line:none" ta=
rget=3D"_blank"><span style=3D"font-size:11pt;background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alt=
ernates:normal;text-decoration-line:underline;vertical-align:baseline">CVE =
metrics</span></a><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">=C2=A0</span></p></li><li dir=3D"=
ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-se=
rif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-a=
lign:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fo=
nt-size:11pt;background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;vertical-align:bas=
eline">We have a growing number of bugs in bugzilla, any help with them is =
appreciated.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;f=
ont-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fo=
nt-variant-alternates:normal;vertical-align:baseline;white-space:pre-wrap">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" =
role=3D"presentation"><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varia=
nt-alternates:normal;vertical-align:baseline">Regarding bugs, even if you c=
an=E2=80=99t fix a bug, submitting a failing test case that can reproduce t=
he issue significantly improves the chances it might get fixed.</span></p><=
/li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-famil=
y:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:no=
rmal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><s=
pan style=3D"font-size:11pt;background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;font-variant-alternates:normal;ver=
tical-align:baseline">Further help on optimizing build disk usage would be =
most welcome.</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates=
:normal;vertical-align:baseline">Tracking Metrics:</span></p><ul style=3D"m=
argin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:d=
isc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-variant-alternates:normal;vertical-align:baseline;white-space:pre-w=
rap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-=
variant-alternates:normal;vertical-align:baseline">WDD 2736 (last week 2721=
) </span><span style=3D"font-size:11pt;font-family:Consolas,sans-serif;back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;font-variant-alternates:normal;vertical-align:baseline">(</span><a=
 href=3D"https://wiki.yoctoproject.org/charts/combo.html" style=3D"text-dec=
oration-line:none" target=3D"_blank"><span style=3D"font-size:11pt;backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;font-variant-alternates:normal;text-decoration-line:underline;vertical=
-align:baseline">https://wiki.yoctoproject.org/charts/combo.html</span></a>=
<span style=3D"font-size:11pt;font-family:Consolas,sans-serif;background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
font-variant-alternates:normal;vertical-align:baseline">)</span></p></li><l=
i dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Cons=
olas,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norma=
l;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span=
 style=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-var=
iant-alternates:normal;vertical-align:baseline">OE-Core/Poky Patch Metrics<=
/span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"lt=
r" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-se=
rif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-a=
lign:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fo=
nt-size:11pt;background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;vertical-align:bas=
eline">Total patches found: 1073 (last week 1077)</span></p></li><li dir=3D=
"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans=
-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-variant-alternates:normal;vertica=
l-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D=
"font-size:11pt;background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:=
baseline">Patches in the Pending State: 178 (17%) [last week 178 (17%)]</sp=
an></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;=
font-family:Consolas,sans-serif;color:rgb(0,0,0);background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-=
alternates:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pre=
sentation"><a href=3D"https://autobuilder.yocto.io/pub/non-release/patchmet=
rics/" style=3D"text-decoration-line:none" target=3D"_blank"><span style=3D=
"font-size:11pt;font-family:Arial,sans-serif;background-color:transparent;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alte=
rnates:normal;text-decoration-line:underline;vertical-align:baseline">https=
://autobuilder.yocto.io/pub/non-release/patchmetrics/</span></a></p></li></=
ul></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;vertical-align:bas=
eline">YP 5.2 Milestone Dates:</span></p><ul style=3D"margin-top:0px;margin=
-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;f=
ont-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alte=
rnates:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"present=
ation"><span style=3D"font-size:11pt;background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:n=
ormal;vertical-align:baseline">YP 5.2 M1 Build Date 2024-12-09</span><span =
style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-variant-alternates:normal;vertica=
l-align:baseline"><span>	</span></span></p></li><li dir=3D"ltr" style=3D"li=
st-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,=
0,0);background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-variant-alternates:normal;vertical-align:baseline;wh=
ite-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;font-variant-alternates:normal;vertical-align:baseline">YP 5.2 M1=
 Release Date 2024-12-20</span></p></li><li dir=3D"ltr" style=3D"list-style=
-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;font-variant-alternates:normal;vertical-align:baseline;white-spac=
e:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;font-variant-alternates:normal;vertical-align:baseline">YP 5.2 M2 Build D=
ate 2025-01-20</span><span style=3D"font-size:11pt;background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varian=
t-alternates:normal;vertical-align:baseline"><span>	</span></span></p></li>=
<li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ar=
ial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-variant-alternates:normal;vertica=
l-align:baseline">YP 5.2 M2 Release Date 2025-01-31</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;font-variant-alternates:normal;vertic=
al-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline">YP 5.2 M3 Build Date 2025-03-03</span><span style=3D"font-size=
:11pt;background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline">=
<span>	</span></span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc=
;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
font-variant-alternates:normal;vertical-align:baseline;white-space:pre-wrap=
"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-var=
iant-alternates:normal;vertical-align:baseline">YP 5.2 M3 Release Date 2025=
-03-14</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-si=
ze:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-var=
iant-alternates:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">YP 5.2 M4 Build Date 2025-03-31</=
span><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:nor=
mal;vertical-align:baseline"><span>	</span></span></p></li><li dir=3D"ltr" =
style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;c=
olor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:=
baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-si=
ze:11pt;background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline=
">YP 5.2 M4 Release Date 2025-04-25</span></p></li></ul><br><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;vertical-align:baseline">Upcoming dot release=
s:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr"=
 style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;=
color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-variant-alternates:normal;vertical-align=
:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-s=
ize:11pt;background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;font-variant-alternates:normal;vertical-align:baselin=
e">YP 5.0.5 was released.</span></p></li><li dir=3D"ltr" style=3D"list-styl=
e-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;font-variant-alternates:normal;vertical-align:baseline;white-spa=
ce:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-variant-alternates:normal;vertical-align:baseline">YP 4.0.23 is in =
review.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-s=
ize:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-va=
riant-alternates:normal;vertical-align:baseline;white-space:pre-wrap"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">YP 5.1.1 Build Date 2024-12-02=C2=
=A0</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:=
11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varian=
t-alternates:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D=
"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"p=
resentation"><span style=3D"font-size:11pt;background-color:transparent;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;font-variant-altern=
ates:normal;vertical-align:baseline">YP 5.1.1 Release Date 2024-12-13</span=
></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font=
-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alterna=
tes:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentati=
on"><span style=3D"font-size:11pt;background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norm=
al;vertical-align:baseline">YP 5.0.6 Build Date 2024-12-16=C2=A0</span></p>=
</li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fami=
ly:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:n=
ormal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><=
span style=3D"font-size:11pt;background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;ve=
rtical-align:baseline">YP 5.0.6 Release Date 2024-12-27</span></p></li><li =
dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,=
sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;font-variant-alternates:normal;ver=
tical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-al=
ign:baseline">YP 4.0.24 Build Date 2025-01-06</span><span style=3D"font-siz=
e:11pt;background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline"=
><span>	</span></span></p></li><li dir=3D"ltr" style=3D"list-style-type:dis=
c;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;font-variant-alternates:normal;vertical-align:baseline;white-space:pre-wra=
p"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-va=
riant-alternates:normal;vertical-align:baseline">YP 4.0.24 Release Date 202=
5-01-17</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-s=
ize:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-va=
riant-alternates:normal;vertical-align:baseline;white-space:pre-wrap"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">YP 5.1.2 Build Date 2025-01-13</s=
pan><span style=3D"font-size:11pt;background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norm=
al;vertical-align:baseline"><span>	</span></span></p></li><li dir=3D"ltr" s=
tyle=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;co=
lor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:b=
aseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-siz=
e:11pt;background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline"=
>YP 5.1.2 Release Date 2025-01-24</span></p></li><li dir=3D"ltr" style=3D"l=
ist-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0=
,0,0);background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline;w=
hite-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;font-variant-alternates:normal;vertical-align:baseline">YP 5.0.7=
 Build Date 2025-01-27</span><span style=3D"font-size:11pt;background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fon=
t-variant-alternates:normal;vertical-align:baseline"><span>	</span></span><=
/p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-f=
amily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;font-variant-alternate=
s:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;vertical-align:baseline">YP 5.0.7 Release Date 2025-02-07</span></p></li><=
li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ari=
al,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;=
vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span s=
tyle=3D"font-size:11pt;background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical=
-align:baseline">YP 4.0.25 Build Date 2025-02-17</span><span style=3D"font-=
size:11pt;background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;font-variant-alternates:normal;vertical-align:baseli=
ne"><span>	</span></span></p></li><li dir=3D"ltr" style=3D"list-style-type:=
disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;font-variant-alternates:normal;vertical-align:baseline;white-space:pre-=
wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;font=
-variant-alternates:normal;vertical-align:baseline">YP 4.0.25 Release Date =
2025-02-28</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;fon=
t-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;font=
-variant-alternates:normal;vertical-align:baseline;white-space:pre-wrap"><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" ro=
le=3D"presentation"><span style=3D"font-size:11pt;background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant=
-alternates:normal;vertical-align:baseline">YP 5.1.3 Build Date 2025-02-24<=
/span><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:no=
rmal;vertical-align:baseline"><span>	</span></span></p></li><li dir=3D"ltr"=
 style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;=
color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-variant-alternates:normal;vertical-align=
:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-s=
ize:11pt;background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;font-variant-alternates:normal;vertical-align:baselin=
e">YP 5.1.3 Release Date 2025-03-07</span></p></li><li dir=3D"ltr" style=3D=
"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb=
(0,0,0);background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline=
;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;font-variant-alternates:normal;vertical-align:baseline">YP 5.0=
.8 Build Date 2025-03-10</span><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;vertical-align:baseline"><span>	</span></span=
></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font=
-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alterna=
tes:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentati=
on"><span style=3D"font-size:11pt;background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norm=
al;vertical-align:baseline">YP 5.0.8 Release Date 2025-03-21</span></p></li=
><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:A=
rial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norma=
l;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span=
 style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;font-variant-alternates:normal;vertic=
al-align:baseline">YP 5.1.4 Build Date 2025-03-24</span><span style=3D"font=
-size:11pt;background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;font-variant-alternates:normal;vertical-align:basel=
ine"><span>	</span></span></p></li><li dir=3D"ltr" style=3D"list-style-type=
:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;font-variant-alternates:normal;vertical-align:baseline;white-space:pre=
-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fon=
t-variant-alternates:normal;vertical-align:baseline">YP 5.1.4 Release Date =
2025-04-04</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;fon=
t-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;font=
-variant-alternates:normal;vertical-align:baseline;white-space:pre-wrap"><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" ro=
le=3D"presentation"><span style=3D"font-size:11pt;background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant=
-alternates:normal;vertical-align:baseline">YP 4.0.26 Build Date 2025-04-07=
</span><span style=3D"font-size:11pt;background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:n=
ormal;vertical-align:baseline"><span>	</span></span></p></li><li dir=3D"ltr=
" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;font-variant-alternates:normal;vertical-alig=
n:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-=
size:11pt;background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;font-variant-alternates:normal;vertical-align:baseli=
ne">YP 4.0.26 Release Date 2025-04-18</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;font-variant-alternates:normal;vertical-align:basel=
ine;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11=
pt;background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;font-variant-alternates:normal;vertical-align:baseline">YP =
5.0.9 Build Date 2025-04-21</span><span style=3D"font-size:11pt;background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;font-variant-alternates:normal;vertical-align:baseline"><span>	</span></s=
pan></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;f=
ont-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alte=
rnates:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"present=
ation"><span style=3D"font-size:11pt;background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:n=
ormal;vertical-align:baseline">YP 5.0.9 Release Date 2025-05-02</span></p><=
/li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-famil=
y:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:no=
rmal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><s=
pan style=3D"font-size:11pt;background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;font-variant-alternates:normal;ver=
tical-align:baseline">YP 4.0.27 Build Date 2025-05-19</span><span style=3D"=
font-size:11pt;background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:b=
aseline"><span>	</span></span></p></li><li dir=3D"ltr" style=3D"list-style-=
type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;font-variant-alternates:normal;vertical-align:baseline;white-space=
:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;font-variant-alternates:normal;vertical-align:baseline">YP 4.0.27 Release =
Date 2025-05-30</span></p></li><li dir=3D"ltr" style=3D"list-style-type:dis=
c;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;font-variant-alternates:normal;vertical-align:baseline;white-space:pre-wra=
p"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-va=
riant-alternates:normal;vertical-align:baseline">YP 5.0.10 Build Date 2025-=
06-02</span><span style=3D"font-size:11pt;background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alterna=
tes:normal;vertical-align:baseline"><span>	</span></span></p></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;font-variant-alternates:normal;vertic=
al-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline">YP 5.0.10 Release Date 2025-06-13</span></p></li><li dir=3D"lt=
r" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-seri=
f;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font=
-size:11pt;background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;font-variant-alternates:normal;vertical-align:basel=
ine">YP 4.0.28 Build Date 2025-06-30</span><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;font-variant-alternates:normal;vertical-align:baseline"><span>	<=
/span></span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-si=
ze:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-var=
iant-alternates:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">YP 4.0.28 Release Date 2025-07-11=
</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sa=
ns-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;font-variant-alternates:normal;verti=
cal-align:baseline">The Yocto Project=E2=80=99s technical governance is thr=
ough its Technical Steering Committee, more information is available at:</s=
pan></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt"><a href=3D"https://wiki.yoctoproject.org/wiki/TSC" style=3D"text-de=
coration-line:none" target=3D"_blank"><span style=3D"font-size:11pt;font-fa=
mily:Arial,sans-serif;background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;font-variant-alternates:normal;text-deco=
ration-line:underline;vertical-align:baseline">https://wiki.yoctoproject.or=
g/wiki/TSC</span></a></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Aria=
l,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-num=
eric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;v=
ertical-align:baseline">The Status reports are now stored on the wiki at: <=
/span><a href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status" style=3D=
"text-decoration-line:none" target=3D"_blank"><span style=3D"font-size:11pt=
;font-family:Arial,sans-serif;background-color:transparent;font-variant-num=
eric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;t=
ext-decoration-line:underline;vertical-align:baseline">https://wiki.yoctopr=
oject.org/wiki/Weekly_Status</span></a></p><br><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11p=
t;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">[If anyone has suggestions for ot=
her information you=E2=80=99d like to see on this weekly status update, let=
 us know!]</span></p></span><br></div><div dir=3D"ltr" class=3D"gmail_signa=
ture"><div dir=3D"ltr"><div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"bac=
kground-image:initial;background-position:initial;background-repeat:initial=
"><span style=3D"font-size:12pt;font-family:Arial,sans-serif">Thanks,<span>=
</span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:12pt;font-fam=
ily:Arial,sans-serif">=C2=A0<span></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><b><i><span style=3D"font-size:16pt;co=
lor:purple">Stephen K. Jolley</span></i></b><span style=3D"font-size:12pt;f=
ont-family:Arial,sans-serif"><span></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><b><span style=3D"font-size:8pt;font-f=
amily:&quot;Courier New&quot;;color:blue">Yocto Project Program Manager</sp=
an></b></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:9pt;font-fami=
ly:Wingdings;color:black">(</span><span style=3D"font-size:9pt;font-family:=
&quot;MS Sans Serif&quot;,serif;color:teal">=C2=A0=C2=A0=C2=A0=C2=A0</span>=
<b><span style=3D"font-size:8pt;font-family:&quot;Comic Sans MS&quot;;color=
:teal">Cell</span></b><span style=3D"font-size:9pt;font-family:&quot;MS San=
s Serif&quot;,serif;color:teal">:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span><span style=3D"font=
-size:9pt;font-family:&quot;MS Sans Serif&quot;,serif">(208) 244-4460</span=
><span style=3D"font-size:12pt;font-family:Arial,sans-serif"><span></span><=
/span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:9pt;font-fami=
ly:Wingdings">*=C2=A0</span><b><span lang=3D"FR" style=3D"font-size:8pt;fon=
t-family:&quot;Comic Sans MS&quot;;color:teal">Email</span></b><span lang=
=3D"FR" style=3D"font-size:9pt;font-family:&quot;MS Sans Serif&quot;,serif;=
color:teal">:</span><span lang=3D"FR" style=3D"font-size:9pt;font-family:&q=
uot;MS Sans Serif&quot;,serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</span><u><span=
 lang=3D"FR" style=3D"font-size:9pt;font-family:&quot;MS Sans Serif&quot;,s=
erif;color:blue"><span style=3D"color:rgb(17,85,204)"><a href=3D"mailto:ste=
phen.k.jolley@intel.com" target=3D"_blank">s</a><a href=3D"mailto:jolley.yp=
.pm@gmail.com" target=3D"_blank">jolley.yp.pm@gmail.com</a></span></span></=
u></p></div></div></div></div>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div dir=3D"ltr"><p class=3D"MsoNormal" style=3D=
"background-image:initial;background-position:initial;background-repeat:ini=
tial"><span style=3D"font-size:12pt;font-family:Arial,sans-serif">Thanks,<s=
pan></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:12pt;font-fam=
ily:Arial,sans-serif">=C2=A0<span></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><b><i><span style=3D"font-size:16pt;co=
lor:purple">Stephen K. Jolley</span></i></b><span style=3D"font-size:12pt;f=
ont-family:Arial,sans-serif"><span></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><b><span style=3D"font-size:8pt;font-f=
amily:&quot;Courier New&quot;;color:blue">Yocto Project Program Manager</sp=
an></b></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:9pt;font-fami=
ly:Wingdings;color:black">(</span><span style=3D"font-size:9pt;font-family:=
&quot;MS Sans Serif&quot;,serif;color:teal">=C2=A0=C2=A0=C2=A0=C2=A0</span>=
<b><span style=3D"font-size:8pt;font-family:&quot;Comic Sans MS&quot;;color=
:teal">Cell</span></b><span style=3D"font-size:9pt;font-family:&quot;MS San=
s Serif&quot;,serif;color:teal">:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span><span style=3D"font=
-size:9pt;font-family:&quot;MS Sans Serif&quot;,serif">(208) 244-4460</span=
><span style=3D"font-size:12pt;font-family:Arial,sans-serif"><span></span><=
/span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:9pt;font-fami=
ly:Wingdings">*=C2=A0</span><b><span lang=3D"FR" style=3D"font-size:8pt;fon=
t-family:&quot;Comic Sans MS&quot;;color:teal">Email</span></b><span lang=
=3D"FR" style=3D"font-size:9pt;font-family:&quot;MS Sans Serif&quot;,serif;=
color:teal">:</span><span lang=3D"FR" style=3D"font-size:9pt;font-family:&q=
uot;MS Sans Serif&quot;,serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</span><u><span=
 lang=3D"FR" style=3D"font-size:9pt;font-family:&quot;MS Sans Serif&quot;,s=
erif;color:blue"><span style=3D"color:rgb(17,85,204)"><a href=3D"mailto:ste=
phen.k.jolley@intel.com" target=3D"_blank">s</a><a href=3D"mailto:jolley.yp=
.pm@gmail.com" target=3D"_blank">jolley.yp.pm@gmail.com</a></span></span></=
u></p></div></div></div>

--000000000000f1c18a0627d3a415--

