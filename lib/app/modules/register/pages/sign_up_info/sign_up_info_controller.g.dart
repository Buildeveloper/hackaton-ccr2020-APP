// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_info_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpInfoController on _SignUpInfoControllerBase, Store {
  final _$valueAtom = Atom(name: '_SignUpInfoControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_SignUpInfoControllerBaseActionController =
      ActionController(name: '_SignUpInfoControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_SignUpInfoControllerBaseActionController
        .startAction(name: '_SignUpInfoControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_SignUpInfoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
