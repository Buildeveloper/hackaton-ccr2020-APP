import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';
import 'package:ace/app/shared/constants/colors.dart' as AppColors;

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

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
              icon: Icon(Icons.home),
              text: "Home",
            ),
            Tab(
              icon: Icon(Icons.add),
              text: "Saúde",
            ),
            Tab(
              icon: Icon(Icons.card_giftcard),
              text: "Benefícios",
            ),
            Tab(
              icon: Icon(Icons.crop_free),
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
                color: AppColors.WHITE,
                foregroundDecoration: BoxDecoration(
                  color: AppColors.PRIMARY_COLOR,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0)),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Container(
                    color: AppColors.WHITE,
                  ),
                  Container(
                    color: AppColors.WHITE,
                  ),
                  Container(
                    color: AppColors.WHITE,
                  ),
                  Container(
                    color: AppColors.WHITE,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
