echo ">>>>>>>>>>
get arb file for localization
>>>>>>>>>>"

~/Documents/flutter_1.12.13+H5/bin/flutter \
pub run intl_translation:extract_to_arb \
--output-dir=lib/l10n \
~/AndroidStudioProjects/flutter_app3/lib/l10n/localization_intl.dart

