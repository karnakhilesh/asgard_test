import 'package:asgard/app/core/internationalization/internationalization.dart';
import 'package:get/get.dart';

class AsgardTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          ...AsgardCoreStrings().en_US,
        },
      };
}
