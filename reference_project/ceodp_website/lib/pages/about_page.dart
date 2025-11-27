import 'package:flutter/material.dart';
import '../sections/about_section.dart';
import '../widgets/ceodp_footer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: const [AboutSection(), CeodpFooter()]),
    );
  }
}
