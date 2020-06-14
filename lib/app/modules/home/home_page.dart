import 'package:ace/app/modules/home/models/channel.dart';
import 'package:ace/app/modules/home/models/health_item.dart';
import 'package:ace/app/modules/home/tabs/benefits_tab.dart';
import 'package:ace/app/modules/home/tabs/channels_tab.dart';
import 'package:ace/app/modules/home/tabs/dashboard_tab.dart';
import 'package:ace/app/modules/home/tabs/health_tab.dart';
import 'package:ace/app/shared/widgets/circle_imageview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';
import 'package:ace/app/shared/constants/colors.dart' as AppColors;
import 'package:ace/app/shared/constants/resources.dart' as Resources;

import 'models/benefit.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final healthItems = [
    new HealthItem(
        resource: Resources.EXERCISE_MAN, title: "Meus exercícios", route: ""),
    new HealthItem(resource: Resources.SLEEP, title: "Meu sono", route: ""),
    new HealthItem(
        resource: Resources.NUTRITION, title: "Minha alimentação", route: ""),
    new HealthItem(
        resource: Resources.PILL, title: "Meus medicamentos", route: ""),
    new HealthItem(
        resource: Resources.PRESSURE, title: "Pressão arterial", route: ""),
    new HealthItem(resource: Resources.WATER, title: "Hidratação", route: ""),
  ];
  final channels = [
    new Channel(name: "depressao"),
    new Channel(name: "alongamentos"),
  ];
  final benefits = [
    new Benefit(title: "Teste",
        imageUrl: "https://i.zst.com.br/images/smartband-xiaomi-mi-band-4-photo955294739-12-3b-d.jpg",
        points: 5000)
  ];

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: AppColors.PRIMARY_COLOR,
        child: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              icon: Image.asset(
                Resources.HOME,
                width: 25,
                height: 25,
              ),
              text: "Home",
            ),
            Tab(
              icon: Image.asset(
                Resources.HEALTH,
                width: 25,
                height: 25,
              ),
              text: "Saúde",
            ),
            Tab(
              icon: Image.asset(
                Resources.GIFT,
                width: 25,
                height: 25,
              ),
              text: "Benefícios",
            ),
            Tab(
              icon: Image.asset(
                Resources.POUND,
                width: 25,
                height: 25,
              ),
              text: "Canais",
            )
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.PRIMARY_COLOR,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        CircleImageView(
                          imagePath: Resources.MOTORA,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                          network: false,
                          progress: 80,
                        ),
                        Positioned(
                            top: MediaQuery
                                .of(context)
                                .size
                                .height / 13,
                            left: MediaQuery
                                .of(context)
                                .size
                                .width / 2 + 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "25.365",
                                      style: TextStyle(
                                          color: AppColors.WHITE,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Image.asset(
                                      Resources.TROPHY,
                                      width: 20,
                                      height: 20,
                                      color: AppColors.WHITE,
                                    )
                                  ],
                                ),
                                Text(
                                  "Nível 10",
                                  style:
                                  TextStyle(color: AppColors.ACCENT_COLOR),
                                )
                              ],
                            )),
                      ],
                    ),
                    Divider(
                      height: 20,
                    ),
                    Text(
                      "John Doe",
                      style: TextStyle(
                          color: AppColors.WHITE,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  DashBoardTab(),
                  HealthTab(
                    items: healthItems,
                    onClicked: (item) {
                      Modular.to.pushNamed(item.route);
                    },
                  ),
                  BenefitsPage(
                    benefits: benefits,
                    onClicked: (item) {},
                  ),
                  ChannelsTab(
                    channels: channels,
                    onClicked: (item) {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
