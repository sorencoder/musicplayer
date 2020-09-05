import 'package:flutter/material.dart';
class Privacy extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Center(
                child: Text('Privacy Policy',style: TextStyle(fontSize: 20),)),
            subtitle: Text('At XYZ, one of our main priorities is the privacy of our users. This Privacy Policy document contains types of information that is collected and recorded by the app and how we use it.If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us through email at xyz@gmail.comThis privacy policy applies only to our online activities.'),
          ),
          ListTile(
            title: Center(
                child: Text('Consent',style: TextStyle(fontSize: 20),)),
            subtitle: Text('By using our app, you hereby consent to our Privacy Policy and agree to its terms.'),
          ),
          ListTile(
            title: Center(
                child: Text('Information we collect',style: TextStyle(fontSize: 20),)),
            subtitle: Text('There is no information that we collect can personally identify you'),
          ),
          ListTile(
            title: Center(
                child: Text('How we use your information',style: TextStyle(fontSize: 20),)),
            subtitle: Text('Provide, operate, and maintain our app. Improve, personalize, and expand our app.Understand and analyze how you use our app. Develop new services, features, and functionality'),
          ), ListTile(
            subtitle: Text('Google is one of a third-party vendor on our site. It also uses cookies, to serve ads to our site visitors based upon their visit to our app.Some of advertisers on our site may use cookies and web beacons. Each of our advertising partners has their own Privacy Policy for their policies on user data.'),
          ),

        ],
      ),
    );
  }
}
