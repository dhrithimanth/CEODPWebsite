import 'package:flutter/material.dart';
import '../sections/architecture_section.dart';
import '../widgets/ceodp_footer.dart';

class ArchitecturePage extends StatelessWidget {
  const ArchitecturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: const [ArchitectureSection(), CeodpFooter()]),
    );
  }
}
