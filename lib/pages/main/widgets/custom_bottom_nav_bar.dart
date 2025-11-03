import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  final List<String> labels;
  final List<String> icons;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    required this.labels,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    // Figma specs:
    // - Frame: 375x228px total
    // - Navigation area: 375x103px (excluding Home Indicator 34px)
    // - Nav bar content: 70px height with 16px padding bottom
    // - Center circle: 26x26px at Y=17 (raised position)

    return SafeArea(
      top: false,
      child: Container(
        width: double.infinity,
        height: 103,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF8F8F8), Color(0xFFF6F6F6)],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              offset: const Offset(0, -1),
              blurRadius: 14,
            ),
          ],
        ),
        child: Stack(
          children: [
            // Background bottom bar (70px)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 70,
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Tab 0: 取件 (22px from left)
                    _buildTabItem(0),
                    // Tab 1: 驻站 (around 100px from left)
                    _buildTabItem(1),
                    // Empty space for center button with label (Tab 2: 查件)
                    _buildCenterButtonLabel(),
                    // Tab 3: 寄件 (around 250px from left)
                    _buildTabItem(3),
                    // Tab 4: 我的 (around 325px from left)
                    _buildTabItem(4),
                  ],
                ),
              ),
            ),
            // Center raised circle only (at Y=12)
            Positioned(
              top: 12,
              left: 0,
              right: 0,
              child: Center(
                child: GestureDetector(
                  onTap: () => onTap(2),
                  child: _buildCenterCircle(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build individual tab item
  Widget _buildTabItem(int index) {
    final isSelected = selectedIndex == index;
    final activeColor = const Color(0xFF3F7BF2);
    final inactiveColor = const Color(0xFF333333);
    final itemColor = isSelected ? activeColor : inactiveColor;

    return GestureDetector(
      onTap: () => onTap(index),
      child: SizedBox(
        width: 60,
        height: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon (24x24)
            SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                icons[index],
                colorFilter: ColorFilter.mode(itemColor, BlendMode.srcIn),
              ),
            ),
            const SizedBox(height: 4),
            // Label (10pt)
            Text(
              labels[index],
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                fontFamily: 'PingFang SC',
                color: itemColor,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build center button label (for the bottom nav row)
  Widget _buildCenterButtonLabel() {
    final isSelected = selectedIndex == 2;
    final activeColor = const Color(0xFF3F7BF2);
    final inactiveColor = const Color(0xFF333333);
    final itemColor = isSelected ? activeColor : inactiveColor;

    return GestureDetector(
      onTap: () => onTap(2),
      child: SizedBox(
        width: 60,
        height: 45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Label (10pt)
            Text(
              labels[2],
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                fontFamily: 'PingFang SC',
                color: itemColor,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build center raised circle only
  Widget _buildCenterCircle() {
    final isSelected = selectedIndex == 2;
    final backgroundColor =
        isSelected ? const Color(0xFF3F7BF2) : const Color(0xFF999999);

    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: backgroundColor.withOpacity(0.3),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Center(
        child: SizedBox(
          width: 28,
          height: 28,
          child: SvgPicture.asset(
            icons[2],
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
