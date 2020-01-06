echo ">>>>>>>>>>
get arb file for localization
>>>>>>>>>>"

flutter pub run intl_translation:extract_to_arb \
--output-dir=lib/l10n \
lib/l10n/localization_intl.dart

