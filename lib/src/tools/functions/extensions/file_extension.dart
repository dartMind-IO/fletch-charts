part of 'extensions.dart';

extension FileExtension on File {
  String get name => path.split('/').toList().lastOrNull ?? '';
}
