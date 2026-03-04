import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_screen.dart';
import '../roommate/roommate_screen.dart';
import '../brolx/brolx_screen.dart';
import '../archives/archives_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> with TickerProviderStateMixin {
  int _currentIndex = 0;

  // Keep all screens alive when switching tabs
  final List<Widget> _screens = const [
    HomeScreen(),
    RoommateScreen(),
    BrolxScreen(),
    ArchivesScreen(),
  ];

  late List<AnimationController> _iconControllers;
  late List<Animation<double>> _iconScales;

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    // One bounce controller per tab
    _iconControllers = List.generate(
      4,
          (_) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
      ),
    );

    _iconScales = _iconControllers
        .map(
          (c) => TweenSequence<double>([
        TweenSequenceItem(
            tween: Tween(begin: 1.0, end: 1.25)
                .chain(CurveTween(curve: Curves.easeOut)),
            weight: 40),
        TweenSequenceItem(
            tween: Tween(begin: 1.25, end: 1.0)
                .chain(CurveTween(curve: Curves.elasticOut)),
            weight: 60),
      ]).animate(c),
    )
        .toList();

    // Trigger initial animation for tab 0
    _iconControllers[0].forward();
  }

  @override
  void dispose() {
    for (final c in _iconControllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _onTabTapped(int index) {
    if (index == _currentIndex) return;
    setState(() => _currentIndex = index);
    _iconControllers[index].reset();
    _iconControllers[index].forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),

      // ── Indexed Stack keeps screens alive ──
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),

      // ── Custom Bottom Nav ──
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1A2E).withOpacity(0.08),
            blurRadius: 24,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            children: [
              _NavItem(
                index: 0,
                currentIndex: _currentIndex,
                icon: Icons.home_rounded,
                activeIcon: Icons.home_rounded,
                label: 'Home',
                accentColor: const Color(0xFF1A1A2E),
                scaleAnim: _iconScales[0],
                onTap: () => _onTabTapped(0),
              ),
              _NavItem(
                index: 1,
                currentIndex: _currentIndex,
                icon: Icons.people_outline_rounded,
                activeIcon: Icons.people_rounded,
                label: 'Roommate',
                accentColor: const Color(0xFF00D4FF),
                scaleAnim: _iconScales[1],
                onTap: () => _onTabTapped(1),
              ),
              _NavItem(
                index: 2,
                currentIndex: _currentIndex,
                icon: Icons.storefront_outlined,
                activeIcon: Icons.storefront_rounded,
                label: 'BroLX',
                accentColor: const Color(0xFFFF6B35),
                scaleAnim: _iconScales[2],
                onTap: () => _onTabTapped(2),
              ),
              _NavItem(
                index: 3,
                currentIndex: _currentIndex,
                icon: Icons.folder_outlined,
                activeIcon: Icons.folder_rounded,
                label: 'Archives',
                accentColor: const Color(0xFF00E096),
                scaleAnim: _iconScales[3],
                onTap: () => _onTabTapped(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Individual Nav Item ──
class _NavItem extends StatelessWidget {
  final int index;
  final int currentIndex;
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final Color accentColor;
  final Animation<double> scaleAnim;
  final VoidCallback onTap;

  const _NavItem({
    required this.index,
    required this.currentIndex,
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.accentColor,
    required this.scaleAnim,
    required this.onTap,
  });

  bool get _isActive => index == currentIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedBuilder(
          animation: scaleAnim,
          builder: (_, child) => Transform.scale(
            scale: _isActive ? scaleAnim.value : 1.0,
            child: child,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon container
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: _isActive
                      ? accentColor.withOpacity(0.12)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  _isActive ? activeIcon : icon,
                  size: 22,
                  color: _isActive ? accentColor : const Color(0xFFADB5BD),
                ),
              ),

              const SizedBox(height: 3),

              // Label
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontFamily: 'DM Sans',
                  fontSize: 10,
                  fontWeight:
                  _isActive ? FontWeight.w600 : FontWeight.w400,
                  color: _isActive ? accentColor : const Color(0xFFADB5BD),
                ),
                child: Text(label),
              ),
            ],
          ),
        ),
      ),
    );
  }
}