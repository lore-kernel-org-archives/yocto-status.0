Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.14057.1712069580615877363
 for <yocto-status@lists.yoctoproject.org>;
 Tue, 02 Apr 2024 07:53:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712069579; x=1712674379; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sgS6iXwERkTPkiZB2Hx0yxukMQFoBCjAlBDttb4emmk=;
        b=BZSE/5NlnseJUxmaWcsUQKgFDl7Lq86H6yN/oPgdtBr8Lz6XOGlGvyQyaBLlmsuNWP
         WdohEFlWzXANrAjDzq/VhT8mx55Go2iC8plUR3aWiZ9iTxEEw0aE3IhcFEPTyy5kviuh
         F6wM9+nEX5HQLoqieggtGUQneIW0YRCLO+3Fcu6jDvpu6L3NQ0+BmYWTh0QrGHwxyIki
         KUdtApmjh/a+cmvtfWpT9GlV8rY1D1fQaquIFaQaS9v9tk6F8CCwMPzuijJwY/Q25JSp
         1gKPqRr5H7y6/70d7U7EztyqfGb7Z0SQ/A8ezZOTXv/7G/a8kBd7V+LZP9VvUwLYKhsG
         QpgQ==
MIME-Version: 1.0
From: "Stephen Jolley" <sjolley.yp.pm@gmail.com>
Date: Tue, 2 Apr 2024 07:52:47 -0700
Message-ID: <CAK5yBb9oiGwEF2VprrrtEjHFL3Ja9qQU30wbyBEgL4BzY54CKQ@mail.gmail.com>
Subject: Yocto Project Status 2 April 2024 (WW14)
Content-Type: multipart/alternative; boundary="00000000000009f46506151e43c8"
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, ",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, yocto-status@lists.yoctoproject.org
List-ID: <yocto-status.lists.yoctoproject.org>

--00000000000009f46506151e43c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 5.0 M4 - Final Release

Next Deadline: 1st April 2024 YP 5.0 M4 build

Next Team Meetings:

   -

   Bug Triage meeting Thursday April 4th at 7:30 am PST (
   https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
   -

   Weekly Project Engineering Sync Tuesday April 2nd at 8 am PST (
   https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
   <https://zoom.us/j/990892712>
   -

   Twitch -  See https://www.twitch.tv/theyoctojester


Key Status/Updates:

   -

   YP 4.0.17 has been released.
   -

   YP 4.3.4 is in QA and is the final planned nanbield release.
   -

   YP 5.0 rc1 is now due to build when ready.
   -

   Steve is taking patches for Dunfell until around April 8 in preparation
   for an April 15 build. This will be the last release of dunfell.
   -

   5.0 build status:
   -

      The opkg lock issue has been worked around for now in the
      run-postinsts script
      -

      An intermittent oe-selftest failure (sstatetests hang) was tracked
      down to a race in tinfoil event handling.
      -

      The public hash equivalence server changes aren=E2=80=99t ready yet
      unfortunately
      -

      There are issues with the size of the buildhistory repository which
      is being split up, this needs to happen before we can build the relea=
se.
      -

      A key worry now is the documentation for the release, especially
      given it is an LTS. There are emails on the docs list about this, hel=
p is
      much appreciated. This will now be the main delay on the release
timeframe.
      -

   A new yocto-status <https://lists.yoctoproject.org/g/yocto-status/topics=
>
   mailing list has been created where we plan to send just the project wee=
kly
   status reports and any other suitable updates on the project. This shoul=
d
   help those who found the traffic of the other mailing lists too much.
   -

   A yocto-patches <https://lists.yoctoproject.org/g/yocto-patches/topics>
   mailing list has been setup and patches that used to go to the yocto@
   list will be migrating over to this new list, making yocto@ a bit more
   friendly for questions and discussions.
   -

   Some other obsolete mailing lists were removed or made read-only to try
   and make it easier for people to find the right place to see/send things=
.
   -

   Debian 12 and Fedora 40 containers have been added to crops (Thanks Rob
   Wolley)
   -

   All the crops yocto-base containers now include python3-virtualenv
   -

   The =E2=80=9CBinary Distro=E2=80=9D work is now well underway and there =
are PR Server
   passthrough patches ready for review. The wiki page
   <https://wiki.yoctoproject.org/wiki/Binary_Distro_Prototype#Policies_and=
_Processes>
   has had a number of policy/process proposals documented, at least as a
   first pass. Help is welcome to help improve these, or highlight where
   further documentation is needed.
   -

   One year after the original linux.com article, an update was published:
   https://www.yoctoproject.org/blog/2024/03/28/maintainer-confidential-cha=
llenges-and-opportunities-one-year-on/
   -

   There was a significant security issue with xz release tarballs. We
   never merged the affected version and it was never in any of our main
   branches but we did test it on the autobuilder and saw build failures. W=
e
   continue to watch for information on any potential implications of that.=
 We
   have removed the compromised tarballs from our mirrors.
   -

   We continue to watch the NIST NVD (CVE database) situation, the recent
   update didn=E2=80=99t clarify much. Unfortunately there doesn=E2=80=99t =
appear to be a
   clear path forward as yet.


Ways to contribute:

   -

   As people are likely aware, the project has a number of components which
   are either unmaintained, or have people with little to no time trying to
   keep them alive. These components include: devtool, toaster, wic, oeqa,
   autobuilder, CROPs containers, pseudo and more. Many have open bugs. Hel=
p
   is welcome in trying to better look after these components!
   -

   There are bugs identified as possible for newcomers to the project:
   https://wiki.yoctoproject.org/wiki/Newcomers
   -

   There are bugs that are currently unassigned for YP 5.0. See:
   https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium+_5.0_Unassigned_Enh=
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


YP 5.0 Milestone Dates:

   -

   YP 5.0 M4 build date  2024/04/01
   -

   YP 5.0 M4 Release date 2024/04/30


Upcoming dot releases:

   -

   YP 4.0.17 is released.
   -

   YP 4.3.4 is in QA.
   -

   YP 3.1.33 build date 2024/04/15
   -

   YP 3.1.33 Release date 2024/04/26
   -

   YP 4.0.18 build date 2024/04/22
   -

   YP 4.0.18 Release date 2024/05/03
   -

   YP 4.0.19 build date 2024/06/03
   -

   YP 4.0.19 Release date 2024/06/14


Tracking Metrics:

   -

   WDD 2681 (last week 2703) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   OE-Core/Poky Patch Metrics
   -

      Total patches found: 1173 (last week 1156)
      -

      Patches in the Pending State: 249 (21%) [last week 249 (22%)]
      -

   https://autobuilder.yocto.io/pub/non-release/patchmetrics/


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

--00000000000009f46506151e43c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-3e70903e-7fff-daf0-7b=
f7-f96489fd710d"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;font-variant-alternates:normal;vertical-alig=
n:baseline">Current Dev Position: YP 5.0 M4 - Final Release</span></p><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span=
 style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;font-variant-alternates:normal;vertical-align:baseline">Next Deadl=
ine: 1st April 2024 YP 5.0 M4 build</span></p><br><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:=
11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varian=
t-alternates:normal;vertical-align:baseline">Next Team Meetings:</span></p>=
<ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"lis=
t-style-type:disc;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,=
0,0);background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-variant-alternates:normal;vertical-align:baseline;wh=
ite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;font-variant-alternates:normal;vertical-align:baseline">Bug Triage mee=
ting Thursday April 4th at 7:30 am PST (</span><a href=3D"https://zoom.us/j=
/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09" style=3D"text-decoration=
-line:none"><span style=3D"font-size:11pt;background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alterna=
tes:normal;text-decoration-line:underline;vertical-align:baseline">https://=
zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</span></a><span =
style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-variant-alternates:normal;vertica=
l-align:baseline">)</span></p></li><li dir=3D"ltr" style=3D"list-style-type=
:disc;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;font-variant-alternates:normal;vertical-align:baseline;white-space:pr=
e"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-va=
riant-alternates:normal;vertical-align:baseline">Weekly Project Engineering=
 Sync Tuesday April 2nd at 8 am PST (</span><a href=3D"https://zoom.us/j/99=
0892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09" style=3D"text-decoration-li=
ne:none"><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates=
:normal;text-decoration-line:underline;vertical-align:baseline">https://zoo=
m.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</span></a><a href=
=3D"https://zoom.us/j/990892712" style=3D"text-decoration-line:none"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-variant-alternates:normal;text-de=
coration-line:underline;vertical-align:baseline">)</span></a></p></li><li d=
ir=3D"ltr" style=3D"list-style-type:disc;font-size:9.5pt;font-family:Arial,=
sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;font-variant-alternates:normal;ver=
tical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"=
font-size:11pt;background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:b=
aseline">Twitch -=C2=A0 See </span><a href=3D"https://www.twitch.tv/theyoct=
ojester" style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;font-variant-alternates:normal;text-decoration-line:underline;=
vertical-align:baseline">https://www.twitch.tv/theyoctojester</span></a><sp=
an style=3D"font-size:11pt;background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;font-variant-alternates:normal;vert=
ical-align:baseline">=C2=A0</span></p></li></ul><br><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-siz=
e:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;font-vari=
ant-alternates:normal;vertical-align:baseline">Key Status/Updates:</span></=
p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"l=
ist-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0=
,0,0);background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline;w=
hite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;font-variant-alternates:normal;vertical-align:baseline">YP 4.0.17 has=
 been released.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:dis=
c;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;font-variant-alternates:normal;vertical-align:baseline;white-space:pre"><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" ro=
le=3D"presentation"><span style=3D"font-size:11pt;background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant=
-alternates:normal;vertical-align:baseline">YP 4.3.4 is in QA and is the fi=
nal planned nanbield release.</span></p></li><li dir=3D"ltr" style=3D"list-=
style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0=
);background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;font-variant-alternates:normal;vertical-align:baseline;white=
-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;font-variant-alternates:normal;vertical-align:baseline">YP 5.0 rc1 is now=
 due to build when ready.</span></p></li><li dir=3D"ltr" style=3D"list-styl=
e-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;font-variant-alternates:normal;vertical-align:baseline;white-spa=
ce:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt" role=3D"presentation"><span style=3D"font-size:11pt;color:rgb(46,52=
,54);font-variant-numeric:normal;font-variant-east-asian:normal;font-varian=
t-alternates:normal;vertical-align:baseline">Steve is taking patches for Du=
nfell until around April 8 in preparation for an April 15 build. This will =
be the last release of dunfell.</span></p></li><li dir=3D"ltr" style=3D"lis=
t-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0=
,0);background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;vertical-align:baseline;whi=
te-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;font-variant-alternates:normal;vertical-align:baseline">5.0 build statu=
s:</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D=
"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans=
-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-variant-alternates:normal;vertica=
l-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font=
-size:11pt;background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;font-variant-alternates:normal;vertical-align:basel=
ine">The opkg lock issue has been worked around for now in the run-postinst=
s script</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;fon=
t-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;font=
-variant-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">An intermittent oe-selftest failu=
re (sstatetests hang) was tracked down to a race in tinfoil event handling.=
</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:1=
1pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant=
-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"present=
ation"><span style=3D"font-size:11pt;background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:n=
ormal;vertical-align:baseline">The public hash equivalence server changes a=
ren=E2=80=99t ready yet unfortunately</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;vertical-align:bas=
eline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;font-variant-alternates:normal;vertical-align:baseline">There =
are issues with the size of the buildhistory repository which is being spli=
t up, this needs to happen before we can build the release.</span></p></li>=
<li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:=
Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norm=
al;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span sty=
le=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-a=
lign:baseline">A key worry now is the documentation for the release, especi=
ally given it is an LTS. There are emails on the docs list about this, help=
 is much appreciated. This will now be the main delay on the release timefr=
ame.</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;font=
-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-=
variant-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">A new </span><a href=3D"https://l=
ists.yoctoproject.org/g/yocto-status/topics" style=3D"text-decoration-line:=
none"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:no=
rmal;text-decoration-line:underline;vertical-align:baseline">yocto-status</=
span></a><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates=
:normal;vertical-align:baseline"> mailing list has been created where we pl=
an to send just the project weekly status reports and any other suitable up=
dates on the project. This should help those who found the traffic of the o=
ther mailing lists too much.</span></p></li><li dir=3D"ltr" style=3D"list-s=
tyle-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0)=
;background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;font-variant-alternates:normal;vertical-align:baseline;white-=
space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;font-variant-alternates:normal;vertical-align:baseline">A </span><a href=
=3D"https://lists.yoctoproject.org/g/yocto-patches/topics" style=3D"text-de=
coration-line:none"><span style=3D"font-size:11pt;background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant=
-alternates:normal;text-decoration-line:underline;vertical-align:baseline">=
yocto-patches</span></a><span style=3D"font-size:11pt;background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-var=
iant-alternates:normal;vertical-align:baseline"> mailing list has been setu=
p and patches that used to go to the yocto@ list will be migrating over to =
this new list, making yocto@ a bit more friendly for questions and discussi=
ons.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size=
:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varia=
nt-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"prese=
ntation"><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates=
:normal;vertical-align:baseline">Some other obsolete mailing lists were rem=
oved or made read-only to try and make it easier for people to find the rig=
ht place to see/send things.</span></p></li><li dir=3D"ltr" style=3D"list-s=
tyle-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0)=
;background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;font-variant-alternates:normal;vertical-align:baseline;white-=
space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;font-variant-alternates:normal;vertical-align:baseline">Debian 12 and Fedo=
ra 40 containers have been added to crops (Thanks Rob Wolley)</span></p></l=
i><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:=
Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norm=
al;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span sty=
le=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-a=
lign:baseline">All the crops yocto-base containers now include python3-virt=
ualenv</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-si=
ze:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-var=
iant-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pre=
sentation"><span style=3D"font-size:11pt;background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;font-variant-alternat=
es:normal;vertical-align:baseline">The =E2=80=9CBinary Distro=E2=80=9D work=
 is now well underway and there are PR Server passthrough patches ready for=
 review. The </span><a href=3D"https://wiki.yoctoproject.org/wiki/Binary_Di=
stro_Prototype#Policies_and_Processes" style=3D"text-decoration-line:none">=
<span style=3D"font-size:11pt;background-color:transparent;font-variant-num=
eric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;t=
ext-decoration-line:underline;vertical-align:baseline">wiki page</span></a>=
<span style=3D"font-size:11pt;background-color:transparent;font-variant-num=
eric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;v=
ertical-align:baseline"> has had a number of policy/process proposals docum=
ented, at least as a first pass. Help is welcome to help improve these, or =
highlight where further documentation is needed.</span></p></li><li dir=3D"=
ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-se=
rif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-a=
lign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-si=
ze:11pt;background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline=
">One year after the original <a href=3D"http://linux.com">linux.com</a> ar=
ticle, an update was published: </span><a href=3D"https://www.yoctoproject.=
org/blog/2024/03/28/maintainer-confidential-challenges-and-opportunities-on=
e-year-on/" style=3D"text-decoration-line:none"><span style=3D"font-size:11=
pt;background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;font-variant-alternates:normal;text-decoration-line:underli=
ne;vertical-align:baseline">https://www.yoctoproject.org/blog/2024/03/28/ma=
intainer-confidential-challenges-and-opportunities-one-year-on/</span></a><=
/p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-f=
amily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;font-variant-alternate=
s:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><sp=
an style=3D"font-size:11pt;background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;font-variant-alternates:normal;vert=
ical-align:baseline">There was a significant security issue with xz release=
 tarballs. We never merged the affected version and it was never in any of =
our main branches but we did test it on the autobuilder and saw build failu=
res. We continue to watch for information on any potential implications of =
that. We have removed the compromised tarballs from our mirrors.</span></p>=
</li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fami=
ly:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:n=
ormal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-variant-alternates:normal;vertica=
l-align:baseline">We continue to watch the NIST NVD (CVE database) situatio=
n, the recent update didn=E2=80=99t clarify much. Unfortunately there doesn=
=E2=80=99t appear to be a clear path forward as yet.</span></p></li></ul><b=
r><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;font-variant-alternates:normal;vertical-align:baseline">Way=
s to contribute:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><=
li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ari=
al,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;=
vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline">As people are likely aware, the project has a number of compon=
ents which are either unmaintained, or have people with little to no time t=
rying to keep them alive. These components include: devtool, toaster, wic, =
oeqa, autobuilder, CROPs containers, pseudo and more. Many have open bugs. =
Help is welcome in trying to better look after these components!</span></p>=
</li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fami=
ly:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:n=
ormal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-variant-alternates:normal;vertica=
l-align:baseline">There are bugs identified as possible for newcomers to th=
e project: </span><a href=3D"https://wiki.yoctoproject.org/wiki/Newcomers" =
style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;font-variant-alternates:normal;text-decoration-line:underline;vertical-=
align:baseline">https://wiki.yoctoproject.org/wiki/Newcomers</span></a></p>=
</li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fami=
ly:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:n=
ormal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-variant-alternates:normal;vertica=
l-align:baseline">There are bugs that are currently unassigned for YP 5.0. =
See: </span><a href=3D"https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium=
+_5.0_Unassigned_Enhancements/Bugs" style=3D"text-decoration-line:none"><sp=
an style=3D"font-size:11pt;background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;font-variant-alternates:normal;text=
-decoration-line:underline;vertical-align:baseline">https://wiki.yoctoproje=
ct.org/wiki/Bug_Triage#Medium+_5.0_Unassigned_Enhancements/Bugs</span></a><=
/p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-f=
amily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;font-variant-alternate=
s:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><sp=
an style=3D"font-size:11pt;background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;font-variant-alternates:normal;vert=
ical-align:baseline">We=E2=80=99d welcome new maintainers for recipes in OE=
-Core. Please see the list at: </span><a href=3D"http://git.yoctoproject.or=
g/cgit.cgi/poky/tree/meta/conf/distro/include/maintainers.inc" style=3D"tex=
t-decoration-line:none"><span style=3D"font-size:11pt;background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-var=
iant-alternates:normal;text-decoration-line:underline;vertical-align:baseli=
ne">http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/include=
/maintainers.inc</span></a><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-=
variant-alternates:normal;vertical-align:baseline"> and discuss with the ex=
isting maintainer, or ask on the OE-Core mailing list. We will likely move =
a chunk of these to =E2=80=9CUnassigned=E2=80=9D soon to help facilitate th=
is.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:=
11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varian=
t-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presen=
tation"><span style=3D"font-size:11pt;background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:=
normal;vertical-align:baseline">Help is very much welcome in trying to reso=
lve our autobuilder intermittent issues. You can see the list of failures w=
e=E2=80=99re continuing to see by searching for the =E2=80=9CAB-INT=E2=80=
=9D tag in bugzilla: </span><a href=3D"https://bugzilla.yoctoproject.org/bu=
glist.cgi?quicksearch=3DAB-INT" style=3D"text-decoration-line:none"><span s=
tyle=3D"font-size:11pt;background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;font-variant-alternates:normal;text-dec=
oration-line:underline;vertical-align:baseline">https://bugzilla.yoctoproje=
ct.org/buglist.cgi?quicksearch=3DAB-INT</span></a><span style=3D"font-size:=
11pt;background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-variant-alternates:normal;vertical-align:baseline">.=
</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11p=
t;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentat=
ion"><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:nor=
mal;vertical-align:baseline">Help us resolve CVE issues: </span><a href=3D"=
https://autobuilder.yocto.io/pub/non-release/patchmetrics/" style=3D"text-d=
ecoration-line:none"><span style=3D"font-size:11pt;background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varian=
t-alternates:normal;text-decoration-line:underline;vertical-align:baseline"=
>CVE metrics</span></a><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;font-vari=
ant-alternates:normal;vertical-align:baseline">=C2=A0</span></p></li><li di=
r=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sa=
ns-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;font-variant-alternates:normal;verti=
cal-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fo=
nt-size:11pt;background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;vertical-align:bas=
eline">We have a growing number of bugs in bugzilla, any help with them is =
appreciated.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;f=
ont-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fo=
nt-variant-alternates:normal;vertical-align:baseline;white-space:pre"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">Regarding bugs, even if you can=
=E2=80=99t fix a bug, submitting a failing test case that can reproduce the=
 issue significantly improves the chances it might get fixed.</span></p></l=
i></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line">YP 5.0 Milestone Dates:</span></p><ul style=3D"margin-top:0px;margin-=
bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fo=
nt-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fo=
nt-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alter=
nates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;vertical-align:baseline">YP 5.0 M4 build date=C2=A0 2024/04/01</span></p><=
/li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-famil=
y:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:no=
rmal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span s=
tyle=3D"font-size:11pt;background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical=
-align:baseline">YP 5.0 M4 Release date 2024/04/30</span></p></li></ul><br>=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt">=
<span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0)=
;background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;font-variant-alternates:normal;vertical-align:baseline">Upcom=
ing dot releases:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px">=
<li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ar=
ial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline">YP 4.0.17 is released.</span></p></li><li dir=3D"ltr" style=3D=
"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb=
(0,0,0);background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;font-variant-alternates:normal;vertical-align:baseline">YP 4.3.4 is=
 in QA.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-s=
ize:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-va=
riant-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pr=
esentation"><span style=3D"font-size:11pt;background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alterna=
tes:normal;vertical-align:baseline">YP 3.1.33 build date 2024/04/15</span><=
/p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-f=
amily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;font-variant-alternate=
s:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><sp=
an style=3D"font-size:11pt;background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;font-variant-alternates:normal;vert=
ical-align:baseline">YP 3.1.33 Release date 2024/04/26</span></p></li><li d=
ir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;font-variant-alternates:normal;vert=
ical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"f=
ont-size:11pt;background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:ba=
seline">YP 4.0.18 build date 2024/04/22</span></p></li><li dir=3D"ltr" styl=
e=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;font-variant-alternates:normal;vertical-align:baseline">YP 4.0.=
18 Release date 2024/05/03</span></p></li><li dir=3D"ltr" style=3D"list-sty=
le-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;font-variant-alternates:normal;vertical-align:baseline;white-sp=
ace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;vertical-align:baseline">YP 4.0.19 build date=
 2024/06/03</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;fo=
nt-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fon=
t-variant-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">YP 4.0.19 Release date 2024/06/14=
</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sa=
ns-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;font-variant-alternates:normal;verti=
cal-align:baseline">Tracking Metrics:</span></p><ul style=3D"margin-top:0px=
;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size=
:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varia=
nt-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"prese=
ntation"><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates=
:normal;vertical-align:baseline">WDD 2681 (last week 2703) </span><span sty=
le=3D"font-size:11pt;font-family:Consolas,sans-serif;background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;font-vari=
ant-alternates:normal;vertical-align:baseline">(</span><a href=3D"https://w=
iki.yoctoproject.org/charts/combo.html" style=3D"text-decoration-line:none"=
><span style=3D"font-size:11pt;background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;=
text-decoration-line:underline;vertical-align:baseline">https://wiki.yoctop=
roject.org/charts/combo.html</span></a><span style=3D"font-size:11pt;font-f=
amily:Consolas,sans-serif;background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;font-variant-alternates:normal;verti=
cal-align:baseline">)</span></p></li><li dir=3D"ltr" style=3D"list-style-ty=
pe:disc;font-size:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;font-variant-alternates:normal;vertical-align:baseline;white-spac=
e:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-family:Aria=
l,sans-serif;background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;vertical-align:bas=
eline">OE-Core/Poky Patch Metrics</span></p></li><ul style=3D"margin-top:0p=
x;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-s=
ize:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-va=
riant-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pr=
esentation"><span style=3D"font-size:11pt;background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alterna=
tes:normal;vertical-align:baseline">Total patches found: 1173 (last week 11=
56)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-siz=
e:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-v=
ariant-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D=
"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"p=
resentation"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;font-variant-alternates:normal;vertical-align:baseline">Patches i=
n the Pending State: 249 (21%) [last week 249 (22%)]</span></p></li></ul><l=
i dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Cons=
olas,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norma=
l;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><a href=3D=
"https://autobuilder.yocto.io/pub/non-release/patchmetrics/" style=3D"text-=
decoration-line:none"><span style=3D"font-size:11pt;font-family:Arial,sans-=
serif;background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;font-variant-alternates:normal;text-decoration-line:unde=
rline;vertical-align:baseline">https://autobuilder.yocto.io/pub/non-release=
/patchmetrics/</span></a></p></li></ul><br><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;fo=
nt-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fo=
nt-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alter=
nates:normal;vertical-align:baseline">The Yocto Project=E2=80=99s technical=
 governance is through its Technical Steering Committee, more information i=
s available at:</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt"><a href=3D"https://wiki.yoctoproject.org/wiki/TSC=
" style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;font-fa=
mily:Arial,sans-serif;background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;font-variant-alternates:normal;text-deco=
ration-line:underline;vertical-align:baseline">https://wiki.yoctoproject.or=
g/wiki/TSC</span></a></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Aria=
l,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-num=
eric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;v=
ertical-align:baseline">The Status reports are now stored on the wiki at: <=
/span><a href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status" style=3D=
"text-decoration-line:none"><span style=3D"font-size:11pt;font-family:Arial=
,sans-serif;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;text-decoration-lin=
e:underline;vertical-align:baseline">https://wiki.yoctoproject.org/wiki/Wee=
kly_Status</span></a></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Aria=
l,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-num=
eric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;v=
ertical-align:baseline">[If anyone has suggestions for other information yo=
u=E2=80=99d like to see on this weekly status update, let us know!]</span><=
/p></span><br class=3D"gmail-Apple-interchange-newline"><div dir=3D"ltr" cl=
ass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"=
><div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"background-image:initial;=
background-position:initial;background-repeat:initial"><span style=3D"font-=
size:12pt;font-family:Arial,sans-serif">Thanks,<span></span></span></p>

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

--00000000000009f46506151e43c8--
