import 'package:flutter/material.dart';
import 'package:firestore/custom_web_view.dart';
import 'package:firebase_auth/firebase_auth.dart';

String your_client_id = "3341940445818581";
String your_redirect_url = "https://www.facebook.com/connect/login_success.html";
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseUser user;
loginWithFacebook(BuildContext context) async {
  String result = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CustomWebView(
        selectedUrl:
            'https://www.facebook.com/dialog/oauth?client_id=$your_client_id&redirect_uri=$your_redirect_url&response_type=token&scope=email,public_profile,',
      ),
      maintainState: true,
    ),
  );
  if (result != null) {
    try {
      final facebookAuthCred = FacebookAuthProvider.getCredential(accessToken: result);
      final user = await auth.signInWithCredential(facebookAuthCred);
      print("the user is " + user.user.displayName);
    } catch (e) {}
  }
}
