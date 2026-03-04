import 'package:flutter/material.dart';

// ─────────────────────────────────────────────
//  CampusConnect — Design Tokens
// ─────────────────────────────────────────────

class AppColors {
  AppColors._();

  // Primary palette — deep indigo + electric accent
  static const Color primary       = Color(0xFF1A1A2E); // Deep navy
  static const Color primaryLight  = Color(0xFF16213E); // Mid navy
  static const Color accent        = Color(0xFF00D4FF); // Electric cyan
  static const Color accentWarm    = Color(0xFFFF6B35); // Energetic orange
  static const Color accentGreen   = Color(0xFF00E096); // Match green

  // Surface & background
  static const Color background    = Color(0xFFF5F7FF); // Off-white blue tint
  static const Color surface       = Color(0xFFFFFFFF);
  static const Color surfaceCard   = Color(0xFFF0F2FF);

  // Text
  static const Color textPrimary   = Color(0xFF0D0D1A);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textMuted     = Color(0xFFADB5BD);
  static const Color textOnDark    = Color(0xFFFFFFFF);

  // Semantic
  static const Color redFlag       = Color(0xFFFF3B3B);
  static const Color greenFlag     = Color(0xFF00C851);
  static const Color warning       = Color(0xFFFFB800);
  static const Color divider       = Color(0xFFE8EAFF);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF1A1A2E), Color(0xFF0F3460)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFF00D4FF), Color(0xFF0099CC)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFF0F2FF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

// ─────────────────────────────────────────────
//  Typography
// ─────────────────────────────────────────────

class AppTextStyles {
  AppTextStyles._();

  // Using Google Fonts: Sora (display) + DM Sans (body)
  // Add to pubspec.yaml:
  //   google_fonts: ^6.1.0

  static const String _displayFont = 'Sora';
  static const String _bodyFont    = 'DM Sans';

  static const TextStyle displayLarge = TextStyle(
    fontFamily: _displayFont,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    color: AppColors.textPrimary,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: _displayFont,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
    color: AppColors.textPrimary,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: _displayFont,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.2,
    color: AppColors.textPrimary,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: _displayFont,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: _bodyFont,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: _bodyFont,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: _bodyFont,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );

  static const TextStyle labelLarge = TextStyle(
    fontFamily: _bodyFont,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    color: AppColors.textPrimary,
  );

  static const TextStyle buttonText = TextStyle(
    fontFamily: _bodyFont,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: _bodyFont,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    color: AppColors.textMuted,
  );
}

// ─────────────────────────────────────────────
//  Spacing & Radius
// ─────────────────────────────────────────────

class AppSpacing {
  AppSpacing._();

  static const double xs  = 4.0;
  static const double sm  = 8.0;
  static const double md  = 16.0;
  static const double lg  = 24.0;
  static const double xl  = 32.0;
  static const double xxl = 48.0;

  // Padding presets
  static const EdgeInsets screenPadding     = EdgeInsets.symmetric(horizontal: 20, vertical: 16);
  static const EdgeInsets cardPadding       = EdgeInsets.all(16);
  static const EdgeInsets buttonPadding     = EdgeInsets.symmetric(horizontal: 24, vertical: 14);
}

class AppRadius {
  AppRadius._();

  static const double sm   = 8.0;
  static const double md   = 12.0;
  static const double lg   = 16.0;
  static const double xl   = 24.0;
  static const double full = 100.0;

  static const BorderRadius cardRadius   = BorderRadius.all(Radius.circular(16));
  static const BorderRadius buttonRadius = BorderRadius.all(Radius.circular(12));
  static const BorderRadius chipRadius   = BorderRadius.all(Radius.circular(100));
}

// ─────────────────────────────────────────────
//  Shadows
// ─────────────────────────────────────────────

class AppShadows {
  AppShadows._();

  static const List<BoxShadow> card = [
    BoxShadow(
      color: Color(0x0F1A1A2E),
      blurRadius: 20,
      offset: Offset(0, 4),
    ),
    BoxShadow(
      color: Color(0x061A1A2E),
      blurRadius: 6,
      offset: Offset(0, 1),
    ),
  ];

  static const List<BoxShadow> elevated = [
    BoxShadow(
      color: Color(0x1A00D4FF),
      blurRadius: 24,
      offset: Offset(0, 8),
    ),
  ];

  static const List<BoxShadow> bottomNav = [
    BoxShadow(
      color: Color(0x141A1A2E),
      blurRadius: 20,
      offset: Offset(0, -4),
    ),
  ];
}

// ─────────────────────────────────────────────
//  Main ThemeData
// ─────────────────────────────────────────────

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        primary:   AppColors.primary,
        secondary: AppColors.accent,
        surface:   AppColors.surface,
        error:     AppColors.redFlag,
      ),

      // AppBar
      appBarTheme: const AppBarTheme(
        backgroundColor:  AppColors.background,
        foregroundColor:  AppColors.textPrimary,
        elevation:        0,
        scrolledUnderElevation: 0,
        centerTitle:      false,
        titleTextStyle:   AppTextStyles.headlineLarge,
      ),

      // Bottom Navigation Bar
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor:      AppColors.surface,
        selectedItemColor:    AppColors.primary,
        unselectedItemColor:  AppColors.textMuted,
        type:                 BottomNavigationBarType.fixed,
        elevation:            0,
        selectedLabelStyle:   TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          fontFamily: 'DM Sans',
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          fontFamily: 'DM Sans',
        ),
      ),

      // Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor:  AppColors.primary,
          foregroundColor:  AppColors.textOnDark,
          textStyle:        AppTextStyles.buttonText,
          padding:          AppSpacing.buttonPadding,
          shape: const RoundedRectangleBorder(
            borderRadius: AppRadius.buttonRadius,
          ),
          elevation: 0,
        ),
      ),

      // Outlined Button
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle:       AppTextStyles.buttonText,
          padding:         AppSpacing.buttonPadding,
          side: const BorderSide(color: AppColors.primary, width: 1.5),
          shape: const RoundedRectangleBorder(
            borderRadius: AppRadius.buttonRadius,
          ),
        ),
      ),

      // Text Button
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.accent,
          textStyle:       AppTextStyles.labelLarge,
        ),
      ),

      // Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        filled:      true,
        fillColor:   AppColors.surfaceCard,
        hintStyle:   AppTextStyles.bodyMedium,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: AppRadius.buttonRadius,
          borderSide:   BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.buttonRadius,
          borderSide:   const BorderSide(color: AppColors.divider, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.buttonRadius,
          borderSide:   const BorderSide(color: AppColors.accent, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadius.buttonRadius,
          borderSide:   const BorderSide(color: AppColors.redFlag, width: 1),
        ),
      ),

      // Card
      cardTheme: CardThemeData(
        color:        AppColors.surface,
        elevation:    0,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.cardRadius,
        ),
        margin: EdgeInsets.zero,
      ),

      // Chip
      chipTheme: ChipThemeData(
        backgroundColor:      AppColors.surfaceCard,
        selectedColor:        AppColors.primary,
        labelStyle:           AppTextStyles.bodySmall,
        padding:              const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.chipRadius,
        ),
        side: BorderSide.none,
      ),

      // Divider
      dividerTheme: const DividerThemeData(
        color:     AppColors.divider,
        thickness: 1,
        space:     1,
      ),

      fontFamily: 'DM Sans',
    );
  }
}