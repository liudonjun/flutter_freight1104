# Bottom Navigation Bar Implementation

This document describes the implementation of the bottom navigation bar with 5 associated pages based on the Figma design.

## Overview

The application now features a custom bottom navigation bar with 5 tabs:

1. **取件 (Pickup)** - Manage pickup information
2. **驻站 (Station)** - View station information
3. **寄件 (Send)** - Create and manage shipping orders
4. **查件 (Search)** - Track and query packages
5. **我的 (Me)** - Personal information and settings

## Project Structure

```
lib/pages/main/
├── controller.dart              # State management controller
├── view.dart                    # Main page with bottom nav
├── index.dart                   # Exports
└── widgets/
    ├── custom_bottom_nav_bar.dart   # Custom bottom navigation bar
    ├── pickup_page.dart             # Pickup tab page
    ├── station_page.dart            # Station tab page
    ├── send_page.dart               # Send tab page
    ├── search_page.dart             # Search tab page
    └── me_page.dart                 # Me tab page

assets/icons/nav/
├── pickup.svg       # Pickup icon
├── station.svg      # Station icon
├── send.svg         # Send icon
├── search.svg       # Search icon
└── me.svg           # Me icon
```

## Files Modified/Created

### 1. **lib/pages/main/controller.dart**

Enhanced with navigation state management:

- `selectedTabIndex`: RxInt observable tracking current tab
- `tabTitles`: List of tab labels in Chinese
- `tabIcons`: List of SVG icon paths
- `onTabTapped(int index)`: Method to handle tab selection

### 2. **lib/pages/main/view.dart**

Main page with integrated bottom navigation:

- Removed old AppBar
- Added `_buildPageContent()` method to render appropriate page based on selected tab
- Integrated `CustomBottomNavBar` as persistent bottom navigation
- Uses GetBuilder pattern for reactive updates

### 3. **lib/pages/main/widgets/custom_bottom_nav_bar.dart**

Custom bottom navigation bar component:

- Displays 5 navigation items
- Shows icon and label for each tab
- Active/inactive color differentiation
- Blue (#3F7BF2) for active, dark gray (#333333) for inactive
- Uses SVG icons with dynamic color filtering
- Matches Figma design specifications

### 4. **lib/pages/main/widgets/[tab_name]\_page.dart**

Five page widgets (PickupPage, StationPage, SendPage, SearchPage, MePage):

- Each implements similar structure with SliverAppBar and content
- Contains appropriate icon and placeholder content
- Ready for further development
- Uses Chinese labels and descriptions

### 5. **assets/icons/nav/[icon_name].svg**

Five SVG icon files:

- pickup.svg - Truck/delivery icon
- station.svg - Store/building icon
- send.svg - Send/arrow icon
- search.svg - Search/magnifying glass icon
- me.svg - Profile/person icon

All icons use `currentColor` for dynamic coloring via ColorFilter.

## Key Features

### Color Scheme

- **Primary Blue**: #3F7BF2 (Active state)
- **Dark Gray**: #333333 (Inactive state)
- **White**: #FFFFFF (Background)
- **Light Gray**: #F8F8F8 (Secondary background)

### Typography

- **Tab Label**: PingFang SC, 500 weight, 10pt
- **Page Title**: 18pt, 600 weight
- **Page Subtitle**: 14pt, normal weight

### Navigation Behavior

- Smooth tab switching with GetX reactive updates
- Page content changes immediately on tab tap
- Bottom navigation persists across all pages
- Each page has its own AppBar (optional for customization)

## State Management

The implementation uses GetX for state management:

```dart
// In MainController
final RxInt selectedTabIndex = 0.obs;

void onTabTapped(int index) {
  selectedTabIndex.value = index;
  update(["main"]);
}
```

The `GetBuilder` in the view rebuilds only when:

- A specific tab is tapped
- The controller calls `update(["main"])`

## Usage

To navigate between tabs, simply tap on any tab in the bottom navigation bar. The page content will immediately switch to the corresponding tab page.

### Example Extension

To add additional functionality to a page, modify the respective page widget:

```dart
class PickupPage extends StatelessWidget {
  // Add your custom widgets and logic here
}
```

## Assets Configuration

The `pubspec.yaml` is pre-configured to include the icon assets:

```yaml
flutter:
  assets:
    - assets/images/
    - assets/icons/nav/
```

## Design Specifications (from Figma)

- **Frame Size**: 375×228px (bottom navigation area)
- **Navigation Bar Height**: ~70px (including safe area)
- **Icon Size**: 24×24px
- **Label Text Size**: 10pt
- **Shadow**: 0px -1px 14px rgba(0, 0, 0, 0.04)
- **Safe Area**: Includes bottom safe area for notched devices

## Future Enhancements

1. **Lazy Loading**: Implement lazy loading for page content
2. **Animations**: Add page transition animations
3. **Bottom Sheet Navigation**: Add floating action buttons
4. **Deep Linking**: Support deep linking to specific tabs
5. **Page State Preservation**: Maintain scroll position when switching tabs
6. **Badges**: Add notification badges to tabs (e.g., unread count)

## Testing

To test the implementation:

1. Run the application: `flutter run`
2. Verify each tab can be accessed
3. Confirm page content changes appropriately
4. Check that icons display with correct colors
5. Validate that bottom navigation appears on all pages

## Notes

- The icon files use Material Design icons as templates
- Colors use Flutter Color hex format
- All widgets follow Flutter Material Design guidelines
- GetX reactive programming ensures efficient rebuilds
- SafeArea is properly handled for notched devices
