import 'package:flutter/material.dart';
import 'package:supono/l10n/l10n.dart';

enum Gender { male, female, other }

extension GenderX on Gender {
  String title(BuildContext context) {
    switch (this) {
      case Gender.male:
        return context.l10n.male;
      case Gender.female:
        return context.l10n.female;
      case Gender.other:
        return context.l10n.other;
    }
  }
}
