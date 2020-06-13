// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_data_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PersonalDataController on _PersonalDataControllerBase, Store {
  final _$proceedEnabledAtom =
      Atom(name: '_PersonalDataControllerBase.proceedEnabled');

  @override
  bool get proceedEnabled {
    _$proceedEnabledAtom.reportRead();
    return super.proceedEnabled;
  }

  @override
  set proceedEnabled(bool value) {
    _$proceedEnabledAtom.reportWrite(value, super.proceedEnabled, () {
      super.proceedEnabled = value;
    });
  }

  final _$_PersonalDataControllerBaseActionController =
      ActionController(name: '_PersonalDataControllerBase');

  @override
  dynamic setProceedEnabled(bool enabled) {
    final _$actionInfo = _$_PersonalDataControllerBaseActionController
        .startAction(name: '_PersonalDataControllerBase.setProceedEnabled');
    try {
      return super.setProceedEnabled(enabled);
    } finally {
      _$_PersonalDataControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
proceedEnabled: ${proceedEnabled}
    ''';
  }
}
