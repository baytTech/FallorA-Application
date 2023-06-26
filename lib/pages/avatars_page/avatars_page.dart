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
      body: Column(
        children: [
          _avatarlarimTextContainer(),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('Öğe $index'),
                  ),
                );
              },
            ),
          ),
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
    var avatarlarimText = "avatarlarim";
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Text(
        avatarlarimText,
        style: GoogleFonts.playfairDisplay(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
