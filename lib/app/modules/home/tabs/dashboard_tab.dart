import 'dart:math';

import 'package:ace/app/shared/widgets/circle_imageview.dart';
import 'package:flutter/material.dart';
import 'package:ace/app/shared/constants/colors.dart' as AppColors;
import 'package:ace/app/shared/constants/resources.dart' as Resources;

class DashBoardTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            _buildFriendsCard(context),
            _buildHistoryCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildFriendsCard(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildTitle("Amigos"),
                _buildFriend(context, "#1", "Tonhão Gabeira", Resources.MOTORA),
                _buildFriend(context, "#2", "ALice Rosa", Resources.WTRUCKER),
                _buildMore(),
              ]),
        ),
      ),
    );
  }

  Widget _buildHistoryCard() {
    return Container(
      width: double.infinity,
      height: 240,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTitle("Pontos"),
              Divider(
                height: 5,
                color: AppColors.TRANSPARENT,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 4,
                    child: _historyItem(
                        Resources.EXERCISE_MAN, "Exercícios", "745 (3h45)"),
                  ),
                  Expanded(
                    flex: 4,
                    child:
                        _historyItem(Resources.WALK, "Passos", "12000 (12km)"),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                ],
              ),
              Divider(
                height: 50,
                color: AppColors.TRANSPARENT,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                      flex: 4,
                      child: _historyItem(
                          Resources.NUTRITION, "Calorias", "500 (13k/20k)")),
                  Expanded(
                      flex: 4,
                      child: _historyItem(
                          Resources.WATER, "Hidratação", "300 (1,8l/dia)")),
                ],
              ),
              Divider(
                height: 30,
                color: AppColors.TRANSPARENT,
              ),
              _buildMore(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _historyItem(String imagePath, String title, String info) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.asset(
          imagePath,
          width: 30,
          height: 30,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(info)
          ],
        )
      ],
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: TextStyle(color: AppColors.PRIMARY_COLOR, fontSize: 20),
    );
  }

  Widget _buildFriend(BuildContext context, String position, String name, String resource) {
    final random = Random().nextInt(100).toDouble();
    return Row(
      children: <Widget>[
        Text(position),
        CircleImageView(
          imagePath: resource,
          width: 50,
          height: 50,
          network: false,
          progress: random,
          stokeWidth: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Divider(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 20,
                      width: 200,
                      decoration: BoxDecoration(
                        color: AppColors.DEFAULT_GRAY,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5.0),
                          bottomRight: Radius.circular(5.0),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: random + 100,
                      decoration: BoxDecoration(
                        color: AppColors.ACCENT_COLOR,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5.0),
                          bottomRight: Radius.circular(5.0),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "${(random * 100).round()}",
                          style: TextStyle(
                              color: AppColors.WHITE,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          Resources.TROPHY,
                          width: 20,
                          height: 20,
                          color: AppColors.WHITE,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 5,
                ),
                Text("${(random / 10).round()}")
              ],
            ),
          ],
        )
      ],
    );
  }

  Widget _buildMore() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("Ver mais"),
        Icon(Icons.chevron_right),
      ],
    );
  }
}
