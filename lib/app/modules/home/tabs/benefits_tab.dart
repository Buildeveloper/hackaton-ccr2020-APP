import 'package:ace/app/modules/home/models/benefit.dart';
import 'package:flutter/material.dart';
import 'package:ace/app/shared/constants/colors.dart' as AppColors;
import 'package:ace/app/shared/constants/resources.dart' as Resources;

class BenefitsPage extends StatelessWidget {
  final Function(Benefit) onClicked;
  final List<Benefit> benefits;

  const BenefitsPage({
    this.onClicked,
    this.benefits,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: benefits.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: EdgeInsets.all(5.0),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              splashColor: AppColors.ACCENT_COLOR,
              onTap: () => onClicked(benefits[i]),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Container(
                  height: 100,
                  child: Row(children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Image.network(
                        benefits[i].imageUrl,
                        width: 90,
                        height: 90,
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 8,
                            child: Text(
                              benefits[i].title,
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Image.asset(Resources.TROPHY),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${benefits[i].points}",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
