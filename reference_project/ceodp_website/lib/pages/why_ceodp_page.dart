import 'package:flutter/material.dart';
import '../sections/why_ceodp_section.dart';
import '../widgets/ceodp_footer.dart';

class WhyCeodpPage extends StatelessWidget {
  const WhyCeodpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: const [WhyCeodpSection(), CeodpFooter()]),
    );
  }
}
