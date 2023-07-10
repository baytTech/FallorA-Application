import 'package:fallora/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationListTile extends StatelessWidget {

final String title;
final String date;
final String description;


  const NotificationListTile({super.key, required this.title, required this. description, required this.date});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).go("/tarotResults");
      },
      child: GlassContainer(
        margin: EdgeInsetsDirectional.symmetric(horizontal: 8,vertical: 10),
        width: double.infinity,
        height: 100,
        borderRadius: BorderRadius.circular(12),
        blur: 20,
        alignment: Alignment.center,
        borderColor: Colors.white10,
        gradient: LinearGradient(
          colors: [Color(0xFFffffff).withOpacity(0.2), Color(0xFFffffff).withOpacity(0.1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsetsDirectional.all(5),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    title ??
                    "Kahve Falınız Hazır!",
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Spacer(),
                  Text(
                    date ??
                    'Mar 8, 2022',
                    style: GoogleFonts.outfit(
                      color: Color(0xFFB8B8B8),
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(bottom: 10,start: 8),
              child: Text(
                description ??
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into",
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  color: Color(0xFFB8B8B8),
                  fontSize: 13.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
