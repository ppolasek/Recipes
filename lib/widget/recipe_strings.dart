
import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';

// Wrappers for strings that are shown in the UI.  The strings can be
// translated for different locales using the Dart intl_translation package.
//
// Locale-specific values for the strings live in the i18n/*.arb files.
//
// To generate the stock_messages_*.dart files from the ARB files, run this
// from your module's root directory:
//   pub run intl_translation:generate_from_arb --output-dir=lib/i18n --generated-file-prefix=recipe_ --no-use-deferred-loading lib/**/*.dart lib/i18n/recipes_*.arb

class RecipeStrings extends LocaleQueryData {
  static RecipeStrings of(BuildContext context) {
//    print('RecipeStrings.of() context = $context');
//    print('RecipeStrings.of() LocaleQuery = $LocaleQuery');
//    print('RecipeStrings.of() context.inheritFromWidgetOfExactType(LocaleQuery) = ${context.inheritFromWidgetOfExactType(LocaleQuery)}');
    return LocaleQuery.of(context);
  }

  static final RecipeStrings instance = new RecipeStrings();

  String RecipeStrings_title() =>
      Intl.message(
          'My Favorite Recipes',
          name: 'RecipeStrings_title',
          desc: 'Title for the My Favorite Recipes application'
      );
}
