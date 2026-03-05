import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phferreira/ui/contact/widgets/cursor_widget.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    const terminalHeaderColor = Color(0xFF353535);
    const terminalHeaderTextColor = Color(0xFFEEEEEC);
    const terminalBodyColor = Color(0xFF241F31);
    const terminalLineNumberColor = Colors.white38;
    const terminalLineTextColor = Colors.white70;
    const cursorColor = Colors.white60;

    final terminalMenuStyle = GoogleFonts.notoSansMono(
      color: terminalHeaderTextColor,
      fontWeight: FontWeight.w100,
      fontSize: 12,
    );

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
              color: terminalHeaderColor,
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
                color: terminalHeaderColor,
                padding: const EdgeInsets.only(left: 4, right: 4, bottom: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.terminal,
                          color: terminalHeaderTextColor,
                        ),
                        Expanded(
                          child: Text(
                            'Terminal - paulo@Paulo-PC:~/projects/flutter/phferreira',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: terminalMenuStyle,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_drop_up_outlined,
                                color: terminalHeaderTextColor,
                                size: 14,
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.minimize_rounded,
                                color: terminalHeaderTextColor,
                                size: 12,
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.square_outlined,
                                color: terminalHeaderTextColor,
                                size: 12,
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.close,
                                color: terminalHeaderTextColor,
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
                        Text('File', style: terminalMenuStyle),
                        const SizedBox(width: 10),
                        Text('Edit', style: terminalMenuStyle),
                        const SizedBox(width: 10),
                        Text('View', style: terminalMenuStyle),
                        const SizedBox(width: 10),
                        Text('Terminal', style: terminalMenuStyle),
                        const SizedBox(width: 10),
                        Text('Tabs', style: terminalMenuStyle),
                        const SizedBox(width: 10),
                        Text('Help', style: terminalMenuStyle),
                      ],
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: ColoredBox(
                  color: terminalBodyColor,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text.rich(
                            TextSpan(
                              text: '  1 ',
                              style: TextStyle(
                                color: terminalLineNumberColor,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Hello there!',
                                  style: TextStyle(
                                    color: terminalLineTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CursorWidget(
                            color: cursorColor,
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
