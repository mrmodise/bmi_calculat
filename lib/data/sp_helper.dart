import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'session.dart';

class SPHelper {
  static late SharedPreferences prefs;

  Future writeSession(Session session) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString(session.id.toString(), json.encode(session.toJson()));
  }

  Future<List<Session>> getSessions() async {
    prefs = await SharedPreferences.getInstance();
    List<Session> sessions = [];
    Set<String> keys = prefs.getKeys();

    for (var key in keys) {
      Session session = Session.fromJson(json.decode(prefs.getString(key) ?? ''));
      sessions.add(session);
    }
    return sessions;
  }
}
