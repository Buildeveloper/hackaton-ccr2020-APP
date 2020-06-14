// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$showFabAtom = Atom(name: '_HomeControllerBase.showFab');

  @override
  bool get showFab {
    _$showFabAtom.reportRead();
    return super.showFab;
  }

  @override
  set showFab(bool value) {
    _$showFabAtom.reportWrite(value, super.showFab, () {
      super.showFab = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void changeFabVisibility(bool show) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.changeFabVisibility');
    try {
      return super.changeFabVisibility(show);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showFab: ${showFab}
    ''';
  }
}
