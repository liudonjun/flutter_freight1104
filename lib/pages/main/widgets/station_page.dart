import 'package:flutter/material.dart';

class StationPage extends StatelessWidget {
  const StationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            '驻站',
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        SliverFillRemaining(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.store_outlined,
                  size: 60,
                  color: Color(0xFF3F7BF2),
                ),
                const SizedBox(height: 16),
                const Text(
                  '驻站页面',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '查看驻站点信息',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
