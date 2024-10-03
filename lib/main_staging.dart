import 'package:navalia_code_challenge/core/constants/flavor.dart';

import 'main.dart' as main_common;

void main() {
  Flavor.flavorType = FlavorTypes.staging;
  main_common.main();
}
