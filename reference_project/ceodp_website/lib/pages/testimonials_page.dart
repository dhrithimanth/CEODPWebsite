import 'package:flutter/material.dart';
import '../sections/testimonials_section.dart';
import '../widgets/ceodp_footer.dart';

class TestimonialsPage extends StatelessWidget {
  const TestimonialsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: const [TestimonialsSection(), CeodpFooter()]),
    );
  }
}
