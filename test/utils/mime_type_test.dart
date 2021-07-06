import 'package:fa_dart_core/src/utils/mime_type.dart';
import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

void main() {
  group('mime type', () {
    test('mime should return pdf when filename has pdf', () {
      final path = "/user/flutter/my-sample-pdf.pdf";
      final mimeType = mime(path);
      expect(mimeType, "application/pdf");
    });

    test('mime should return jpg when filename has jpg', () {
      final path = "/user/flutter/my-sample-image.jpg";
      final mimeType = mime(path);
      expect(mimeType, "image/jpeg");
    });

    test('mime should return null when no extension found', () {
      final path = "/user/flutter/my-sample-image";
      final mimeType = mime(path);
      expect(mimeType, null);
    });

    test('mime should return null when unknown extension found', () {
      final path = "/user/flutter/my-sample-image.apg";
      final mimeType = mime(path);
      expect(mimeType, null);
    });
  });
  group('mime from extension', () {
    test('mimeFromExtension should return pdf when extension is pdf', () {
      final path = "pdf";
      final mimeType = mimeFromExtension(path);
      expect(mimeType, "application/pdf");
    });

    test('mimeFromExtension should return null when unknown extension found',
        () {
      final path = "apg";
      final mimeType = mime(path);
      expect(mimeType, null);
    });
  });
}
