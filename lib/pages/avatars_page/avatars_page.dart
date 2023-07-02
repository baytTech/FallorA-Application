import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../backend/auth/auth.manager.dart';
import '../../injection.dart';
import '../../widgets/appbar/FalloraAppBar.dart';

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
          colors: [Color(0xFF31113B), Color(0xFF258195)],
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            width: 150, child: Image.network("https://picsum.photos/200/300")),
        InkWell(
          onTap: () {},
          child: Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  color: Color.fromARGB(255, 114, 37, 122)),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(buttonText),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("5*"),
                )
              ])),
        ),
        SizedBox(height: 40)
      ],
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
      height: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 35, 9, 34),
              Color.fromARGB(255, 181, 42, 185),
            ],
          )),
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Center(
          child: Text(
            avatarlarimText,
            style: GoogleFonts.playfairDisplay(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }
}
