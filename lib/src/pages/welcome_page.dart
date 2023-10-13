import 'package:flutter/material.dart';

import '../common/my_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color mainColor = Color(0xff1B365D);
        
    return Scaffold( // Scaffold is sort of a skeleton widget that holds the differents parts of your app 
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network("https://aadcdn.msftauthimages.net/dbd5a2dd-c0cf6sjyueodul3wkly74mo-fbfv4b6nemnwslfmyzy/logintenantbranding/0/bannerlogo?ts=638005736888848288"),
             const SizedBox(height: 40), // TODO: There are better ways of doing this, this is only for convenience
            Container(
              height: 300,
              width: double.infinity,
              color: mainColor, // Color expects an ARGB integer, so we need to add 0xff to our hexadecimal value 
              child: const Center(
                child: Text(
                  "Welcome to Flutter Hack Day 2023", 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22
                 )
                )
              ),
            ),
            const SizedBox(height: 40),
            MyButton(
              onPressed: () {
                Navigator.pushNamed(context, "todopage");
               }, 
              text: "Continue",
            )
          ],
        )
      );
  }
}