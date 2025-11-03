import 'package:flutter/material.dart';

class PickupPage extends StatelessWidget {
  const PickupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            '取件',
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
                  Icons.local_shipping_outlined,
                  size: 60,
                  color: Color(0xFF3F7BF2),
                ),
                const SizedBox(height: 16),
                const Text(
                  '取件页面',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '管理和查看取件信息',
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
