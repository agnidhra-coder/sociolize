import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


/// Implements how each post tile is viewed in the list
class PostTile extends StatelessWidget {
  final String id;
  final String title;
  final String body;
  final bool isLastItem; // to keep track whether to show Divider or not
  const PostTile({super.key, required this.title, required this.body, required this.isLastItem, required this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, right: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 37, 39, 68)
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 230, 230, 230),
                fontSize: 18
              )
            ),
            SizedBox(height: 6,),
            Text(
              body,
              style: GoogleFonts.inter(
                color: Color.fromARGB(255, 160, 160, 160)
              ),
            ),
            SizedBox(height: 6,),
            // check if the item to be shown is the last one, if yes then do not show Divider, else show it
            // if(!isLastItem)
            //   Divider(
            //     color: const Color.fromARGB(255, 163, 163, 163),
            //   )
            
          ],
        ),
      ),
    );
  }
}