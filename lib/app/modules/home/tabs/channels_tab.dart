import 'package:ace/app/shared/models/channel.dart';
import 'package:flutter/material.dart';
import 'package:ace/app/shared/constants/colors.dart' as AppColors;
import 'package:ace/app/shared/constants/resources.dart' as Resources;

class ChannelsTab extends StatelessWidget {
  final Function(Channel) onClicked;
  final List<Channel> channels;

  const ChannelsTab({
    this.onClicked,
    this.channels,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: channels.length,
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
              onTap: () => onClicked(channels[i]),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Container(
                  height: 50,
                  child: Row(children: <Widget>[
                    Image.asset(
                      Resources.POUND,
                      width: 30,
                      height: 30,
                      color: AppColors.PRIMARY_COLOR,
                    ),
                    Text(
                      channels[i].name,
                      style: TextStyle(fontSize: 20.0),
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
