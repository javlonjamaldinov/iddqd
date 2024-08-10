


import 'package:iddqd/variables/global_varibles.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsFuncs{

       static backButtonPressed(){
print('backButtonPressed');
  }

 static notificationPressed(){
print('notificationPressed');
  }
   static freeAddsPressed(){
print('freeAddsPressed');
  }

     static switchPressed(bool v){
print('switchPressed $v');
  }

    static Function termsOfUsePressed = () {
    launchUrl(Uri.parse(termsOfUse));
  };

  static Function privacyPolicyPressed = () {
    launchUrl(Uri.parse(privacyPolicy));
  };
}