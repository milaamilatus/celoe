import 'package:celoe/models/course.dart';
import 'package:celoe/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LessonPage extends StatefulWidget {
  final Course course;

  const LessonPage({super.key, required this.course});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  // Mock data for modules and lessons since simpler Course model doesn't have deep structure
  final List<Map<String, dynamic>> _modules = [
    {
      'title': 'Module 1: Introduction',
      'status': 'Completed',
      'lessons': [
        {'title': 'What is User Experience?', 'type': 'video', 'duration': '10 min', 'isCompleted': true, 'isLocked': false},
        {'title': 'Course Syllabus', 'type': 'pdf', 'duration': '2.4 MB', 'isCompleted': true, 'isLocked': false},
      ]
    },
    {
      'title': 'Module 2: User Research',
      'status': 'In Progress',
      'lessons': [
        {'title': 'Conducting Interviews', 'type': 'video', 'duration': '15 min remaining', 'isCompleted': false, 'isActive': true, 'isLocked': false},
        {'title': 'Quiz: Research Methods', 'type': 'quiz', 'duration': '10 Questions', 'isCompleted': false, 'isLocked': true},
        {'title': 'Create a Persona', 'type': 'assignment', 'duration': 'Homework', 'isCompleted': false, 'isLocked': true},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8), // background-light
      body: Stack(
        children: [
          CustomScrollView(
             slivers: [
              _buildSliverAppBar(),
              SliverToBoxAdapter(child: _buildCourseHeader()),
              ..._buildModuleSlivers(),
              const SliverPadding(padding: EdgeInsets.only(bottom: 100)),
             ],
          ),
          _buildStickyFooter(),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: const Color(0xFFF6F7F8),
      floating: true,
      pinned: true,
      elevation: 1,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF111418)),
            onPressed: () => Navigator.pop(context),
            padding: EdgeInsets.zero,
          ),
        ),
      ),
      title: Text(
        'Detail Kursus',
        style: GoogleFonts.lexend(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF111418),
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: IconButton(
              icon: const Icon(Icons.more_vert, color: Color(0xFF111418)),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCourseHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hero Section
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
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
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.black.withOpacity(0.2),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFF137FEC), // Primary
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'PREMIUM',
                              style: GoogleFonts.lexend(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '12 Modules',
                            style: GoogleFonts.lexend(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.course.title,
                        style: GoogleFonts.lexend(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
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

          // Progress Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'OVERALL PROGRESS',
                    style: GoogleFonts.lexend(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF616161),
                      letterSpacing: 0.5,
                    ),
                  ),
                  Text(
                    '${(widget.course.progress! * 100).toInt()}%',
                    style: GoogleFonts.lexend(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF137FEC), // Primary
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  '12/48 Lessons',
                  style: GoogleFonts.lexend(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF616161),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: widget.course.progress,
              minHeight: 10,
              backgroundColor: const Color(0xFFEEEEEE),
              color: const Color(0xFF137FEC),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Great job! Keep going to earn your certificate.',
            style: GoogleFonts.lexend(
              fontSize: 12,
              color: const Color(0xFF616161),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildModuleSlivers() {
    return _modules.map((module) {
      return SliverMainAxisGroup(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _ModuleHeaderDelegate(
              title: module['title'],
              status: module['status'],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final lesson = module['lessons'][index];
                return _buildLessonItem(lesson);
              },
              childCount: module['lessons'].length,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      );
    }).toList();
  }

  Widget _buildLessonItem(Map<String, dynamic> lesson) {
    bool isCompleted = lesson['isCompleted'] == true;
    bool isActive = lesson['isActive'] == true;
    bool isLocked = lesson['isLocked'] == true;
    
    Color backgroundColor = isActive 
        ? const Color(0xFF137FEC).withOpacity(0.05) 
        : Colors.transparent;
    Color borderSideColor = isActive 
        ? const Color(0xFF137FEC) 
        : Colors.transparent;

    return GestureDetector(
      onTap: () {
        if (lesson['type'] == 'quiz') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const QuizPage()),
          );
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border(
            left: BorderSide(color: borderSideColor, width: 4),
            bottom: BorderSide(color: Colors.grey.withOpacity(0.1), width: 1),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Opacity(
          opacity: isLocked ? 0.6 : 1.0,
          child: Row(
            children: [
              // Icon Stack
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: isActive ? const Color(0xFF137FEC) : Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      _getLessonIcon(lesson['type']),
                      color: isActive ? Colors.white : (isLocked ? Colors.grey : Colors.grey[600]),
                    ),
                  ),
                  if (isCompleted)
                    Positioned(
                      bottom: -4,
                      right: -4,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.fromBorderSide(BorderSide(color: Colors.white, width: 2)),
                        ),
                        child: const Icon(Icons.check, size: 10, color: Colors.white),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson['title'],
                      style: GoogleFonts.lexend(
                        fontSize: 14,
                        fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
                        color: isActive ? const Color(0xFF137FEC) : const Color(0xFF111418),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          _getLessonSubIcon(lesson['type']), 
                          size: 14, 
                          color: isActive ? const Color(0xFF137FEC).withOpacity(0.8) : Colors.grey[600]
                        ),
                        const SizedBox(width: 4),
                        Text(
                          lesson['duration'],
                          style: GoogleFonts.lexend(
                            fontSize: 12,
                            color: isActive ? const Color(0xFF137FEC).withOpacity(0.8) : Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (isActive)
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFF137FEC).withOpacity(0.3)),
                  ),
                  child: const Icon(Icons.equalizer, size: 18, color: Color(0xFF137FEC)),
                )
              else if (isLocked)
                const Icon(Icons.lock, size: 20, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getLessonIcon(String type) {
    switch (type) {
      case 'video': return Icons.play_arrow;
      case 'pdf': return Icons.description;
      case 'quiz': return Icons.assignment;
      case 'assignment': return Icons.folder_open;
      default: return Icons.article;
    }
  }

  IconData _getLessonSubIcon(String type) {
    switch (type) {
      case 'video': return Icons.videocam;
      case 'pdf': return Icons.picture_as_pdf;
      case 'quiz': return Icons.help_outline;
      case 'assignment': return Icons.assignment_turned_in;
      default: return Icons.access_time;
    }
  }

  Widget _buildStickyFooter() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.white,
              Colors.white.withOpacity(0.9),
              Colors.white.withOpacity(0.0),
            ],
            stops: const [0.6, 0.8, 1.0],
          ),
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF137FEC), // Primary
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 8,
            shadowColor: const Color(0xFF137FEC).withOpacity(0.4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.play_circle_filled, size: 20),
              const SizedBox(width: 8),
              Text(
                'Continue: Conducting Interviews',
                style: GoogleFonts.lexend(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ModuleHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final String status;

  _ModuleHeaderDelegate({required this.title, required this.status});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    bool isCompleted = status == 'Completed';
    return Container(
      color: const Color(0xFFF6F7F8).withOpacity(0.95), // Surface light
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(
          border: Border.symmetric(horizontal: BorderSide(color: Color(0xFFEEEEEE))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.lexend(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF111418),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: isCompleted ? const Color(0xFFE8F5E9) : const Color(0xFF137FEC).withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                status,
                style: GoogleFonts.lexend(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: isCompleted ? const Color(0xFF2E7D32) : const Color(0xFF137FEC),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 70;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(covariant _ModuleHeaderDelegate oldDelegate) {
    return oldDelegate.title != title || oldDelegate.status != status;
  }
}
