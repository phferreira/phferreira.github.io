import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phferreira/ui/contact/widgets/cursor_widget.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(25),
        child: Container(
          height: 700,
          width: 700,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFF353535),
              width: 5,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(6),
              topRight: Radius.circular(6),
              bottomLeft: Radius.circular(3),
              bottomRight: Radius.circular(3),
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 44,
                color: const Color(0xFF353535),
                padding: const EdgeInsets.only(left: 4, right: 4, bottom: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.terminal,
                          color: Color(0xFFEEEEEC),
                        ),
                        Expanded(
                          child: Text(
                            'Terminal - paulo@Paulo-PC:~/projects/flutter/phferreira',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSansMono(
                              color: const Color(0xFFEEEEEC),
                              fontWeight: FontWeight.w100,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.arrow_drop_up_outlined,
                                color: Color(0xFFEEEEEC),
                                size: 14,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.minimize_rounded,
                                color: Color(0xFFEEEEEC),
                                size: 12,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.square_outlined,
                                color: Color(0xFFEEEEEC),
                                size: 12,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.close,
                                color: Color(0xFFEEEEEC),
                                size: 12,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'File',
                          style: GoogleFonts.notoSansMono(
                            color: const Color(0xFFEEEEEC),
                            fontWeight: FontWeight.w100,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Edit',
                          style: GoogleFonts.notoSansMono(
                            color: const Color(0xFFEEEEEC),
                            fontWeight: FontWeight.w100,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'View',
                          style: GoogleFonts.notoSansMono(
                            color: const Color(0xFFEEEEEC),
                            fontWeight: FontWeight.w100,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          style: GoogleFonts.notoSansMono(
                            color: const Color(0xFFEEEEEC),
                            fontWeight: FontWeight.w100,
                            fontSize: 12,
                          ),
                          'Terminal',
                        ),
                        const SizedBox(width: 10),
                        Text(
                          style: GoogleFonts.notoSansMono(
                            color: const Color(0xFFEEEEEC),
                            fontWeight: FontWeight.w100,
                            fontSize: 12,
                          ),
                          'Tabs',
                        ),
                        const SizedBox(width: 10),
                        Text(
                          style: GoogleFonts.notoSansMono(
                            color: const Color(0xFFEEEEEC),
                            fontWeight: FontWeight.w100,
                            fontSize: 12,
                          ),
                          'Help',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topLeft,
                  color: const Color(0xFF241F31),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text.rich(
                            TextSpan(
                              text: '  1 ',
                              style: TextStyle(
                                color: Colors.white38,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Hello there!',
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CursorWidget(
                            color: Colors.white60,
                            size: 12,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
