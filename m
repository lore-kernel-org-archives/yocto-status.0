Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFECC02198
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 07:29:26 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.111037.1738654156878908209
 for <yocto-status@lists.yoctoproject.org>;
 Mon, 03 Feb 2025 23:29:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b9ueJ3Af;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21636268e43so117389195ad.2
        for <yocto-status@lists.yoctoproject.org>; Mon, 03 Feb 2025 23:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738654156; x=1739258956; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1BFCXEtgIaSPe0FEOw4jzT1lUUWQb+LKuTkbMIOjbKg=;
        b=b9ueJ3Afh998zBz+c3yKZlpYU9wVpFti23/j8GyWTMOzQVIgURlnASa+YXehXZLGgf
         YubOJydL8MpsdajONxQdaUQEaUOY12hTe50MCVMxeAx71L4fS9i1xh3ZtSSNJpbjCyIw
         hXjx9WNfNseIbaOgOBxFcR6MDcyQDu1Gz5G5tNxmdTX2b2rJUkOxqtR5zrIkg//Sa0w+
         07w+1HRhnvsu3Dk9VZUNUd7JxDSM8dfWl3mkBiv13mwJhZDoKmZ7u8EBsb8u8pFv2cqr
         sntr9eKORECF0FnXwnI8EHfTrGZg45boLHvxpOD56GjKO4SgMn9aRBkVUHrShxSUP1Qs
         FbDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738654156; x=1739258956;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1BFCXEtgIaSPe0FEOw4jzT1lUUWQb+LKuTkbMIOjbKg=;
        b=HXTheO0o5wOTry1u/DfEyuyYy79IXlIlYHuu/1Q5d6noiL78ry9/ELoRHEXu8RPWv3
         I4OoskcY+vlU+z5WpNVFFnloYOkDa/r1V+It31ASRgHbxQXFaG+ftE6PYRpA9oornn0J
         XIiulafnfsXdjjSJrBW0jDCsdsXiU+1bvJrWaS5a7XXAx2Ysy2pEls6NIkfex7PJ6rHi
         6XBUulnVAn6BgySfD5zPnrT3DjZphwLu7cebTyxUGgzfXjfq/ZtXLjrAhZQN2UsWSUaO
         A5CeOHESOgEob58YNYohlb5Y1+q8fvAJ1I956kko7AyGcinAhnvEKTPAe2/DbFctc+yw
         zbWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWotLYxEV/LgYi5/BIiEbf2RpkljXXHi9zqXnHbzN0Vkg7HlMgRafZx/gglbL/3KKGDnL/D/ZIAYUVQpik=@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyFse3hgcC4Q1J4yVM5+1kJaOQW6zZZxq6LHQx/EaqF10iI2Abr
	9xYgvxPkCZIvX1JoYcWvkA5uOxRejjMX3A+1g8Z4kOxqtEHix28Zl7hreFrv4gC5F46Ex8KXLpQ
	+ne3gSNbytAc/sSVZKx3+XE+8OE0=
X-Gm-Gg: ASbGncszhmGJDgpkZ7/uhZbiN3LoJ2adXOUdyc8PGyTZKN3r6MGMHAr9g2evRR4tXmW
	XA+A/v276Zhw7TjQg82MtHLsED3u0dmf/rJssklvcRVQtMoupzPuBf7Xhdgk6+2UtnC0Gh5Bkmh
	B2pxJRc4zOzK7p3kOAkmPx7EuK7xVb4LA=
X-Google-Smtp-Source: AGHT+IEFgHOckwWFD8YlvSPMnFrdDJ2PjFHrXr9gJy76X3JwO7/88RzZ+5nVghJHunEssFuyVx3fvRNGn4ia4lrIibA=
X-Received: by 2002:a17:902:e951:b0:21f:78f:c178 with SMTP id
 d9443c01a7336-21f078fc4d3mr10199015ad.3.1738654155963; Mon, 03 Feb 2025
 23:29:15 -0800 (PST)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 4 Feb 2025 00:29:05 -0700
X-Gm-Features: AWEUYZkvPyCsZWYtnHXNKVLazVgYofHVDIRzcSOGQRkbUOI9WXk8vu0IbZQihgM
Message-ID: <CAK5yBb8MPFFddT2=XGit3SAhymz=3g-227SuxoYi_-c+ZdX-OA@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000005a84ba062d4bf78d"
List-Id: <yocto-status.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <yocto-status@lists.yoctoproject.org>; Tue, 04 Feb 2025 07:29:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/yocto-status/message/47

--0000000000005a84ba062d4bf78d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

All,

The triage team is starting to try and collect up and classify bugs which a
newcomer to the project would be able to work on in a way which means
people can find them. They're being listed on the triage page under the
appropriate heading:
https://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs Also please
review:
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded and
how to create a bugzilla account at:
https://bugzilla.yoctoproject.org/createaccount.cgi

The idea is these bugs should be straight forward for a person to help work
on who doesn't have deep experience with the project. If anyone can help,
please take ownership of the bug and send patches! If anyone needs
help/advice there are people on irc who can likely do so, or some of the
more experienced contributors will likely be happy to help too.

Also, the triage team meets weekly and does its best to handle the bugs
reported into the Bugzilla. The number of people attending that meeting has
fallen, as have the number of people available to help fix bugs. One of the
things we hear users report is they don't know how to help. We (the triage
team) are therefore going to start reporting out the currently 415
unassigned or newcomer bugs.

We're hoping people may be able to spare some time now and again to help
out with these. Bugs are split into two types, "true bugs" where things
don't work as they should and "enhancements" which are features we'd want
to add to the system. There are also roughly four different "priority"
classes right now, =E2=80=9C5.2=E2=80=9D, =E2=80=9C5.3", "5.99" and "Future=
", the more
pressing/urgent issues being in "5.2" and then =E2=80=9C5.3=E2=80=9D.

Please review this link and if a bug is something you would be able to help
with either take ownership of the bug, or send me (sjolley.yp.pm@gmail.com)
an e-mail with the bug number you would like and I will assign it to you
(please make sure you have a Bugzilla account). The list is at:
https://wiki.yoctoproject.org/wiki/Bug_Triage_Archive#Unassigned_or_Newcome=
r_Bugs

Thanks,



*Stephen K. Jolley*

*Yocto Project Program Manager*

(    *Cell*:                (208) 244-4460

* *Email*:                 *s
<stephen.k.jolley@intel.com>jolley.yp.pm@gmail.com <jolley.yp.pm@gmail.com>=
*

--0000000000005a84ba062d4bf78d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"font-size:11pt;font-family:Calibri,Ari=
al">All,<br><br>The triage team is starting to try and collect up and class=
ify bugs which a newcomer to the project would be able to work on in a way =
which means people can find them. They&#39;re being listed on the triage pa=
ge under the appropriate heading: <a href=3D"https://wiki.yoctoproject.org/=
wiki/Bug_Triage#Newcomer_Bugs">https://wiki.yoctoproject.org/wiki/Bug_Triag=
e#Newcomer_Bugs</a>  Also please review: <a href=3D"https://www.openembedde=
d.org/wiki/How_to_submit_a_patch_to_OpenEmbedded">https://www.openembedded.=
org/wiki/How_to_submit_a_patch_to_OpenEmbedded</a> and how to create a bugz=
illa account at: <a href=3D"https://bugzilla.yoctoproject.org/createaccount=
.cgi">https://bugzilla.yoctoproject.org/createaccount.cgi</a><br><br>The id=
ea is these bugs should be straight forward for a person to help work on wh=
o doesn&#39;t have deep experience with the project.  If anyone can help, p=
lease take ownership of the bug and send patches!  If anyone needs help/adv=
ice there are people on irc who can likely do so, or some of the more exper=
ienced contributors will likely be happy to help too.<br><br>Also, the tria=
ge team meets weekly and does its best to handle the bugs reported into the=
 Bugzilla. The number of people attending that meeting has fallen, as have =
the number of people available to help fix bugs. One of the things we hear =
users report is they don&#39;t know how to help. We (the triage team) are t=
herefore going to start reporting out the currently 415 unassigned or newco=
mer bugs.<br><br>We&#39;re hoping people may be able to spare some time now=
 and again to help out with these.  Bugs are split into two types, &quot;tr=
ue bugs&quot; where things don&#39;t work as they should and &quot;enhancem=
ents&quot; which are features we&#39;d want to add to the system.  There ar=
e also roughly four different &quot;priority&quot; classes right now, =E2=
=80=9C5.2=E2=80=9D, =E2=80=9C5.3&quot;, &quot;5.99&quot; and &quot;Future&q=
uot;, the more pressing/urgent issues being in &quot;5.2&quot; and then =E2=
=80=9C5.3=E2=80=9D.<br><br>Please review this link and if a bug is somethin=
g you would be able to help with either take ownership of the bug, or send =
me (<a href=3D"mailto:sjolley.yp.pm@gmail.com">sjolley.yp.pm@gmail.com</a>)=
 an e-mail with the bug number you would like and I will assign it to you (=
please make sure you have a Bugzilla account).  The list is at: <a href=3D"=
https://wiki.yoctoproject.org/wiki/Bug_Triage_Archive#Unassigned_or_Newcome=
r_Bugs">https://wiki.yoctoproject.org/wiki/Bug_Triage_Archive#Unassigned_or=
_Newcomer_Bugs</a></span></div><div dir=3D"ltr" class=3D"gmail_signature" d=
ata-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><p clas=
s=3D"MsoNormal" style=3D"background-image:initial;background-position:initi=
al;background-repeat:initial"><span style=3D"font-size:12pt;font-family:Ari=
al,sans-serif">Thanks,<span></span></span></p>

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

--0000000000005a84ba062d4bf78d--

