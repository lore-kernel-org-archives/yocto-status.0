Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4ED3ECE57A
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 14:55:55 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.25741.1725980149683630119
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 10 Sep 2024 07:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c+jZWx7b;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7178df70f28so689625b3a.2;
        Tue, 10 Sep 2024 07:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725980149; x=1726584949; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=up1p7AuSMtJ4YmI3q7vI259XTZBB61xGTQSWDpn+YGY=;
        b=c+jZWx7bcKF/YWh7zxa80XCtLLDlM3u7zMxfJpbDK7R0RnthKGkyQGyfQePCY7rblA
         2wq5I4d2Z3NPgbgMGJiSLyiluXpsNx89Qg9JQr2nQcTn/m9Y4uHVazPKG5ayhI9+2y7/
         LmmdIVKA5TZYywEW6X9ac/Ov5eIz9n0GULCYlsfcr93QnTPyQM6CYIbAoRXyt/zzytWv
         7zDP//7iyIYdpGjnJeePlblSgB0pmmtypWBwUr4VNfrEY7HNID+BrEwx9KsT7BfH1iDO
         HxR1jYlBQSFmxqT1tBH4qkUdP4n9mGBtREQb7B4rQsAGy3VdoiXqSilj241DdbviFqK9
         fvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725980149; x=1726584949;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=up1p7AuSMtJ4YmI3q7vI259XTZBB61xGTQSWDpn+YGY=;
        b=t79VuPNNQSgDFg3iYmGwUa/xj2tchWw+CMwMThmG+cwPBX63hfFu+P/C7FeFM+TpjK
         V42og7cTDks2kpus6kHqH9Q32vnJP/SvR+vjM3EWtbtMmnCUO26KNeUpbxQHm4xtYvVQ
         2znSMr+r25HwEsfbNeX5pfxAcNH0J6/0ihsYB5RdSP6ZGsRQQKGw0yHD44jzVSV0aohp
         RcxyekRKhxMV72G1Htyr5svMM/IkuuyaE/XwyHCtQu+ofi2FFWL8i99xNmvXSOuot55W
         viPoSmMwn3sFVbFkdql75iqRYJSXoyQSZ/P7f8g33OICVKpPHTwieZ4wFrkvO7S2cSFS
         etCg==
X-Forwarded-Encrypted: i=1; AJvYcCVMj58h1hsSqmSVIRaZwmkEGEgTdhHuE1AyCzeVahKGgI+nymoOsIz3XVpVP974HIgQux0JY8Y3wAMbBew=@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yy73C8dJpCPcdsyNDCyUr7VD4tonX3Uzz79QJwDM/besrG6mTK/
	BsULFFcbH2ZL3GnmL8Mev6yrImDkPMS2FO352dThlv+/CC378ef9tIJm4be8RSRNeIfUKqZ85FQ
	eSnV0Xj540vGFOduy+zjSF89jz/JtxCcn
X-Google-Smtp-Source: AGHT+IHNMgl6PiI3qDervZ+3yCnTjNF1aS1l9khM/7PtuLqROu73WnLm4RA+HxJL3GZruxSLrdGgDEDqb9pl799yvI8=
X-Received: by 2002:a05:6a00:85a5:b0:714:340c:b9ee with SMTP id
 d2e1a72fcca58-718d5df1d0amr12677400b3a.1.1725980148655; Tue, 10 Sep 2024
 07:55:48 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 10 Sep 2024 07:54:36 -0700
Message-ID: <CAK5yBb8HgSVYw_WpDhqbYRQD4C+McZKjO8merckGe720=CJYKA@mail.gmail.com>
Subject: Yocto Project Status 10 Sept. 2024 (WW37)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000a66e5c0621c5115f"
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Tue, 10 Sep 2024 14:55:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/26

--000000000000a66e5c0621c5115f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 5.1 Feature Freeze and Bug Fixing

Next Deadline: YP 5.1 M4 Build 30 Sept. 2024

Next Team Meetings:

   -

   Bug Triage meeting Thursday Sept. 12th at 7:30 am PST (
   https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
   -

   Weekly Project Engineering Sync Tuesday Sept. 10th at 8 am PST (
   https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
   <https://zoom.us/j/990892712>
   -

   Twitch -  See https://www.twitch.tv/theyoctojester


Key Status/Updates:

   -

   YP 5.1 M3 is due to be released
   -

   YP 4.0.21 is in QA
   -

   We are now at feature freeze and working on bug fixing for the final 5.1
   release builds
   -

   Due to timing of autobuilder infrastructure changes, vacations, no
   release blocking bugs and also seemingly limited availability of people =
to
   help with general bug fixing, we are considering an early M4 build, mayb=
e
   even this week. If that would cause problems for anyone, please let
   Richard/the TSC know ASAP.
   -

   Support for TCLIBCAPPEND was dropped.
   -

   We updated to only support the =E2=80=9Cstyhead=E2=80=9D layer series na=
mespace.
   -

   The new autobuilder infrastructure is showing a number of challenges
   including some new bugs, new intermittent issues, challenges with new
   distros and a new reproducibility issue but we=E2=80=99re working throug=
h them
   -

   There is discussion around configuration file markup/syntax related to
   fragment management on the architecture list, targeting 5.2.
   -

   Upcoming Event:  For those attending OSS EU in Vienna, Yocto Project
   Developer Day Sept. 19th 9am-5pm.

Register here:
https://events.linuxfoundation.org/open-source-summit-europe/features/co-lo=
cated-events/#yocto-project-developer-day
<https://czw--04.na1.hs-sales-engage.com/Ctc/RI+23284/cZw--04/JjT4YGXpW50kH=
_H6lZ3mYW2zGP2g4RYwHlW4jl_sH82F1mBW75wf4S5fQSGwW3q-h137pS86vVlHM703t9PdRW6V=
fJXS6kJbk-VWLZV53p2BqSW3dkpTN4Wc9tYN8d4d7CsmmQxW3FmT508QTKq_W3V5Mp_7kTnQNW7=
xM1Xl68DVpQW6pxfq05vlySZW3YVFPs32PrWcW20rDWR8-Y1-cW6wQgz783gRDGW3DBJfc3v8KB=
0W1tJ4qd7-_qs-VBQjVz98qlrBW273HcF8lvxs-W6br4Hp8pCKLpW8vscLk13k-26W3BStmd2-h=
wGKN73nChGP4XnJN7NJkHZfJ3KBW2rWQPL67szjbW2LnfX34HKpDXW6PFDTz1wv6WFTfqbK6x5N=
4yW4PCDQB1ZGz88VqC4Lq632tJGW1MSmXh35d3k2f5D-ZFs04>

Ways to contribute:

   -

   As people are likely aware, the project has a number of components which
   are either unmaintained, or have people with little to no time trying to
   keep them alive. These components include: devtool, toaster, wic, oeqa,
   autobuilder, CROPs containers, pseudo and more. Many have open bugs. Hel=
p
   is welcome in trying to better look after these components!
   -

   There is an issue open upstream with the openssl project related to
   making path relocation of openssl easier (as used in our buildtools tarb=
all
   and SDK). We=E2=80=99d love assistance in moving this forward and gettin=
g some kind
   of upstream feature merged to make this easier:
   https://github.com/openssl/openssl/pull/19260
   -

   There are bugs identified as possible for newcomers to the project:
   https://wiki.yoctoproject.org/wiki/Newcomers
   -

   There are bugs that are currently unassigned for YP 5.1. See:
   https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium+_5.1_Unassigned_Enh=
ancements/Bugs
   -

   We=E2=80=99d welcome new maintainers for recipes in OE-Core. Please see =
the list
   at:
   http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/include/=
maintainers.inc
   and discuss with the existing maintainer, or ask on the OE-Core mailing
   list. We will likely move a chunk of these to =E2=80=9CUnassigned=E2=80=
=9D soon to help
   facilitate this.
   -

   Help is very much welcome in trying to resolve our autobuilder
   intermittent issues. You can see the list of failures we=E2=80=99re cont=
inuing to
   see by searching for the =E2=80=9CAB-INT=E2=80=9D tag in bugzilla:
   https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DAB-INT.
   -

   Help us resolve CVE issues: CVE metrics
   <https://autobuilder.yocto.io/pub/non-release/patchmetrics/>
   -

   We have a growing number of bugs in bugzilla, any help with them is
   appreciated.
   -

   Regarding bugs, even if you can=E2=80=99t fix a bug, submitting a failin=
g test
   case that can reproduce the issue significantly improves the chances it
   might get fixed.
   -

   Further help on optimizing build disk usage would be most welcome.


Tracking Metrics:

   -

   WDD 2734 (last week 2764) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   OE-Core/Poky Patch Metrics
   -

      Total patches found: 1067 (last week 1057)
      -

      Patches in the Pending State: 176 (16%) [last week 176 (17%)]
      -

      https://autobuilder.yocto.io/pub/non-release/patc
      <https://autobuilder.yocto.io/pub/non-release/patchmetrics/>%hmetrics=
/
      <https://autobuilder.yocto.io/pub/non-release/patchmetrics/>


YP 5.1 Milestone Dates:

   -

   YP 5.1 M3 is ready for release
   -

   YP 5.1 M4 Build date  2024-09-30
   -

   YP 5.1 M4 Release date 2024-10-25


Upcoming dot releases:

   -

   YP 4.0.21 is in QA
   -

   YP 5.0.4 Build Date 2024-09-23
   -

   YP 5.0.4 Release Date 2024-10-04
   -

   YP 4.0.22 Build Date 2024-10-14
   -

   YP 4.0.22 Release Date 2024-10-25
   -

   YP 5.0.5 Build Date 2024-11-11
   -

   YP 5.0.5 Release Date 2024-11-22
   -

   YP 4.0.23 Build Date 2024-11-18
   -

   YP 4.0.23 Release Date 2024-11-29


The Yocto Project=E2=80=99s technical governance is through its Technical S=
teering
Committee, more information is available at:

https://wiki.yoctoproject.org/wiki/TSC

The Status reports are now stored on the wiki at:
https://wiki.yoctoproject.org/wiki/Weekly_Status

[If anyone has suggestions for other information you=E2=80=99d like to see =
on this
weekly status update, let us know!]

Thanks,



*Stephen K. Jolley*

*Yocto Project Program Manager*

(    *Cell*:                (208) 244-4460

* *Email*:                 *s
<stephen.k.jolley@intel.com>jolley.yp.pm@gmail.com <jolley.yp.pm@gmail.com>=
*

--000000000000a66e5c0621c5115f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-7824540e-7fff-4ec5-d6=
8a-e2d001c62f2f"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;font-variant-alternates:normal;vertical-alig=
n:baseline">Current Dev Position: YP 5.1 Feature Freeze and Bug Fixing</spa=
n></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline"=
>Next Deadline: YP 5.1 M4 Build 30 Sept. 2024</span></p><br><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;vertical-align:baseline">Next Team Meetings:<=
/span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" st=
yle=3D"list-style-type:disc;font-size:9.5pt;font-family:Arial,sans-serif;co=
lor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:b=
aseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11p=
t;background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;font-variant-alternates:normal;vertical-align:baseline">Bug =
Triage meeting Thursday Sept. 12th at 7:30 am PST (</span><a href=3D"https:=
//zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09" style=3D"text=
-decoration-line:none"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;font-vari=
ant-alternates:normal;text-decoration-line:underline;vertical-align:baselin=
e">https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</span=
></a><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:nor=
mal;vertical-align:baseline">)</span></p></li><li dir=3D"ltr" style=3D"list=
-style-type:disc;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0=
,0);background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;vertical-align:baseline;whi=
te-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;font-variant-alternates:normal;vertical-align:baseline">Weekly Project =
Engineering Sync Tuesday Sept. 10th at 8 am PST (</span><a href=3D"https://=
zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09" style=3D"text-d=
ecoration-line:none"><span style=3D"font-size:11pt;background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varian=
t-alternates:normal;text-decoration-line:underline;vertical-align:baseline"=
>https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</span><=
/a><a href=3D"https://zoom.us/j/990892712" style=3D"text-decoration-line:no=
ne"><span style=3D"font-size:11pt;background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norm=
al;text-decoration-line:underline;vertical-align:baseline">)</span></a></p>=
</li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:9.5pt;font-fam=
ily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:=
normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span=
 style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;font-variant-alternates:normal;vertic=
al-align:baseline">Twitch -=C2=A0 See </span><a href=3D"https://www.twitch.=
tv/theyoctojester" style=3D"text-decoration-line:none"><span style=3D"font-=
size:11pt;background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;font-variant-alternates:normal;text-decoration-line:=
underline;vertical-align:baseline">https://www.twitch.tv/theyoctojester</sp=
an></a><span style=3D"font-size:11pt;background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:n=
ormal;vertical-align:baseline">=C2=A0</span></p></li></ul><br><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-variant-alternates:normal;vertical-align:baseline">Key Status/Updat=
es:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr=
" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;font-variant-alternates:normal;vertical-alig=
n:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:=
11pt;background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-variant-alternates:normal;vertical-align:baseline">Y=
P 5.1 M3 is due to be released</span></p></li><li dir=3D"ltr" style=3D"list=
-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;font-variant-alternates:normal;vertical-align:baseline;whit=
e-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-variant-alternates:normal;vertical-align:baseline">YP 4.0.21 is in =
QA</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:1=
1pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant=
-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"present=
ation"><span style=3D"font-size:11pt;background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:n=
ormal;vertical-align:baseline">We are now at feature freeze and working on =
bug fixing for the final 5.1 release builds</span></p></li><li dir=3D"ltr" =
style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;c=
olor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:=
baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11=
pt;background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;font-variant-alternates:normal;vertical-align:baseline">Due=
 to timing of autobuilder infrastructure changes, vacations, no release blo=
cking bugs and also seemingly limited availability of people to help with g=
eneral bug fixing, we are considering an early M4 build, maybe even this we=
ek. If that would cause problems for anyone, please let Richard/the TSC kno=
w ASAP.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-s=
ize:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-va=
riant-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pr=
esentation"><span style=3D"font-size:11pt;background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alterna=
tes:normal;vertical-align:baseline">Support for TCLIBCAPPEND was dropped.</=
span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;=
font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alt=
ernates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentatio=
n"><span style=3D"font-size:11pt;background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norma=
l;vertical-align:baseline">We updated to only support the =E2=80=9Cstyhead=
=E2=80=9D layer series namespace.</span></p></li><li dir=3D"ltr" style=3D"l=
ist-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0=
,0,0);background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline;w=
hite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;font-variant-alternates:normal;vertical-align:baseline">The new autob=
uilder infrastructure is showing a number of challenges including some new =
bugs, new intermittent issues, challenges with new distros and a new reprod=
ucibility issue but we=E2=80=99re working through them</span></p></li><li d=
ir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;font-variant-alternates:normal;vert=
ical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"f=
ont-size:11pt;background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:ba=
seline">There is discussion around configuration file markup/syntax related=
 to fragment management on the architecture list, targeting 5.2.</span></p>=
</li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fami=
ly:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:n=
ormal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span =
style=3D"font-size:11pt;background-color:transparent;font-weight:700;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;font-variant-alternate=
s:normal;vertical-align:baseline">Upcoming Event: </span><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line">=C2=A0For those attending OSS EU in Vienna, Yocto Project Developer D=
ay Sept. 19th 9am-5pm.=C2=A0=C2=A0</span></p></li></ul><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-left:36pt;margin-top:0pt;margin-bottom:0pt"><sp=
an style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);ba=
ckground-color:transparent;font-weight:700;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:ba=
seline">Register here</span><span style=3D"font-size:11pt;font-family:Arial=
,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;ve=
rtical-align:baseline">:</span><a href=3D"https://czw--04.na1.hs-sales-enga=
ge.com/Ctc/RI+23284/cZw--04/JjT4YGXpW50kH_H6lZ3mYW2zGP2g4RYwHlW4jl_sH82F1mB=
W75wf4S5fQSGwW3q-h137pS86vVlHM703t9PdRW6VfJXS6kJbk-VWLZV53p2BqSW3dkpTN4Wc9t=
YN8d4d7CsmmQxW3FmT508QTKq_W3V5Mp_7kTnQNW7xM1Xl68DVpQW6pxfq05vlySZW3YVFPs32P=
rWcW20rDWR8-Y1-cW6wQgz783gRDGW3DBJfc3v8KB0W1tJ4qd7-_qs-VBQjVz98qlrBW273HcF8=
lvxs-W6br4Hp8pCKLpW8vscLk13k-26W3BStmd2-hwGKN73nChGP4XnJN7NJkHZfJ3KBW2rWQPL=
67szjbW2LnfX34HKpDXW6PFDTz1wv6WFTfqbK6x5N4yW4PCDQB1ZGz88VqC4Lq632tJGW1MSmXh=
35d3k2f5D-ZFs04" style=3D"text-decoration-line:none"><span style=3D"font-si=
ze:11pt;font-family:Arial,sans-serif;background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:n=
ormal;text-decoration-line:underline;vertical-align:baseline"> https://even=
ts.linuxfoundation.org/open-source-summit-europe/features/co-located-events=
/#yocto-project-developer-day</span></a></p><br><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11=
pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-=
alternates:normal;vertical-align:baseline">Ways to contribute:</span></p><u=
l style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-=
style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0=
);background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;font-variant-alternates:normal;vertical-align:baseline;white=
-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;font-variant-alternates:normal;vertical-align:baseline">As people are lik=
ely aware, the project has a number of components which are either unmainta=
ined, or have people with little to no time trying to keep them alive. Thes=
e components include: devtool, toaster, wic, oeqa, autobuilder, CROPs conta=
iners, pseudo and more. Many have open bugs. Help is welcome in trying to b=
etter look after these components!</span></p></li><li dir=3D"ltr" style=3D"=
list-style-type:disc;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb=
(0,0,0);background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;font-variant-alternates:normal;vertical-align:baseline">There is an=
 issue open upstream with the openssl project related to making path reloca=
tion of openssl easier (as used in our buildtools tarball and SDK). We=E2=
=80=99d love assistance in moving this forward and getting some kind of ups=
tream feature merged to make this easier: </span><a href=3D"https://github.=
com/openssl/openssl/pull/19260" style=3D"text-decoration-line:none"><span s=
tyle=3D"font-size:11pt;background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;font-variant-alternates:normal;text-dec=
oration-line:underline;vertical-align:baseline">https://github.com/openssl/=
openssl/pull/19260</span></a></p></li><li dir=3D"ltr" style=3D"list-style-t=
ype:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;font-variant-alternates:normal;vertical-align:baseline;white-space:=
pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-=
variant-alternates:normal;vertical-align:baseline">There are bugs identifie=
d as possible for newcomers to the project: </span><a href=3D"https://wiki.=
yoctoproject.org/wiki/Newcomers" style=3D"text-decoration-line:none"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-variant-alternates:normal;text-de=
coration-line:underline;vertical-align:baseline">https://wiki.yoctoproject.=
org/wiki/Newcomers</span></a></p></li><li dir=3D"ltr" style=3D"list-style-t=
ype:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;font-variant-alternates:normal;vertical-align:baseline;white-space:=
pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-=
variant-alternates:normal;vertical-align:baseline">There are bugs that are =
currently unassigned for YP 5.1. See: </span><a href=3D"https://wiki.yoctop=
roject.org/wiki/Bug_Triage#Medium+_5.1_Unassigned_Enhancements/Bugs" style=
=3D"text-decoration-line:none"><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;text-decoration-line:underline;vertical-align=
:baseline">https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium+_5.1_Unassi=
gned_Enhancements/Bugs</span></a></p></li><li dir=3D"ltr" style=3D"list-sty=
le-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;font-variant-alternates:normal;vertical-align:baseline;white-sp=
ace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;vertical-align:baseline">We=E2=80=99d welcome=
 new maintainers for recipes in OE-Core. Please see the list at: </span><a =
href=3D"http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/inc=
lude/maintainers.inc" style=3D"text-decoration-line:none"><span style=3D"fo=
nt-size:11pt;background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;text-decoration-li=
ne:underline;vertical-align:baseline">http://git.yoctoproject.org/cgit.cgi/=
poky/tree/meta/conf/distro/include/maintainers.inc</span></a><span style=3D=
"font-size:11pt;background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:=
baseline"> and discuss with the existing maintainer, or ask on the OE-Core =
mailing list. We will likely move a chunk of these to =E2=80=9CUnassigned=
=E2=80=9D soon to help facilitate this.</span></p></li><li dir=3D"ltr" styl=
e=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;font-variant-alternates:normal;vertical-align:baseline">Help is=
 very much welcome in trying to resolve our autobuilder intermittent issues=
. You can see the list of failures we=E2=80=99re continuing to see by searc=
hing for the =E2=80=9CAB-INT=E2=80=9D tag in bugzilla: </span><a href=3D"ht=
tps://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DAB-INT" style=3D"=
text-decoration-line:none"><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-=
variant-alternates:normal;text-decoration-line:underline;vertical-align:bas=
eline">https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DAB-INT</=
span></a><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates=
:normal;vertical-align:baseline">.</span></p></li><li dir=3D"ltr" style=3D"=
list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline;=
white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-variant-alternates:normal;vertical-align:baseline">Help us reso=
lve CVE issues: </span><a href=3D"https://autobuilder.yocto.io/pub/non-rele=
ase/patchmetrics/" style=3D"text-decoration-line:none"><span style=3D"font-=
size:11pt;background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;font-variant-alternates:normal;text-decoration-line:=
underline;vertical-align:baseline">CVE metrics</span></a><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line">=C2=A0</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;f=
ont-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fo=
nt-variant-alternates:normal;vertical-align:baseline;white-space:pre"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">We have a growing number of bugs =
in bugzilla, any help with them is appreciated.</span></p></li><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-al=
ign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-siz=
e:11pt;background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline"=
>Regarding bugs, even if you can=E2=80=99t fix a bug, submitting a failing =
test case that can reproduce the issue significantly improves the chances i=
t might get fixed.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:=
disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;font-variant-alternates:normal;vertical-align:baseline;white-space:pre"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
 role=3D"presentation"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;font-vari=
ant-alternates:normal;vertical-align:baseline">Further help on optimizing b=
uild disk usage would be most welcome.</span></p></li></ul><br><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-variant-alternates:normal;vertical-align:baseline">Tracking Metrics=
:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" =
style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;c=
olor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:=
baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11=
pt;background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;font-variant-alternates:normal;vertical-align:baseline">WDD=
 2734 (last week 2764) </span><span style=3D"font-size:11pt;font-family:Con=
solas,sans-serif;background-color:transparent;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-variant-alternates:normal;vertical-align=
:baseline">(</span><a href=3D"https://wiki.yoctoproject.org/charts/combo.ht=
ml" style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;font-variant-alternates:normal;text-decoration-line:underline;verti=
cal-align:baseline">https://wiki.yoctoproject.org/charts/combo.html</span><=
/a><span style=3D"font-size:11pt;font-family:Consolas,sans-serif;background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-variant-alternates:normal;vertical-align:baseline">)</span></p></li=
><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:C=
onsolas,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:no=
rmal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span s=
tyle=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varia=
nt-alternates:normal;vertical-align:baseline">OE-Core/Poky Patch Metrics</s=
pan></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr"=
 style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-seri=
f;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size=
:11pt;background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline">=
Total patches found: 1067 (last week 1057)</span></p></li><li dir=3D"ltr" s=
tyle=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;=
color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-variant-alternates:normal;vertical-align=
:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;vertical-align:baseline">Pa=
tches in the Pending State: 176 (16%) [last week 176 (17%)]</span></p></li>=
<li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:=
Consolas,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:n=
ormal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><a hre=
f=3D"https://autobuilder.yocto.io/pub/non-release/patchmetrics/" style=3D"t=
ext-decoration-line:none"><span style=3D"font-size:11pt;font-family:Arial,s=
ans-serif;background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;font-variant-alternates:normal;text-decoration-line:=
underline;vertical-align:baseline">https://autobuilder.yocto.io/pub/non-rel=
ease/patc</span></a><span style=3D"font-size:11pt;font-family:Arial,sans-se=
rif;background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;vertical-align:baseline">%<=
/span><a href=3D"https://autobuilder.yocto.io/pub/non-release/patchmetrics/=
" style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;font-fa=
mily:Arial,sans-serif;background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;font-variant-alternates:normal;text-deco=
ration-line:underline;vertical-align:baseline">hmetrics/</span></a></p></li=
></ul></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;c=
olor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:=
baseline">YP 5.1 Milestone Dates:</span></p><ul style=3D"margin-top:0px;mar=
gin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11p=
t;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentat=
ion"><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:nor=
mal;vertical-align:baseline">YP 5.1 M3 is ready for release</span></p></li>=
<li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ar=
ial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline">YP 5.1 M4 Build date=C2=A0 2024-09-30</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;font-variant-alternates:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line">YP 5.1 M4 Release date 2024-10-25</span></p></li></ul><br><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-variant-alternates:normal;vertical-align:baseline">Upcoming dot rel=
eases:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"=
ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-se=
rif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-a=
lign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-si=
ze:11pt;background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline=
">YP 4.0.21 is in QA</span></p></li><li dir=3D"ltr" style=3D"list-style-typ=
e:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;font-variant-alternates:normal;vertical-align:baseline;white-space:pr=
e"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-va=
riant-alternates:normal;vertical-align:baseline">YP 5.0.4 Build Date 2024-0=
9-23</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size=
:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varia=
nt-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"prese=
ntation"><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates=
:normal;vertical-align:baseline">YP 5.0.4 Release Date 2024-10-04</span></p=
></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fam=
ily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:=
normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span=
 style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;font-variant-alternates:normal;vertic=
al-align:baseline">YP 4.0.22 Build Date 2024-10-14</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;font-variant-alternates:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line">YP 4.0.22 Release Date 2024-10-25</span></p></li><li dir=3D"ltr" styl=
e=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;font-variant-alternates:normal;vertical-align:baseline">YP 5.0.=
5 Build Date 2024-11-11</span></p></li><li dir=3D"ltr" style=3D"list-style-=
type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;font-variant-alternates:normal;vertical-align:baseline;white-space=
:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;font=
-variant-alternates:normal;vertical-align:baseline">YP 5.0.5 Release Date 2=
024-11-22</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font=
-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-=
variant-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">YP 4.0.23 Build Date 2024-11-18</=
span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;=
font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alt=
ernates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentatio=
n"><span style=3D"font-size:11pt;background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norma=
l;vertical-align:baseline">YP 4.0.23 Release Date 2024-11-29</span></p></li=
></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;font-variant-alternates:normal;vertical-align:basel=
ine">The Yocto Project=E2=80=99s technical governance is through its Techni=
cal Steering Committee, more information is available at:</span></p><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><a hre=
f=3D"https://wiki.yoctoproject.org/wiki/TSC" style=3D"text-decoration-line:=
none"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-variant-alternates:normal;text-decoration-line:underline;vertical-a=
lign:baseline">https://wiki.yoctoproject.org/wiki/TSC</span></a></p><br><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><sp=
an style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;font-variant-alternates:normal;vertical-align:baseline">The Stat=
us reports are now stored on the wiki at: </span><a href=3D"https://wiki.yo=
ctoproject.org/wiki/Weekly_Status" style=3D"text-decoration-line:none"><spa=
n style=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-va=
riant-alternates:normal;text-decoration-line:underline;vertical-align:basel=
ine">https://wiki.yoctoproject.org/wiki/Weekly_Status</span></a></p><br><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><sp=
an style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;font-variant-alternates:normal;vertical-align:baseline">[If anyo=
ne has suggestions for other information you=E2=80=99d like to see on this =
weekly status update, let us know!]</span></p></span><br class=3D"gmail-App=
le-interchange-newline"><div dir=3D"ltr" class=3D"gmail_signature" data-sma=
rtmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><p class=3D"Ms=
oNormal" style=3D"background-image:initial;background-position:initial;back=
ground-repeat:initial"><span style=3D"font-size:12pt;font-family:Arial,sans=
-serif">Thanks,<span></span></span></p>

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

--000000000000a66e5c0621c5115f--

