import 'package:flutter/material.dart';
import 'package:phferreira/ui/about/widgets/social_media_widget.dart';
import 'package:phferreira/ui/about/widgets/word_animation_widget.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(24),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 13,
            child: WordAnimationWidget(),
          ),
          Expanded(
            flex: 1,
            child: SocialMediaWidget(),
          ),
        ],
      ),
    );
  }
}
