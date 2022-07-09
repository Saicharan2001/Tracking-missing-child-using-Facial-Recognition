import 'package:url_launcher/url_launcher.dart';

launchURL1() async {
  const url = 'https://www.google.com/maps/search/nearest+police+station/@13.0442443,77.5514071,15z/data=!3m1!4b1';
  _launch(url);
}

launchURL2() async {
  const url = 'https://www.google.com/search?q=google+translate+audio&sxsrf=ALiCzsapDJaQK_mP2Q26yGbsCIvVnhbv7Q%3A1656993497232&ei=2bbDYua_DcDQseMP3pKBoAo&ved=0ahUKEwimkLDm7eD4AhVAaGwGHV5JAKQQ4dUDCA4&uact=5&oq=google+translate+audio&gs_lcp=Cgdnd3Mtd2l6EAMyCAgAEIAEELEDMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEOgcIABBHELADOgcIABCwAxBDOg0IABCABBCHAhCxAxAUOgsIABCABBCxAxCDAToICAAQsQMQgwE6CggAEIAEEEYQ_wE6EAgAEIAEEIcCELEDEIMBEBQ6CggAEIAEEIcCEBRKBAhBGABKBAhGGABQzwJYqgtg6A9oAXABeACAAfgBiAHaCJIBBTAuNC4ymAEAoAEByAEKwAEB&sclient=gws-wiz1';
  _launch(url);
}

launchURL3() async {
  const url = 'https://www.google.com/search?q=hospitals+near+me&biw=1366&bih=625&tbm=lcl&sxsrf=ALiCzsao46-z9b8mBTQbSGt14awendhrPg%3A1656994293948&ei=9bnDYqOxOZnS2roP0P2gyA0&oq=hosp&gs_l=psy-ab.1.0.0i433i131i457i67k1j0i402k1l2j0i433i67k1j0i67k1l5j0i512i433i131k1.121053.124090.0.126382.36.11.0.0.0.0.355.1087.0j1j2j1.5.0....0...1c.1.64.psy-ab..32.4.1267.10..35i362i39k1j35i39k1j0i273k1j0i433i131i10k1.376.ApmwP8BLSUI#rlfi=hd:;si:;mv:[[13.0808006,77.5887861],[13.0184901,77.53667329999999]];tbs:lrf:!1m4!1u3!2m2!3m1!1e1!1m4!1u2!2m2!2m1!1e1!2m1!1e2!2m1!1e3!3sIAE,lf:1,lf_ui:2';
  _launch(url);
}

launchEMAIL() async {
  final Uri _emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'example@gmail.com',
    queryParameters: {
      'subject': 'Testing URL_LAUNCHER | DEMO',
      'body': 'MESSAGE'
    },
  );
  _launch(_emailLaunchUri.toString());
}

launchCALL() async {
  const phonenumber = "tel:1098";
  _launch(phonenumber);
}

launchSMS() async {
  const smsPhoneNumber = "sms:9999999999";
  _launch(smsPhoneNumber);
}

_launch(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
