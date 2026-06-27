import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/you_may_like_list_view.dart';
import 'package:flutter/material.dart';

class YouMayLikeSection extends StatelessWidget {
  const YouMayLikeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('You may also like', style: Styles.textStyle16),
        SizedBox(height: 10),
        YouMayLikeListView(),
      ],
    );
  }
}
