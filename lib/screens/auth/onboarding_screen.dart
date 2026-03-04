import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  late AnimationController _slideController;
  late Animation<Offset> _slideAnim;
  late Animation<double> _fadeAnim;

  static const _pages = [
    _OnboardingData(
      emoji: '🏠',
      accentColor: Color(0xFF00D4FF),
      title: 'Find Your\nPerfect Roommate',
      subtitle:
      'Swipe through verified student profiles. Match on lifestyle, not just location — no brokers, no luck.',
      bgDeco: Color(0xFF001F3F),
    ),
    _OnboardingData(
      emoji: '🛒',
      accentColor: Color(0xFFFF6B35),
      title: 'Buy & Sell\nWithin Campus',
      subtitle:
      'From engineering drafters to induction cooktops — trade with fellow students you can actually trust.',
      bgDeco: Color(0xFF1F0A00),
    ),
    _OnboardingData(
      emoji: '📚',
      accentColor: Color(0xFF00E096),
      title: 'Never Hunt for\nStudy Material',
      subtitle:
      'PYQs, handwritten notes, DBMS assignments — all in one vault, shared by seniors who\'ve been there.',
      bgDeco: Color(0xFF001A0F),
    ),
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));

    _fadeAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _slideController, curve: Curves.easeOut),
    );

    _slideController.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() => _currentPage = index);
    _slideController.reset();
    _slideController.forward();
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final page = _pages[_currentPage];
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      body: Stack(
        children: [
          // ── Animated background blob ──
          AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0.6, -0.5),
                radius: 1.2,
                colors: [
                  page.bgDeco.withValues(alpha: 0.8),
                  const Color(0xFF0D0D1A),
                ],
              ),
            ),
          ),

          // ── Dot grid ──
          Positioned.fill(
            child: CustomPaint(painter: _DotGridPainter()),
          ),

          // ── Page content ──
          Column(
            children: [
              // Skip button
              SafeArea(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, top: 8),
                    child: TextButton(
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, '/login'),
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 14,
                          color: Color(0xFF8896AB),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // PageView
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: _pages.length,
                  itemBuilder: (_, index) {
                    final p = _pages[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Emoji in a styled container
                          AnimatedBuilder(
                            animation: _slideController,
                            builder: (_, child) => FadeTransition(
                              opacity: _fadeAnim,
                              child: SlideTransition(
                                position: _slideAnim,
                                child: child,
                              ),
                            ),
                            child: Container(
                              width: 96,
                              height: 96,
                              decoration: BoxDecoration(
                                color: p.accentColor.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(28),
                                border: Border.all(
                                  color: p.accentColor.withValues(alpha: 0.25),
                                  width: 1.5,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  p.emoji,
                                  style: const TextStyle(fontSize: 44),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 36),

                          // Title
                          AnimatedBuilder(
                            animation: _slideController,
                            builder: (_, child) => FadeTransition(
                              opacity: _fadeAnim,
                              child: SlideTransition(
                                position: _slideAnim,
                                child: child,
                              ),
                            ),
                            child: Text(
                              p.title,
                              style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 34,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                letterSpacing: -0.8,
                                height: 1.15,
                                shadows: [
                                  Shadow(
                                    color: p.accentColor.withValues(alpha: 0.3),
                                    blurRadius: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Subtitle
                          AnimatedBuilder(
                            animation: _slideController,
                            builder: (_, child) => FadeTransition(
                              opacity: _fadeAnim,
                              child: child,
                            ),
                            child: Text(
                              p.subtitle,
                              style: const TextStyle(
                                fontFamily: 'DM Sans',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF8896AB),
                                height: 1.65,
                              ),
                            ),
                          ),

                          const SizedBox(height: 40),

                          // Accent line
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 600),
                            width: 48,
                            height: 3,
                            decoration: BoxDecoration(
                              color: p.accentColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // ── Bottom section ──
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 48),
                child: Column(
                  children: [
                    // Dot indicators
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(_pages.length, (index) {
                        final isActive = index == _currentPage;
                        final accent = _pages[_currentPage].accentColor;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: isActive ? 24 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: isActive
                                ? accent
                                : const Color(0xFF2A2A40),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        );
                      }),
                    ),

                    const SizedBox(height: 32),

                    // Next / Get Started button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              _pages[_currentPage].accentColor,
                              _pages[_currentPage].accentColor.withValues(alpha: 0.7),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: _pages[_currentPage].accentColor
                                  .withValues(alpha: 0.35),
                              blurRadius: 20,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: _nextPage,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _currentPage == _pages.length - 1
                                    ? 'Get Started'
                                    : 'Continue',
                                style: const TextStyle(
                                  fontFamily: 'DM Sans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  letterSpacing: 0.2,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Data model for onboarding pages ──
class _OnboardingData {
  final String emoji;
  final Color accentColor;
  final String title;
  final String subtitle;
  final Color bgDeco;

  const _OnboardingData({
    required this.emoji,
    required this.accentColor,
    required this.title,
    required this.subtitle,
    required this.bgDeco,
  });
}

// ── Dot grid background painter ──
class _DotGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF00D4FF).withValues(alpha: 0.04)
      ..style = PaintingStyle.fill;

    const spacing = 28.0;
    const radius = 1.5;

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DotGridPainter oldDelegate) => false;
}