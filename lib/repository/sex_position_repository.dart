import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart' show rootBundle;
import 'package:libido/model/sex_position.dart';
import 'package:libido/util/util.dart';

class SexPositionRepository {
  /// Singleton
  SexPositionRepository._privateConstructor();

  static final SexPositionRepository _instance =
      SexPositionRepository._privateConstructor();

  factory SexPositionRepository() {
    return _instance;
  }

  List<SexPosition>? _sexPosition;

  Future<void> _loadData() async {
    final json = await rootBundle.loadString(Util.jsonFile);
    final parsedJson = jsonDecode(json);
    _sexPosition = parsedJson
        .map<SexPosition>((json) => SexPosition.fromMap(json))
        .toList();
    _sexPosition?.sort((a, b) => a.name.compareTo(b.name));
  }

  Future<List<SexPosition>> getSexPositions() async {
    if (_sexPosition == null) {
      await _loadData();
    }
    return _sexPosition!;
  }

  SexPosition getSexPosition(int id) {
    return _sexPosition!.firstWhere((element) => element.id == id);
  }

  int getRandomSexPosition() {
    Random random = Random();
    return random.nextInt(_sexPosition?.length ?? 0);
  }
}
