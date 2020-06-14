// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercises_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ExercisesController on _ExercisesControllerBase, Store {
  final _$valueAtom = Atom(name: '_ExercisesControllerBase.value');

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

  final _$_ExercisesControllerBaseActionController =
      ActionController(name: '_ExercisesControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_ExercisesControllerBaseActionController.startAction(
        name: '_ExercisesControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_ExercisesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
