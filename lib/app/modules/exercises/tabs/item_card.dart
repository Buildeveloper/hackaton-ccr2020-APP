import 'package:flutter/material.dart';
import 'package:ace/app/shared/constants/resources.dart' as Resources;
import 'package:ace/app/shared/constants/colors.dart' as AppColors;

class ItemCard extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Expanded(
                    flex: 4,
                    child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset(Resources.EXERCISES,
                            width: 50,
                            height: 80,
                            fit: BoxFit.fill
                        ),
                    )
                ),
                Expanded(
                    flex: 9,
                    child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                                Text('Série 2',
                                    style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.PRIMARY_COLOR)),
                                Text('10x abdominais, 15 flexões'),
                                Container(
                                    padding: EdgeInsets.all(6),
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: <Widget>[
                                                    Image.asset(Resources.TROPHY, height: 25, width: 25,),
                                                    Text('125pts', style: TextStyle(fontWeight: FontWeight.bold)),
                                                    SizedBox(width: 10,),
                                                  Image.asset(Resources.CLOCK, height: 25, width: 25,),
                                                    Text('45mim', style: TextStyle(fontWeight: FontWeight.bold))
                                                ],
                                            ),
                                            Divider(height: 5, color: AppColors.TRANSPARENT,),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: <Widget>[
                                                    Text('12/06/2020', style: TextStyle(fontWeight: FontWeight.bold))
                                                ],
                                            )
                                        ],
                                    )
                                ),
                            ],
                        ),
                    ),
                )
            ]
        );
    }
}