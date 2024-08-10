


import 'package:iddqd/variables/global_varibles.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomeFuncs{

 static startPressed(){
print('startPressed');
  }

    static Function termsOfUsePressed = () {
    launchUrl(Uri.parse(termsOfUse));
  };

  static Function privacyPolicyPressed = () {
    launchUrl(Uri.parse(privacyPolicy));
  };
}