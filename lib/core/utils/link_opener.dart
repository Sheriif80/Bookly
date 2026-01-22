import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkOpener {
  static Future<void> openUrl(BuildContext context, String urlString) async {
    final Uri url = Uri.parse(urlString);

    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
        _showCustomSnackBar(context, 'Retrieving to the book...');
      } else {
        // Link is valid format, but device couldn't handle it
        _showCustomSnackBar(context, 'Could not launch $urlString');
      }
    } catch (e) {
      // Link format is likely invalid or another error occurred
      _showCustomSnackBar(context, 'Error: Invalid Link');
    }
  }

  static void _showCustomSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.white, // Use red for errors
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
