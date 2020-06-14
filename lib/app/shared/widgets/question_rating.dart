import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ace/app/shared/constants/colors.dart' as AppColors;

class QuestionRating extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String negativeAnswer;
  final String positiveAnswer;
  final String title;

  const QuestionRating({
    Key key,
    this.value,
    this.onChanged,
    this.negativeAnswer = "Não",
    this.positiveAnswer = "Sim",
    this.title = "",
  }) : super(key: key);

  @override
  _QuestionRatingState createState() => _QuestionRatingState();
}

class _QuestionRatingState extends State<QuestionRating> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.title,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(
          color: AppColors.TRANSPARENT,
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.negativeAnswer,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            VerticalDivider(
              color: AppColors.TRANSPARENT,
              width: 25,
            ),
            RatingBar(
              unratedColor: AppColors.DEFAULT_GRAY,
              itemSize: 25,
              initialRating: 0,
              itemCount: 5,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return Icon(
                      Icons.sentiment_very_dissatisfied,
                      color: Colors.red,
                    );
                  case 1:
                    return Icon(
                      Icons.sentiment_dissatisfied,
                      color: Colors.redAccent,
                    );
                  case 2:
                    return Icon(
                      Icons.sentiment_neutral,
                      color: Colors.amber,
                    );
                  case 3:
                    return Icon(
                      Icons.sentiment_satisfied,
                      color: Colors.lightGreen,
                    );
                  case 4:
                    return Icon(
                      Icons.sentiment_very_satisfied,
                      color: Colors.green,
                    );
                }
              },
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            VerticalDivider(
              color: AppColors.TRANSPARENT,
              width: 25,
            ),
            Text(
              widget.positiveAnswer,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}
