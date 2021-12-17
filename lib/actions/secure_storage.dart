import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class SecureStorage {
  @protected
  final storage = const FlutterSecureStorage();

  @protected
  Future<String?> readToken({ String? key }) async {
    return await storage.read(key: key ?? '_token');
  }

  @protected
  Future<void> writeToken({ String? key, required String value }) async {
    await storage.write(key: key ?? '_token', value: value);
  }

  @protected
  Future<void> deleteToken({ String? key }) async {
    await storage.delete(key: key ?? '_token');
  }

}