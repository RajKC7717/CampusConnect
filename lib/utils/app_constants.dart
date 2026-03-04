// ─────────────────────────────────────────────
//  CampusConnect — App Constants
// ─────────────────────────────────────────────

class AppRoutes {
  AppRoutes._();

  static const String splash      = '/';
  static const String onboarding  = '/onboarding';
  static const String login       = '/login';
  static const String home        = '/home';
  static const String roommate    = '/roommate';
  static const String brolx       = '/brolx';
  static const String archives    = '/archives';
}

class AppStrings {
  AppStrings._();

  // App
  static const String appName         = 'CampusConnect';
  static const String appTagline      = 'Your campus, connected.';
  static const String emailDomain     = '@college.edu.in';
  static const String emailHint       = 'your.name@college.edu.in';

  // Onboarding
  static const List<Map<String, String>> onboardingData = [
    {
      'emoji': '🏠',
      'title': 'Find Your\nPerfect Roommate',
      'subtitle': 'Swipe through verified student profiles and find a flatmate who matches your vibe — not just your budget.',
    },
    {
      'emoji': '🛒',
      'title': 'Buy & Sell\nWithin Campus',
      'subtitle': 'From drafters to induction cooktops — trade essentials with fellow students on BroLX.',
    },
    {
      'emoji': '📚',
      'title': 'Never Miss\nStudy Material',
      'subtitle': 'Access PYQs, handwritten notes, and assignment templates shared by your seniors.',
    },
  ];

  // Bottom Nav
  static const String navRoommate  = 'Roommate';
  static const String navBrolx     = 'BroLX';
  static const String navArchives  = 'Archives';
  static const String navProfile   = 'Profile';

  // Feature names
  static const String roommateTitle  = 'Roommate\nMatchmaker';
  static const String brolxTitle     = 'BroLX';
  static const String archivesTitle  = 'The Archives';
}

class AppAssets {
  AppAssets._();

  // Placeholder — replace with real asset paths
  static const String logo           = 'assets/images/logo.png';
  static const String onboarding1    = 'assets/images/onboarding_1.png';
  static const String onboarding2    = 'assets/images/onboarding_2.png';
  static const String onboarding3    = 'assets/images/onboarding_3.png';
  static const String avatarDefault  = 'assets/images/avatar_default.png';
}