import 'package:easy_localization/easy_localization.dart';

import '../../../../core/utis/datetime.dart';

enum MovieTabType {
  now,
  special,
  comming;

  String get queryValue {
    switch (this) {
      case MovieTabType.now:
        return 'current';
      case MovieTabType.comming:
        return 'coming';
      case MovieTabType.special:
        return DateTimeUtil.formatDateNow();
    }
  }

  String get title {
    switch (this) {
      case MovieTabType.now:
        return 'home.tab.now'.tr();
      case MovieTabType.comming:
        return 'home.tab.comming_soon'.tr();
      case MovieTabType.special:
        return 'home.tab.special'.tr();
    }
  }
}
