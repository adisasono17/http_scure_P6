import 'package:flutter/foundation.dart';

enum LogLevel {
  debug,
  info,
  warning,
  error,
}

class AppLogger {
  /// Format waktu saat ini (YYYY-MM-DD HH:mm:ss).
  static String _getTimestamp() {
    return DateTime.now().toString().substring(0, 19);
  }
  static void _log(
    LogLevel level,
    String message, {
    String tag = 'APP',
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (!kDebugMode) return;

    final timestamp = _getTimestamp();
    final levelName = level.name.toUpperCase();
    final formattedMessage = '[$timestamp] [$levelName] [$tag] $message';

    debugPrint(formattedMessage);

    if (error != null) {
      debugPrint('[$timestamp] [ERROR_DETAIL] [$tag] $error');
    }
    if (stackTrace != null) {
      debugPrint('[$timestamp] [STACKTRACE] [$tag]\n$stackTrace');
    }
  }

  static void debug(String message, {String tag = 'DEBUG'}) {
    _log(LogLevel.debug, message, tag: tag);
  }

  static void info(String message, {String tag = 'INFO'}) {
    _log(LogLevel.info, message, tag: tag);
  }

  static void warning(String message, {String tag = 'WARNING'}) {
    _log(LogLevel.warning, message, tag: tag);
  }

  static void error(
    String message, {
    String tag = 'ERROR',
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(
      LogLevel.error,
      message,
      tag: tag,
      error: error,
      stackTrace: stackTrace,
    );
  }

  static String maskSensitive(String value) {
    if (value.length <= 4) return '****';
    return '${value.substring(0, 4)}****${value.substring(value.length - 2)}';
  }
}