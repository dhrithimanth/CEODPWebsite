import 'package:flutter/material.dart';
import '../sections/contact_section.dart';
import '../widgets/ceodp_footer.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: const [ContactSection(), CeodpFooter()]),
    );
  }
}
