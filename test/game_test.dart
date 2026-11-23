import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kagit_ucak_suzulme/oyun_kagit_ucak_suzulme.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(ucakConfig.title.length, 33);
    expect(ucakConfig.tagline.length, 33);
    for (final s in ucakConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(ucakRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: ucakId, optionalMechanics: ucakRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(ucakRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
