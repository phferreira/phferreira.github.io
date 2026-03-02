// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'dart:html' as html;

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 700,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              html.window.open('https://github.com/phferreira', 'github');
            },
            icon: Image.asset(
              'assets/images/icons/github_logo_256_black.png',
              filterQuality: FilterQuality.medium,
            ),
            tooltip: 'GitHub',
            iconSize: 32,
          ),
          IconButton(
            onPressed: () {
              html.window.open('https://www.linkedin.com/in/paulo-henrique-ferreira', 'linkedin');
            },
            icon: Image.asset(
              'assets/images/icons/linkedin_logo_256_black.png',
              filterQuality: FilterQuality.medium,
            ),
            tooltip: 'LinkedIn',
            iconSize: 32,
          ),
          IconButton(
            onPressed: () {
              html.window.open('https://www.facebook.com/p.h.ferreirah', 'facebook');
            },
            icon: Image.asset(
              'assets/images/icons/facebook_logo_256_black.png',
              filterQuality: FilterQuality.medium,
            ),
            tooltip: 'Facebook',
            iconSize: 32,
          ),
          IconButton(
            onPressed: () {
              html.window.open('https://discordapp.com/users/714523467235459173', 'discord');
            },
            icon: Image.asset(
              'assets/images/icons/discord_logo_256_black.png',
              filterQuality: FilterQuality.medium,
            ),
            tooltip: 'Discord',
            iconSize: 32,
          ),
        ],
      ),
    );
  }
}
