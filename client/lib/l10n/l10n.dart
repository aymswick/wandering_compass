import 'package:flutter/widgets.dart';
import 'package:wandering_compass_client/l10n/gen/app_localizations.dart';

export 'package:wandering_compass_client/l10n/gen/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
