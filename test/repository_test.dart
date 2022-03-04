import 'package:flutter_test/flutter_test.dart';
import 'package:libido/repository/sex_position_repository.dart';

void main() {
  late SexPositionRepository sexPositionRepository;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    sexPositionRepository = SexPositionRepository();
  });

  group("repository test", () {
    test("load json", () async {
      var positions = await sexPositionRepository.getSexPositions();
      expect(positions.isEmpty, false);
    });

    test("get random position", () async {
      await sexPositionRepository.getSexPositions();
      final random = sexPositionRepository.getRandomSexPosition();
      expect(random, isNotNull);
      final position = sexPositionRepository.getSexPosition(random);
      expect(position, isNotNull);
      expect(position.name, isNotNull);
      expect(position.description, isNotNull);
      expect(position.image, isNotNull);
    });
  });
}
