import 'package:hive_flutter/hive_flutter.dart';
import 'package:navalia_code_challenge/core/constants/flavor.dart';

import 'mock_method_channels.dart';

// Required for tests involving dio with caching strategies;
Future<void> initFlutter({FlavorTypes flavorType = FlavorTypes.dev}) async {
  MockMethodChannels.initPathProviderMethodChannel();
  await Hive.initFlutter();
  Flavor.flavorType = flavorType;
}
