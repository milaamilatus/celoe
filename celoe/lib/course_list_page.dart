import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Mock Data Model (The "Backend" part)
class Course {
  final String title;
  final String description;
  final String image;
  final String status; // 'in_progress', 'not_started', 'completed'
  final double? progress;
  final String? progressText;
  final String? duration;
  final String? completedDate;

  Course({
    required this.title,
    required this.description,
    required this.image,
    required this.status,
    this.progress,
    this.progressText,
    this.duration,
    this.completedDate,
  });
}

class CourseListPage extends StatefulWidget {
  const CourseListPage({super.key});

  @override
  State<CourseListPage> createState() => _CourseListPageState();
}

class _CourseListPageState extends State<CourseListPage> {
  // Mock Data
  final List<Course> courses = [
    Course(
      title: 'Dasar Pemrograman Python',
      description: 'Pelajari sintaks dasar, variabel, dan logika pemrograman modern.',
      image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBXPyAZjLdKIXEiDEX6-8ut4wa3r7rks2aryvBzEpovhuYnX-AQWWeG8BcpW0UBnuAdlGOjX-DG3YFFdjO6QgGxGJ6B036zlsVCY4Q9AC2k8Krm1o4nnBF_0MKFswfsKbypejk6YiuXCnVG1jCY8Qzn6vNjovkLT-DRUPinKs7vVNU-vHEy2NnLdhhqhqZinjdQEmMXkTDfA7wOLEZ1DtSIP68oOAiUVxrIA4E9SfpETEYnpxU4M0hikSPLjvvr81ubWmxlp3S5JPY',
      status: 'in_progress',
      progress: 0.45,
      progressText: 'Modul 3/8',
    ),
    Course(
      title: 'Desain UI/UX Mobile App',
      description: 'Mastering Figma dan prinsip desain antarmuka pengguna.',
      image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBOgt2U46FZUV2kYOScYjNv5xMER9ao2PElZZp6p701ByG_BJraYnlfGA6yW0TvTq59qLLVIHPjY7IQ4D1eA7GQttUJX24qZRBxf_QZeZZHPxvaHy58qslMdEGje03GV23HAD1qL19OoFcyCkyA0OA33e6iMi3shMbpBmrIgD3-pQGTE_0UJDTMAWJW4fKYFQnRclCqT-H6T3M5ODNAq31c4pmtOArNvIOCwwo9PKmh2KC6h-8DQNH-dxeFEt8JblY_wWjXEMnPfBs',
      status: 'not_started',
      duration: '4j 30m',
    ),
    Course(
      title: 'Agile Project Management',
      description: 'Metodologi scrum dan manajemen tim yang efektif.',
      image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDUwlXNMfTWY30yYHjKChPRDGCw_FEsjeJalqoHsXmURaafYns96JSczb6NQQswBXwaSN5HWD6olAlgbda1UdKDqlrXmHXCfMmMrwusJxzgMDrXGMiO38V2gC3BCdMT3enRfglNg_sTioXWTt6EHPzKIlAP_doAyBTGp9Wn7uVvcXIdReVuiaBhk_lFFgL4CHlDzknPVRSlbh8AGi7y29zkRzSEo20iYmyu_lscdtr-BnbQHlndJcqdsewcFdJs29OJbPGk6arrAok',
      status: 'in_progress',
      progress: 0.90,
      progressText: 'Final Quiz',
    ),
    Course(
      title: 'Data Science Intro',
      description: 'Pengenalan Big Data dan analisis statistik dasar.',
      image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDykKPgjT8W4Y1LhREc0I7gSRe5dF0sUxl9YSh1xhmPCY8QbMzARfR1wauIQT3Sy0-ph1Y01UNdRXLmsQB5Qj-1EfcEKfySxSxdgxRlAgTTbhsJQ6zmXwQ93L_ChwfPnkd_VhHWTTN62-FU6WmElxzo-9QlXBNJV_YczhXrr4X9NnLODpWAeOCzthGhn80ccsdScW5G1fpIHNWr2ADhaGAXC4gHthxXxLxkQ_w5vzHl35nopljX0sN1NbYK3OUdxL9PpdaSaDc4Urk',
      status: 'completed',
      completedDate: '12 Okt 2023',
    ),
  ];

  String _selectedFilter = 'Semua';

  List<Course> get filteredCourses {
    if (_selectedFilter == 'Semua') return courses;
    if (_selectedFilter == 'Sedang Berjalan') return courses.where((c) => c.status == 'in_progress').toList();
    if (_selectedFilter == 'Belum Dimulai') return courses.where((c) => c.status == 'not_started').toList();
    if (_selectedFilter == 'Selesai') return courses.where((c) => c.status == 'completed').toList();
    return courses;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F7F8).withOpacity(0.9),
                    border: const Border(bottom: BorderSide(color: Color(0xFFE2E8F0))),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back),
                        color: const Color(0xFF0F172A),
                      ),
                      Text(
                        'Daftar Kursus',
                        style: GoogleFonts.lexend(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF0F172A),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.grid_view),
                        color: const Color(0xFF0F172A),
                      ),
                    ],
                  ),
                ),

                // Search Bar
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari pelajaran atau topik...',
                        hintStyle: GoogleFonts.lexend(fontSize: 14, color: const Color(0xFF94A3B8)),
                        prefixIcon: const Icon(Icons.search, color: Color(0xFF94A3B8)),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      ),
                    ),
                  ),
                ),

                // Filter Chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      _buildFilterChip('Semua'),
                      const SizedBox(width: 12),
                      _buildFilterChip('Sedang Berjalan'),
                      const SizedBox(width: 12),
                      _buildFilterChip('Belum Dimulai'),
                      const SizedBox(width: 12),
                      _buildFilterChip('Selesai'),
                    ],
                  ),
                ),

                // Course List
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 100),
                    itemCount: filteredCourses.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      return _buildCourseCard(filteredCourses[index]);
                    },
                  ),
                ),
              ],
            ),

            // Bottom Navigation
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: const Border(top: BorderSide(color: Color(0xFFE2E8F0))),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(Icons.home, 'Beranda', false, () => Navigator.pop(context)),
                    _buildNavActiveItem(Icons.school, 'Kursus'),
                    _buildNavItem(Icons.chat_bubble_outline, 'Diskusi', false, () {}),
                    _buildNavItem(Icons.person_outline, 'Profil', false, () {}),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    bool isSelected = _selectedFilter == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF137FEC) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: isSelected ? null : Border.all(color: const Color(0xFFE2E8F0)),
          boxShadow: isSelected
              ? [BoxShadow(color: const Color(0xFF137FEC).withOpacity(0.2), blurRadius: 4, offset: const Offset(0, 2))]
              : null,
        ),
        child: Text(
          label,
          style: GoogleFonts.lexend(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : const Color(0xFF475569),
          ),
        ),
      ),
    );
  }

  Widget _buildCourseCard(Course course) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(course.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            course.title,
                            style: GoogleFonts.lexend(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF0F172A),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Icon(Icons.more_vert, color: Color(0xFF94A3B8)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      course.description,
                      style: GoogleFonts.lexend(
                        fontSize: 12,
                        color: const Color(0xFF64748B),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (course.status == 'completed') ...[
                       const SizedBox(height: 8),
                       Row(
                         children: [
                           Container(
                             padding: const EdgeInsets.all(2),
                             decoration: BoxDecoration(
                               color: const Color(0xFF22C55E).withOpacity(0.1),
                               shape: BoxShape.circle,
                             ),
                             child: const Icon(Icons.check, size: 14, color: Color(0xFF22C55E)),
                           ),
                         ],
                       ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          
          if (course.status == 'in_progress') ...[
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${(course.progress! * 100).toInt()}% Selesai',
                  style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.w500, color: const Color(0xFF64748B)),
                ),
                Text(
                  course.progressText!,
                  style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.w600, color: const Color(0xFF137FEC)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: course.progress,
              backgroundColor: const Color(0xFFF1F5F9),
              color: const Color(0xFF137FEC),
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF137FEC),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text('Lanjutkan Belajar', style: GoogleFonts.lexend(fontWeight: FontWeight.w600)),
              ),
            ),
          ] else if (course.status == 'not_started') ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.schedule, size: 16, color: const Color(0xFF64748B)),
                const SizedBox(width: 4),
                Text(
                  course.duration!,
                  style: GoogleFonts.lexend(fontSize: 12, color: const Color(0xFF64748B)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF1F5F9),
                      foregroundColor: const Color(0xFF0F172A),
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(vertical: 8), 
                    ),
                    child: Text('Mulai Kelas', style: GoogleFonts.lexend(fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
          ] else if (course.status == 'completed') ...[
            const SizedBox(height: 12),
            const Divider(color: Color(0xFFF1F5F9)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Selesai ${course.completedDate}',
                  style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.w500, color: const Color(0xFF22C55E)),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.download, size: 16),
                  label: const Text('Sertifikat'),
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF137FEC),
                    textStyle: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.w600),
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive ? const Color(0xFF137FEC) : const Color(0xFF94A3B8),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.lexend(
              fontSize: 10,
              color: isActive ? const Color(0xFF137FEC) : const Color(0xFF94A3B8),
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavActiveItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFF137FEC).withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(icon, color: const Color(0xFF137FEC)),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.lexend(
            fontSize: 10,
            color: const Color(0xFF137FEC),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
