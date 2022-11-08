import 'package:url_launcher/url_launcher.dart';

// void launchURL(url) async => await canLaunchUrl(Uri.parse(url))
//     ? await launchUrl(Uri.parse(url))
//     : throw 'Could not launch $url';

// void launchURL2(url) async =>
//     await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

// ignore: deprecated_member_use
void launchURL(url) async => await canLaunch(url)
// ignore: deprecated_member_use
    ? await launch(url /*, forceWebView: true*/)
    : throw 'Could not launch $url';
