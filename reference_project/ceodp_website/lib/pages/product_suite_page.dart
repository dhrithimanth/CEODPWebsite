import 'package:flutter/material.dart';
import '../sections/product_suite_section.dart';
import '../widgets/ceodp_footer.dart';

class ProductSuitePage extends StatelessWidget {
  const ProductSuitePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: const [ProductSuiteSection(), CeodpFooter()]),
    );
  }
}
