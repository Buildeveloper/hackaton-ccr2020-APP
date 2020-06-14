import 'package:ace/app/shared/widgets/check_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'health_data_controller.dart';
import 'package:ace/app/shared/widgets/default_button.dart';
import 'package:ace/app/shared/widgets/default_input_text.dart';
import 'package:ace/app/shared/widgets/question_switch.dart';
import 'package:ace/app/shared/widgets/question_rating.dart';
import 'package:ace/app/shared/widgets/keyboard_dismiss.dart';
import 'package:ace/app/shared/constants/strings.dart' as Strings;
import 'package:ace/app/shared/constants/colors.dart' as AppColors;

class HealthDataPage extends StatefulWidget {
  final String title;

  const HealthDataPage({Key key, this.title = "HealthData"}) : super(key: key);

  @override
  _HealthDataPageState createState() => _HealthDataPageState();
}

class _HealthDataPageState
    extends ModularState<HealthDataPage, HealthDataController> {
  double divider = 40;
  bool medicineUse = false;
  bool medicalMonitoring = false;
  bool psychologicalMonitoring = false;
  bool checkedValue = false;

  final heightFocus = FocusNode();
  final heightTextController = TextEditingController();

  final weightFocus = FocusNode();
  final weightTextController = TextEditingController();

  @override
  void dispose() {
    heightFocus.dispose();
    heightTextController.dispose();
    weightFocus.dispose();
    weightTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismiss(
        child: Scaffold(
      bottomNavigationBar: DefaultButton(
        padding: EdgeInsets.all(15),
        text: Strings.PROCEED,
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              DefaultInputText(
                labelText: "Altura (m)",
                textInputAction: TextInputAction.next,
                controller: heightTextController,
                focusNode: heightFocus,
                inputType: TextInputType.number,
                onFieldSubmitted: (v) =>
                    FocusScope.of(context).requestFocus(weightFocus),
              ),
              Divider(
                color: AppColors.TRANSPARENT,
                height: divider,
              ),
              DefaultInputText(
                labelText: "Peso (kg)",
                textInputAction: TextInputAction.next,
                controller: weightTextController,
                focusNode: weightFocus,
                inputType: TextInputType.number,
                onFieldSubmitted: (v) =>
                    FocusScope.of(context).requestFocus(weightFocus),
              ),
              Divider(
                color: AppColors.TRANSPARENT,
                height: divider,
              ),
              QuestionSwitch(
                title: "Faz uso de medicamento contínuo?",
                value: medicineUse,
                onChanged: (value) {
                  setState(() {
                    medicineUse = value;
                  });
                },
              ),
              Divider(
                color: AppColors.TRANSPARENT,
                height: divider,
              ),
              QuestionSwitch(
                title: "Faz acompanhamento médico?",
                value: medicalMonitoring,
                onChanged: (value) {
                  setState(() {
                    medicalMonitoring = value;
                  });
                },
              ),
              Divider(
                color: AppColors.TRANSPARENT,
                height: divider,
              ),
              QuestionSwitch(
                title: "Faz acompanhamento psicológico?",
                value: psychologicalMonitoring,
                onChanged: (value) {
                  setState(() {
                    psychologicalMonitoring = value;
                  });
                },
              ),
              Divider(
                color: AppColors.TRANSPARENT,
                height: divider,
              ),
              QuestionRating(
                title: "Pratica exercícios físicos com regularidade?",
                negativeAnswer: "Pouco",
                positiveAnswer: "Muito",
              ),
              Divider(
                color: AppColors.TRANSPARENT,
                height: divider,
              ),
              QuestionRating(
                title: "Como você considera seu sono?",
                negativeAnswer: "Péssimo",
                positiveAnswer: "Ótimo",
              ),
              Divider(
                color: AppColors.TRANSPARENT,
                height: divider,
              ),
              QuestionRating(
                title: "Como você considera sua visão?",
                negativeAnswer: "Péssima",
                positiveAnswer: "Ótima",
              ),
              Divider(
                color: AppColors.TRANSPARENT,
                height: divider,
              ),
              QuestionRating(
                title: "Como você considera sua saúde mental?",
                negativeAnswer: "Péssima",
                positiveAnswer: "Ótima",
              ),
              CheckListItem()
            ],
          ),
        ),
      ),
    ));
  }
}
