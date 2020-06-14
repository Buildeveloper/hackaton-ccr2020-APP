import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'exercises_controller.dart';
import 'package:ace/app/shared/constants/colors.dart' as AppColors;
import './tabs/historic_tab.dart';
import './tabs/exercises_tab.dart';

class ExercisesPage extends StatefulWidget {
    final String title;
    
    const ExercisesPage({Key key, this.title = "Home"}) : super(key: key);
    
    @override
    _ExercisesPageState createState() => _ExercisesPageState();
}

class _ExercisesPageState extends ModularState<ExercisesPage, ExercisesController>
    with SingleTickerProviderStateMixin {
    TabController _tabController;
    
    @override
    void initState() {
        _tabController = TabController(vsync: this, length: 2);
        super.initState();
    }
    
    @override
      Widget build(BuildContext context) {
        return Scaffold(
         appBar: AppBar(
            title: Text(widget.title),
         ),
            body: Container(
                child: Column(
                    children: <Widget>[
                        Expanded(
                            flex: 2,
                            child: Container(
                                color: AppColors.PRIMARY_COLOR,
                                child: TabBar(
                                    controller: _tabController,
                                    tabs: <Widget>[
                                        Tab(
                                            icon: Icon(Icons.home),
                                            text: "Exercício",
                                        ),
                                        Tab(
                                            icon: Icon(Icons.add),
                                            text: "Histórico",
                                        ),
                                    ],
                                )
                            )
                        ),
                        Expanded(
                            flex: 8,
                            child: TabBarView(
                                controller: _tabController,
                                children: <Widget>[
                                    ExercisesTab(),
                                    HistoricTab(),
                                ]
                            )
                        )
                    ],
                ),
            ),
        );
      }
}