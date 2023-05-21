import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  TextEditingController _feedbackController = TextEditingController();

  Future<void> sendFeedbackEmail() async {
    final String email = 'asmamawtemesgen16@gmail.com';
    // final String subject = 'Feedback on Firebase App';
    // final String body = 'Please enter your feedback here.';

    final Uri params = Uri(
      scheme: 'googlegmail',
      path: email,
      // queryParameters: {
      //   'subject': subject,
      //   'body': body,
      // },
    );

    String url = params.toString();

    if (await canLaunchUrl(url as Uri)) {
      await canLaunchUrl(url as Uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Feedback'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: TextFormField(
                controller: _feedbackController,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Feedback',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: sendFeedbackEmail,
              child: Text('Send Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}
