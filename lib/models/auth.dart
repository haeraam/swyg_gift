import 'dart:js';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Auth {
  String? _memberNm;
  String? _memberId;
  String? _memberEmail;
  Auth() {
    _memberNm = Hive.box('auth').get('memberNm');
    _memberId = Hive.box('auth').get('memberId');
    _memberEmail = Hive.box('auth').get('memberEmail');
  }

  get memberNm {
    return _memberNm ?? getAuth();
  }

  get memberId {
    return _memberId ?? getAuth();
  }

  get memberEmail {
    return _memberEmail ?? getAuth();
  }

  getAuth() async {
    await launchUrl(
      Uri.parse('https://pickproduct.shop/login'),
      mode: LaunchMode.inAppWebView,
    );
    // window.close();
  }

  checkAuth() {
    _memberNm ?? getAuth();
  }

  signOut() {
    Hive.box('auth').put('memberNm', null);
    Hive.box('auth').put('memberId', null);
    Hive.box('auth').put('memberEmail', null);
  }
}
