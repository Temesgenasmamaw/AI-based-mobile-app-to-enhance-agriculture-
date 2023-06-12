import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _feedbackKey = GlobalKey<FormState>();
  TextEditingController _feedbackController = TextEditingController();

  Future sendFeedbackEmail() async {
    final String email = 'temesgenasmamaw1621@gmail.com';
    final Uri params = await Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Feed backs of app&body=${_feedbackController.text}',
    );
    final url = params.toString();
    final urlPath = Uri.parse(url);
    launch(url);
  }

  Future<void> sendFeedbackTelegram() async {
    final String username = '@dgety';
    final Uri params = Uri(
      scheme: 'tg',
      path: 'msg',
      query:
          'to=$username&text=${Uri.encodeComponent(_feedbackController.text)}',
    );
    final url = params.toString();
    await launch(url);
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
        child: Form(
          key: _feedbackKey,
          child: Column(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _feedbackController,
                  maxLines: null,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'can not be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Feedback',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_feedbackKey.currentState!.validate()) {
                    try {
                      sendFeedbackEmail();
                    } catch (e) {
                      print(e.toString());
                    }
                  }
                },
                child: Text('Send Feedback'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
