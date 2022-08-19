import 'package:get/get.dart';
import 'package:store_app/utils/localisation/translation/arabic.dart';
import 'package:store_app/utils/localisation/translation/english.dart';
import 'package:store_app/utils/localisation/translation/french.dart';

class Translation extends Translations
{
  @override
  Map<String, Map<String, String>> get keys => {
    'en': en,
    'ar': ar,
    'fr': fr
  };
}