import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

class Rate extends StatefulWidget {
  @override
  _RateState createState() => _RateState();
}

class _RateState extends State<Rate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 97, 161, 213),
        title: Text('ReteUs'.tr()),
        // automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Center(
          child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: Colors.cyan,
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Text(
              'RatingDialog'.tr(),
              style: TextStyle(fontSize: 15),
            ),
            onPressed: _showRatingAppDialog,
          ),
        ),
      ),
    );
  }

  void _showRatingAppDialog() {
    final _ratingDialog = RatingDialog(
      starColor: Colors.amber,
      title: Text('RateUs'.tr()),
      message: Text('RateComment'.tr()),
      image: Image.asset(
        "assets/icons.png",
        height: 100,
      ),
      // submitButton: Text('Submit'),
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {

        
        print('rating: ${response.rating}, '
            'comment: ${response.comment}');

        if (response.rating < 3.0) {
          print('response.rating: ${response.rating}');
        } else {
          Container();
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Thanks${response.rating}'.tr(),
              style: TextStyle(fontSize: 20),
            ),
            duration: Duration(seconds: 5),
          ),
        );
      },
      submitButtonText: 'Submit'.tr(),
    );

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => _ratingDialog,
    );
  }
}
