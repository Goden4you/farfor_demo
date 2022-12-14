// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru_RU locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru_RU';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "big_data_error_detail": MessageLookupByLibrary.simpleMessage(
            "Размер запроса слишком большой"),
        "big_data_error_title":
            MessageLookupByLibrary.simpleMessage("Неизвестная ошибка"),
        "cart": MessageLookupByLibrary.simpleMessage("Корзина"),
        "cart_is_empty": MessageLookupByLibrary.simpleMessage("Корзина пуста"),
        "connection_error_detail": MessageLookupByLibrary.simpleMessage(
            "Упс! Проверьте подключение к интернету"),
        "connection_error_title":
            MessageLookupByLibrary.simpleMessage("Ошибка соединения"),
        "error": MessageLookupByLibrary.simpleMessage("Ошибка"),
        "main_page_title": MessageLookupByLibrary.simpleMessage("Столовка"),
        "menu": MessageLookupByLibrary.simpleMessage("Меню"),
        "oops": MessageLookupByLibrary.simpleMessage("Упс.."),
        "platform_error_occuried": MessageLookupByLibrary.simpleMessage(
            "Произошла платформенная ошибка"),
        "unknown_error_detail":
            MessageLookupByLibrary.simpleMessage("Произошла ошибка"),
        "unknown_error_title":
            MessageLookupByLibrary.simpleMessage("Неизвестная ошибка")
      };
}
