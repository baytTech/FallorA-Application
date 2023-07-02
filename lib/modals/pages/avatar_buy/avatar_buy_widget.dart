import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../backend/auth/auth.manager.dart';
import '../../../injection.dart';
import '../../../widgets/appbar/FalloraAppBar.dart';

class MyAvatarsPage extends StatefulWidget {
  const MyAvatarsPage({super.key});

  @override
  State<MyAvatarsPage> createState() => _MyAvatarsPageState();
}

class _MyAvatarsPageState extends State<MyAvatarsPage> {
  late AuthManager authManager = getIt<AuthManager>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FalloraAppBar(
        isHome: true,
        context: context,
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 57, 19, 69),
            Color.fromARGB(255, 157, 62, 205)
          ],
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 69, 67, 67),
        child: Column(
          children: [
            _avatarlarimTextContainer(),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return _CardWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardWidget extends StatelessWidget {
  const _CardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var buttonText = "Satın al";
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              width: 160,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network("https://picsum.photos/200/300"))),
          InkWell(
            onTap: () {},
            child: Container(
                height: 40,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    color: Color.fromARGB(255, 114, 37, 122)),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      buttonText,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text("5*",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  )
                ])),
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}

class _avatarlarimTextContainer extends StatelessWidget {
  const _avatarlarimTextContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var avatarlarimText = "Avatarlarım";
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 95,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 69, 2, 93),
              Color.fromARGB(255, 245, 103, 250),
            ],
          )),
      child: Center(
        child: Text(
          avatarlarimText,
          style: GoogleFonts.playfairDisplay(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
