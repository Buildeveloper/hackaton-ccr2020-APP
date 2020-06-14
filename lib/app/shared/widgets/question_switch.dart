import 'package:flutter/material.dart';
import 'package:ace/app/shared/constants/colors.dart' as AppColors;

class QuestionSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String negativeAnswer;
  final String positiveAnswer;
  final String title;

  const QuestionSwitch({
    Key key,
    this.value,
    this.onChanged,
    this.negativeAnswer = "Não",
    this.positiveAnswer = "Sim",
    this.title = "",
  }) : super(key: key);

  @override
  _QuestionSwitchState createState() => _QuestionSwitchState();
}

class _QuestionSwitchState extends State<QuestionSwitch>
    with SingleTickerProviderStateMixin {
  Animation _circleAnimation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
            onTap: () {
              if (_animationController.isCompleted) {
                _animationController.reverse();
              } else {
                _animationController.forward();
              }
              widget.value == false
                  ? widget.onChanged(true)
                  : widget.onChanged(false);
            },
            child: Column(
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
                    Container(
                      width: 70.0,
                      height: 35.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: _circleAnimation.value == Alignment.centerLeft
                              ? Colors.grey
                              : AppColors.PRIMARY_COLOR),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 4.0, bottom: 4.0, right: 4.0, left: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _circleAnimation.value == Alignment.centerRight
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4.0, right: 4.0),
                                    child: Text(
                                      'On',
                                      style: TextStyle(
                                          color: AppColors.TRANSPARENT,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 16.0),
                                    ),
                                  )
                                : Container(),
                            Align(
                              alignment: _circleAnimation.value,
                              child: Container(
                                width: 25.0,
                                height: 25.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                              ),
                            ),
                            _circleAnimation.value == Alignment.centerLeft
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4.0, right: 5.0),
                                    child: Text(
                                      'Off',
                                      style: TextStyle(
                                          color: AppColors.TRANSPARENT,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 16.0),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
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
            ));
      },
    );
  }
}
