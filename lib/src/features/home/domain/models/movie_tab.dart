import 'package:easy_localization/easy_localization.dart';

import '../../../../core/utis/datetime.dart';

enum MovieTab {
  now,
  special,
  comming;

  String get queryValue {
    switch (this) {
      case MovieTab.now:
        return 'current';
      case MovieTab.comming:
        return 'coming';
      case MovieTab.special:
        return DateTimeUtil.formatDateNow();
    }
  }

  String get title {
    switch (this) {
      case MovieTab.now:
        return 'home.tab.now'.tr();
      case MovieTab.comming:
        return 'home.tab.comming_soon'.tr();
      case MovieTab.special:
        return 'home.tab.special'.tr();
    }
  }
}
