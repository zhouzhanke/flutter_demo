echo ">>>>>>>>>>
arb to dart
>>>>>>>>>>"

flutter pub run intl_translation:generate_from_arb \
--output-dir=lib/l10n --no-use-deferred-loading \
lib/l10n/localization_intl.dart lib/l10n/intl_*.arb
