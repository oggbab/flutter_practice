import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:async';

class ft_practiceStorageManager {
  static FlutterSecureStorage storage = FlutterSecureStorage();
  static String session = "";
  static String SESSION_ID = "session";

  static Future<bool> saveLoginSession(String id) async {
    try {
      await storage.write(
        key: SESSION_ID,
        value: id,
      );
      session = id;
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
    return false;
  }

  static Future<String> getSessionId() async {
    try {
      String? sessionId;
      sessionId = await storage.read(key: SESSION_ID);

      print(">>>>>>>>getSessionId session : ${session}");
      if (sessionId == null) {
        return "";
      } else {
        session = sessionId;
        return session;
      }
    } on Exception catch (e) {
      print(e.toString());
      return "";
    }
  }

  static Future<bool> logoutSession() async {
    try {
      await storage.delete(key: SESSION_ID);
      return true;
    } on Exception catch (e) {
      print(e.toString());
      return false;
    }
  }
}
