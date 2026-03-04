import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      body: CustomScrollView(
        slivers: [
          // ── Sticky Header ──
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0D0D1A), Color(0xFF0F3460)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top row — greeting + avatar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Good morning 👋',
                                style: TextStyle(
                                  fontFamily: 'DM Sans',
                                  fontSize: 13,
                                  color: Color(0xFF8896AB),
                                ),
                              ),
                              const SizedBox(height: 2),
                              const Text(
                                'Arjun Sharma',
                                style: TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  letterSpacing: -0.3,
                                ),
                              ),
                            ],
                          ),
                          // Avatar
                          Stack(
                            children: [
                              Container(
                                width: 46,
                                height: 46,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  gradient: const LinearGradient(
                                    colors: [Color(0xFF00D4FF), Color(0xFF0099CC)],
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'AS',
                                    style: TextStyle(
                                      fontFamily: 'Sora',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF00E096),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: const Color(0xFF0D0D1A), width: 2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Verified pill
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF00E096).withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: const Color(0xFF00E096).withValues(alpha: 0.3)),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.verified_rounded,
                                size: 13, color: Color(0xFF00C851)),
                            SizedBox(width: 5),
                            Text(
                              'Verified · VIIT Engineering · 3rd Year',
                              style: TextStyle(
                                fontFamily: 'DM Sans',
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF00C851),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ── Body content ──
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 100),
            sliver: SliverList(
              delegate: SliverChildListDelegate([

                // Section: Quick Actions
                const _SectionHeader(title: 'Quick Actions'),
                const SizedBox(height: 14),
                Row(
                  children: [
                    _QuickActionCard(
                      emoji: '🏠',
                      label: 'Find\nRoommate',
                      accent: const Color(0xFF00D4FF),
                      onTap: () {},
                    ),
                    const SizedBox(width: 12),
                    _QuickActionCard(
                      emoji: '🛒',
                      label: 'Browse\nBroLX',
                      accent: const Color(0xFFFF6B35),
                      onTap: () {},
                    ),
                    const SizedBox(width: 12),
                    _QuickActionCard(
                      emoji: '📚',
                      label: 'The\nArchives',
                      accent: const Color(0xFF00E096),
                      onTap: () {},
                    ),
                    const SizedBox(width: 12),
                    _QuickActionCard(
                      emoji: '👤',
                      label: 'My\nProfile',
                      accent: const Color(0xFFFFB800),
                      onTap: () {},
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                // Section: Activity Banner — Roommate
                const _SectionHeader(title: 'Roommate Matchmaker'),
                const SizedBox(height: 14),
                _FeatureBannerCard(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0D0D1A), Color(0xFF0F3460)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  accentColor: const Color(0xFF00D4FF),
                  emoji: '🏠',
                  title: '3 new matches\nwaiting for you',
                  subtitle: 'Swipe to find your perfect flatmate',
                  badgeText: 'NEW',
                  onTap: () {},
                ),

                const SizedBox(height: 16),

                // Section: BroLX listings preview
                const _SectionHeader(title: 'BroLX — Recent Listings'),
                const SizedBox(height: 14),
                SizedBox(
                  height: 160,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    children: const [
                      _BrolxPreviewCard(
                        emoji: '📐',
                        title: 'Engineering Drafter',
                        price: '₹180',
                        condition: 'Good',
                        conditionColor: Color(0xFF00C851),
                      ),
                      SizedBox(width: 12),
                      _BrolxPreviewCard(
                        emoji: '💡',
                        title: 'Study Lamp',
                        price: '₹250',
                        condition: 'Like New',
                        conditionColor: Color(0xFF00D4FF),
                      ),
                      SizedBox(width: 12),
                      _BrolxPreviewCard(
                        emoji: '🔌',
                        title: 'Induction Cooktop',
                        price: '₹50/hr',
                        condition: 'Rental',
                        conditionColor: Color(0xFFFFB800),
                      ),
                      SizedBox(width: 12),
                      _BrolxPreviewCard(
                        emoji: '🖥️',
                        title: 'Arduino Mega Kit',
                        price: '₹400',
                        condition: 'Used',
                        conditionColor: Color(0xFFFF6B35),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                // Section: Archives CTA
                const _SectionHeader(title: 'The Archives'),
                const SizedBox(height: 14),
                _FeatureBannerCard(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00291A), Color(0xFF004D33)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  accentColor: const Color(0xFF00E096),
                  emoji: '📚',
                  title: 'DBMS PYQs just\nuploaded by seniors',
                  subtitle: '12 new files in the last 24 hours',
                  badgeText: 'HOT',
                  onTap: () {},
                ),

                const SizedBox(height: 28),

                // Recent activity
                const _SectionHeader(title: 'Recent Activity'),
                const SizedBox(height: 14),
                const _ActivityItem(
                  icon: Icons.swap_horiz_rounded,
                  iconColor: Color(0xFF00D4FF),
                  title: 'You matched with Rahul M.',
                  subtitle: '2 hours ago · Roommate',
                ),
                const SizedBox(height: 10),
                const _ActivityItem(
                  icon: Icons.upload_file_rounded,
                  iconColor: Color(0xFF00E096),
                  title: 'OOPS Notes uploaded',
                  subtitle: 'Yesterday · Archives',
                ),
                const SizedBox(height: 10),
                const _ActivityItem(
                  icon: Icons.storefront_rounded,
                  iconColor: Color(0xFFFF6B35),
                  title: 'Your drafter listing got 4 views',
                  subtitle: '2 days ago · BroLX',
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Section Header ──
class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Sora',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0D0D1A),
            letterSpacing: -0.2,
          ),
        ),
        Text(
          'See all',
          style: TextStyle(
            fontFamily: 'DM Sans',
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF00D4FF).withValues(alpha: 0.9),
          ),
        ),
      ],
    );
  }
}

// ── Quick Action Card ──
class _QuickActionCard extends StatelessWidget {
  final String emoji;
  final String label;
  final Color accent;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.emoji,
    required this.label,
    required this.accent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF1A1A2E).withValues(alpha: 0.06),
                blurRadius: 12,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(emoji, style: const TextStyle(fontSize: 20)),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'DM Sans',
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF0D0D1A),
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Feature Banner Card ──
class _FeatureBannerCard extends StatelessWidget {
  final LinearGradient gradient;
  final Color accentColor;
  final String emoji;
  final String title;
  final String subtitle;
  final String badgeText;
  final VoidCallback onTap;

  const _FeatureBannerCard({
    required this.gradient,
    required this.accentColor,
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.badgeText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: accentColor.withValues(alpha: 0.15),
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            // Emoji container
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(16),
                border:
                Border.all(color: accentColor.withValues(alpha: 0.3), width: 1),
              ),
              child: Center(
                child: Text(emoji, style: const TextStyle(fontSize: 28)),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Badge
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: accentColor.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      badgeText,
                      style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: accentColor,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Sora',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: -0.2,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 12,
                      color: Color(0xFF8896AB),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
              color: accentColor.withValues(alpha: 0.7),
            ),
          ],
        ),
      ),
    );
  }
}

// ── BroLX Preview Card ──
class _BrolxPreviewCard extends StatelessWidget {
  final String emoji;
  final String title;
  final String price;
  final String condition;
  final Color conditionColor;

  const _BrolxPreviewCard({
    required this.emoji,
    required this.title,
    required this.price,
    required this.condition,
    required this.conditionColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1A2E).withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFF0F2FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(emoji, style: const TextStyle(fontSize: 26)),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'DM Sans',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0D0D1A),
              height: 1.3,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontFamily: 'Sora',
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0D0D1A),
                ),
              ),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: conditionColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  condition,
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                    color: conditionColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Activity Item ──
class _ActivityItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;

  const _ActivityItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1A2E).withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 18, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0D0D1A),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 11,
                    color: Color(0xFF8896AB),
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded,
              size: 16, color: Color(0xFFADB5BD)),
        ],
      ),
    );
  }
}