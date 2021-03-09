// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
import 'package:apr/model/model.dart';
import 'package:flutter_test/flutter_test.dart';

// import 'package:business_course/main.dart';
import 'package:apr/service/service.dart';
import 'package:flutter/foundation.dart';

void main() {

  group('Services', () {
    test('Get Ide All', () async {
      final KategoriService _service = KategoriService();
      final result = await _service.getIdeAll();
      
      if (result.isSucess) {

        debugPrint(result.value.toString());
        debugPrint(result.value.length.toString());

      } else {
        throw result.massage;
      }

    });

    test('Get Pelatihan All', () async {
      final KategoriService _service = KategoriService();
      final result = await _service.getPelatihanAll();
      
      if (result.isSucess) {

        debugPrint(result.value.toString());
        debugPrint(result.value.length.toString());

      } else {
        throw result.massage;
      }

    });

    test('Get Ide', () async {
      final KategoriService _service = KategoriService();
      final result = await _service.getIde(1);
      
      if (result.isSucess) {

        debugPrint(result.value.toString());

      } else {
        throw result.massage;
      }
    });
  });

  // group('Model', () {
  //   final Pelatihan pelatihan = Pelatihan();
  //   final Ide ide = Ide();

  // });
}