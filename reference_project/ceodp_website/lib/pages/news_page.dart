import 'package:flutter/material.dart';
import '../sections/news_section.dart';
import '../widgets/ceodp_footer.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: const [NewsSection(), CeodpFooter()]),
    );
  }
}
