import 'package:celoe/discussion_detail_page.dart';
import 'package:celoe/models/course.dart';
import 'dart:ui' as ub;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseDetailPage extends StatefulWidget {
  final Course course;

  const CourseDetailPage({super.key, required this.course});

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  bool _showTitle = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.offset > 200 && !_showTitle) {
      setState(() => _showTitle = true);
    } else if (_scrollController.offset <= 200 && _showTitle) {
      setState(() => _showTitle = false);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8),
      body: Stack(
        children: [
          NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: const Color(0xFFF6F7F8).withOpacity(0.95),
                  pinned: true,
                  elevation: 0,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Color(0xFF111418)),
                    onPressed: () => Navigator.pop(context),
                  ),
                  title: AnimatedOpacity(
                    opacity: _showTitle ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      'Course Detail',
                      style: GoogleFonts.lexend(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF111418),
                      ),
                    ),
                  ),
                  centerTitle: true,
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.bookmark_border, color: Color(0xFF111418)),
                      onPressed: () {},
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      _buildHeroSection(),
                      _buildHeaderInfo(),
                    ],
                  ),
                ),
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      controller: _tabController,
                      labelColor: const Color(0xFF111418),
                      unselectedLabelColor: const Color(0xFF64748B),
                      labelStyle: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.w500),
                      indicatorColor: const Color(0xFF137FEC),
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: const [
                        Tab(text: 'About'),
                        Tab(text: 'Lessons'),
                        Tab(text: 'Diskusi'),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: [
                _buildAboutTab(),
                _buildLessonsTab(),
                _buildDiscussionTab(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildStickyFooter(),
          ),
        ],
      ),
    );
  }

  // ... (Hero and Header sections remain same)

  Widget _buildDiscussionTab() {
    return ListView(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 100),
      // physics: const NeverScrollableScrollPhysics(), // REMOVED for NestedScrollView
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Diskusi (42)',
              style: GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xFF111418)),
            ),
             Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF137FEC),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Tambah Postingan',
                    style: GoogleFonts.lexend(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
          ],
        ),
        const SizedBox(height: 16),
        _buildDiscussionItem(
          'Budi Santoso',
          '2 jam yang lalu',
          'Apakah materi ini mencakup penggunaan Auto Layout di Figma?',
          'https://i.pravatar.cc/150?u=budi',
          2,
        ),
        _buildDiscussionItem(
          'Siti Aminah',
          '1 hari yang lalu',
          'Sangat membantu! Penjelasannya mudah dipahami bagi pemula.',
          'https://i.pravatar.cc/150?u=siti',
          5,
        ),
         _buildDiscussionItem(
          'Rudi Hermawan',
          '2 hari yang lalu',
          'Bagaimana cara mengunduh aset latihan yang disebutkan di video ke-3?',
          'https://i.pravatar.cc/150?u=rudi',
          1,
        ),
        const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildDiscussionItem(String name, String time, String content, String imageUrl, int replies) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        debugPrint('Navigating to DiscussionDetailPage');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DiscussionDetailPage(
              title: 'Discussion',
              author: name,
              time: time,
              content: content,
              imageUrl: imageUrl,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFF1F5F9)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(imageUrl),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.lexend(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF111418),
                      ),
                    ),
                    Text(
                      time,
                      style: GoogleFonts.lexend(
                        fontSize: 12,
                        color: const Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              content,
              style: GoogleFonts.lexend(
                fontSize: 14,
                color: const Color(0xFF475569),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.chat_bubble_outline, size: 16, color: const Color(0xFF64748B)),
                const SizedBox(width: 6),
                Text(
                  '$replies Balasan',
                  style: GoogleFonts.lexend(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF64748B),
                  ),
                ),
                const SizedBox(width: 16),
                Icon(Icons.thumb_up_outlined, size: 16, color: const Color(0xFF64748B)),
                const SizedBox(width: 6),
                Text(
                  'Suka',
                  style: GoogleFonts.lexend(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStickyFooter() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            image: DecorationImage(
              image: NetworkImage(widget.course.image),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(color: Colors.black.withOpacity(0.3)),
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white.withOpacity(0.5)),
                ),
                child: BackdropFilter(
                  filter: ub.ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Requires import
                  child: const Icon(Icons.play_arrow, color: Colors.white, size: 32),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF137FEC).withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              widget.course.category.toUpperCase(),
              style: GoogleFonts.lexend(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF137FEC),
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.course.title,
            style: GoogleFonts.lexend(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF111418),
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'By Sarah Santoso • Updated June 2024',
            style: GoogleFonts.lexend(
              fontSize: 14,
              color: const Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 16),
          // Stats Row
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              border: Border.symmetric(horizontal: BorderSide(color: const Color(0xFFE2E8F0))),
            ),
            child: Row(
              children: [
                _buildStatItem(Icons.star, '${widget.course.rating}', Color(0xFFFACC15), '(${widget.course.reviews})'),
                _buildDivider(),
                _buildStatItem(Icons.schedule, '6h 30m', const Color(0xFF64748B), ''),
                _buildDivider(),
                _buildStatItem(Icons.school, 'Beginner', const Color(0xFF64748B), ''),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String mainText, Color iconColor, String subText) {
    return Row(
      children: [
        Icon(icon, size: 20, color: iconColor),
        const SizedBox(width: 6),
        Text(
          mainText,
          style: GoogleFonts.lexend(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF111418),
          ),
        ),
        if (subText.isNotEmpty) ...[
          const SizedBox(width: 2),
          Text(
            subText,
            style: GoogleFonts.lexend(
              fontSize: 12,
              color: const Color(0xFF64748B),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 16,
      width: 1,
      color: const Color(0xFFCBD5E1),
      margin: const EdgeInsets.symmetric(horizontal: 16),
    );
  }

  Widget _buildAboutTab() {
    // SingleChildScrollView inside TabBarView?
    // NestedScrollView is typically needed for SliverAppBar + TabBarView -> ListView scrolling.
    // For now, let's just return a standard ListView. 
    // BUT we are already inside a CustomScrollView with SliverFillRemaining.
    // So we just provide content.
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About this course',
            style: GoogleFonts.lexend(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF111418),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.course.description.length > 50 ? widget.course.description : 'Learn how to build comprehensive design systems for mobile applications. This course covers everything from atomic design principles to component libraries in Figma. Perfect for designers looking to scale their workflow.',
            style: GoogleFonts.lexend(
              fontSize: 14,
              color: const Color(0xFF475569),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Read more',
            style: GoogleFonts.lexend(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF137FEC),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Instructor',
            style: GoogleFonts.lexend(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF111418),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFF1F5F9)),
              boxShadow: [
                 BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuA5xxaKPHsj0k5YesLrrWjtG_I8EoT0vxI21OubyYJBeib44NkHQ17Uu2AiLCEr6VjcLJ5TGHmqgcXjGto6grVUY1jftvlMOSwDKavdli1QVxqcyBqYao-Ld98-xsIiB3Cg7UlelQGj-GS1yrAYNWwSZfZqhX-c7Y_vhZvSgTAeaTJzJrUbsgF50YAFjjkmjgmW3tVzjw0rNAUDZ6sew33mhIwj_X-QvscpsdY339SwmdgIA8tTUI6oZ0q00I5bL5Ss-AOCVRbUcKg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sarah Santoso',
                        style: GoogleFonts.lexend(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF111418),
                        ),
                      ),
                      Text(
                        'Senior Product Designer',
                        style: GoogleFonts.lexend(
                          fontSize: 12,
                          color: const Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF137FEC).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    'Profile',
                    style: GoogleFonts.lexend(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF137FEC),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 80), // Bottom padding
        ],
      ),
    );
  }

  Widget _buildLessonsTab() {
    return ListView(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 100),
      // physics: const NeverScrollableScrollPhysics(), // REMOVED
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Curriculum',
              style: GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xFF111418)),
            ),
             Text(
              '12 Lessons',
              style: GoogleFonts.lexend(fontSize: 12, color: const Color(0xFF64748B)),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Lessons
        _buildLessonItem(1, 'Introduction to Design Systems', '05:30', true, false),
        _buildLessonItem(2, 'Atomic Design Principles', '12:45', false, true),
        _buildLessonItem(3, 'Setting Up Your Figma File', '08:20', false, true),
        const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildLessonItem(int index, String title, String duration, bool isCompleted, bool isLocked) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isCompleted ? const Color(0xFF137FEC) : Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: isCompleted 
              ? const Icon(Icons.check, size: 16, color: Colors.white)
              : Text('$index', style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey[500])),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.lexend(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF111418),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Video • $duration',
                  style: GoogleFonts.lexend(
                    fontSize: 12,
                    color: const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
          if (isCompleted || !isLocked)
             Icon(Icons.play_circle_outline, color: const Color(0xFF137FEC), size: 24)
          else
             Icon(Icons.lock_outline, color: const Color(0xFF94A3B8), size: 20),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            image: DecorationImage(
              image: NetworkImage(widget.course.image),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(color: Colors.black.withOpacity(0.3)),
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white.withOpacity(0.5)),
                ),
                child: BackdropFilter(
                  filter: ub.ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Requires import
                  child: const Icon(Icons.play_arrow, color: Colors.white, size: 32),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height + 16;
  @override
  double get maxExtent => _tabBar.preferredSize.height + 16;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: const Color(0xFFF6F7F8), // Background for sticky tab header
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: _tabBar,
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
