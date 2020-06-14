import 'package:ace/app/modules/home/models/health_item.dart';
import 'package:flutter/material.dart';
import 'package:ace/app/shared/constants/colors.dart' as AppColors;

class HealthTab extends StatelessWidget {
  final List<HealthItem> items;
  final Function(HealthItem) onClicked;

  const HealthTab({
    this.items,
    this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return items != null
        ? GridView.count(
            crossAxisCount: 2,
            children: List.generate(
              items.length,
              (index) {
                return Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 5,
                    child: InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      splashColor: AppColors.ACCENT_COLOR,
                      onTap: () => onClicked(items[index]),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              items[index].resource,
                              width: 100,
                            ),
                            Divider(
                              height: 10,
                              color: AppColors.TRANSPARENT,
                            ),
                            Text(items[index].title)
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        : Container();
  }
}
