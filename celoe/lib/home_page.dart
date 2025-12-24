import 'package:celoe/course_list_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100), // Space for BottomNavBar
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top App Bar
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: const Color(0xFFF6F7F8).withOpacity(0.95),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: const Color(0xFF137FEC).withOpacity(0.2), width: 2),
                                image: const DecorationImage(
                                  image: NetworkImage(
                                    'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=200&auto=format&fit=crop',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Selamat Datang,',
                                  style: GoogleFonts.lexend(
                                    fontSize: 12,
                                    color: const Color(0xFF64748B),
                                  ),
                                ),
                                Text(
                                  'Amilatus Sholehah',
                                  style: GoogleFonts.lexend(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF111418),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.notifications_outlined, size: 28),
                              color: const Color(0xFF111418),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white, width: 2),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Search Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                          hintText: 'Cari kursus, materi, atau pengajar...',
                          hintStyle: GoogleFonts.lexend(fontSize: 14, color: const Color(0xFF94A3B8)),
                          prefixIcon: const Icon(Icons.search, color: Color(0xFF94A3B8)),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.tune, color: Color(0xFF137FEC)),
                            onPressed: () {},
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        ),
                      ),
                    ),
                  ),

                  // Announcements
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF137FEC).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFF137FEC).withOpacity(0.2)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.campaign, color: Color(0xFF137FEC)),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Jadwal Ujian Semester',
                                  style: GoogleFonts.lexend(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF111418),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Ujian akhir semester akan dimulai pada tanggal 15 November. Pastikan Anda telah menyelesaikan semua tugas.',
                                  style: GoogleFonts.lexend(
                                    fontSize: 12,
                                    color: const Color(0xFF475569),
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Active Courses Header
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Lanjutkan Belajar',
                          style: GoogleFonts.lexend(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF111418),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Lihat Semua',
                            style: GoogleFonts.lexend(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF137FEC),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Active Courses List
                  SizedBox(
                    height: 280,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        _buildCourseCard(
                          title: 'Dasar Pemrograman Python',
                          subtitle: 'Bab 3: Struktur Data & Array',
                          image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD9fbwKkzea-anX24IvyD0YyZu3yZJoqP-DZUyN98BQMtrym1oJeoLIspYqf5rB2w51Kq2_C9ki_9rePGi5Hk_F_rIRZm3O7xICZ3B2vW7AjLgJZisAOgf8y2wNyxd44DSo08c56r64REYC4BMCvl6eUwp69NO9c60HwHA7DyPYURUr8mlT1VOKCdb9FaDSsXQNua4ihdqsH0lX0KQLLSVB-zZnTq-ON-8WO06YRIa0U025kWg0avxdgbK9TQhtSP52725S2yC_XkU',
                          category: 'Pemrograman',
                          progress: 0.75,
                          progressText: '12/16 Modul',
                        ),
                        const SizedBox(width: 16),
                        _buildCourseCard(
                          title: 'Desain UI/UX Modern',
                          subtitle: 'Bab 2: Teori Warna',
                          image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBnxsGIatevanjIPqasTUpBOLdZm716rt3Oe8hdWvr6MibQ7PWVas7PV4traWWL4PBhaYxZjDvtzi2WYC4jEaJM27PNsde0ITpE0i58jQHMzzLiDw87NaWPJObfot-Yad9CSnDf4qvtdhLbQS10SHThOa0vvGtn417QBQcSj_hzQnjWimKD3NNPr2GaUgYB2Pd5f2ryy0QdE9O1Zkm09yqaz_MHQSzYJdV-eTZB5EFTLHwN1MThmwS9aX3Jf-wltomFlMqKtgW2CW4',
                          category: 'Desain',
                          progress: 0.40,
                          progressText: '4/10 Modul',
                        ),
                      ],
                    ),
                  ),

                  // Quick Access Grid
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: GridView.count(
                      crossAxisCount: 4,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _buildQuickAccessItem(Icons.school, 'Kelas', Colors.blue),
                        _buildQuickAccessItem(Icons.assignment, 'Tugas', Colors.green),
                        _buildQuickAccessItem(Icons.emoji_events, 'Prestasi', Colors.purple),
                        _buildQuickAccessItem(Icons.forum, 'Diskusi', Colors.orange),
                      ],
                    ),
                  ),

                  // Recommendations Header
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                    child: Text(
                      'Rekomendasi Untukmu',
                      style: GoogleFonts.lexend(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF111418),
                      ),
                    ),
                  ),

                  // Recommendations List
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      _buildRecommendationCard(
                        title: 'Analisis Data Bisnis untuk Pemula',
                        instructor: 'Oleh Dr. Andi Wijaya',
                        rating: 4.8,
                        reviews: 120,
                        image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuC1lW4hycHUcCygkOKCuKf3I0iCwcEWFobDkmWHGwk_IsNqCQDoJyyR4sOQnYesdwDR2rOV_vrgKk6S-dFnbXtQRYv63KaZXOXl3GUsA73T14RSUpLYOfzpOESn6sZO-egRaEv9KeEKomhXDfcAMMEKeSQklvKv9mskKWQBBAvUp09Nq97iI5BQXUyz-p4zRdyfx1ZpeY1h4vzSKr3tFGJ0tfVS26K4ZwVDx0EOHTzq3GTRcL_XPIDFdCtePoqQZq66zL9YRSUfynk',
                        price: 'Gratis',
                        isFree: true,
                      ),
                      const SizedBox(height: 16),
                      _buildRecommendationCard(
                        title: 'Masterclass Digital Marketing 2024',
                        instructor: 'Oleh Sarah Putri',
                        rating: 4.9,
                        reviews: 85,
                        image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDVE_hfdAR3KFfM9oqnrY0C9qPw-uKpK06TxQgOlywu3eHrXSGdSqgjDSqHQfbVu5BejRFHqbsB50Jk42S0hkYw-dnE8zqeE2lmKCXBvN4uBZdFBAI02nPV2uYgsjoTRO7rc-QwA8UZc-bs_VqJswSUPpbrPJwwK3-bX669G_WkuOvv30U37HzxY0DzEOT0gaRM0gID7bbHtZSesIHlQR1GphYkOfhkNFkItbS-i3WXxQU9NQiQyv_-uR5DisqbVnLwrQ9lzy2LVuM',
                        price: 'Rp 150k',
                        originalPrice: 'Rp 500k',
                        isFree: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),

            // Bottom Navigation Bar
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(top: BorderSide(color: const Color(0xFFE2E8F0))),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(Icons.home, 'Beranda', true, () {}),
                    _buildNavItem(Icons.search, 'Jelajah', false, () {}),
                    _buildNavItem(Icons.menu_book, 'Kursusku', false, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CourseListPage()),
                      );
                    }),
                    _buildNavItem(Icons.person, 'Profil', false, () {}),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive ? const Color(0xFF137FEC) : const Color(0xFF64748B),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.lexend(
              fontSize: 10,
              color: isActive ? const Color(0xFF137FEC) : const Color(0xFF64748B),
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAccessItem(IconData icon, String label, MaterialColor color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color.shade50,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color.shade600, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.lexend(
            fontSize: 12,
            color: const Color(0xFF475569),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildCourseCard({
    required String title,
    required String subtitle,
    required String image,
    required String category,
    required double progress,
    required String progressText,
  }) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 128,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Container(
                  color: Colors.black.withOpacity(0.4),
                ),
                Positioned(
                  bottom: 8,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.white.withOpacity(0.1)),
                    ),
                    child: Text(
                      category,
                      style: GoogleFonts.lexend(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.lexend(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF111418),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.lexend(
                    fontSize: 12,
                    color: const Color(0xFF64748B),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${(progress * 100).toInt()}%',
                      style: GoogleFonts.lexend(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF137FEC),
                      ),
                    ),
                    Text(
                      progressText,
                      style: GoogleFonts.lexend(
                        fontSize: 10,
                        color: const Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: const Color(0xFFE2E8F0),
                  color: const Color(0xFF137FEC),
                  minHeight: 6,
                  borderRadius: BorderRadius.circular(3),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF137FEC),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      'Lanjutkan',
                      style: GoogleFonts.lexend(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationCard({
    required String title,
    required String instructor,
    required double rating,
    required int reviews,
    required String image,
    required String price,
    String? originalPrice,
    required bool isFree,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(image),
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
                  children: [
                    const Icon(Icons.star, color: Color(0xFFFACC15), size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '$rating',
                      style: GoogleFonts.lexend(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF334155),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '($reviews Ulasan)',
                      style: GoogleFonts.lexend(
                        fontSize: 10,
                        color: const Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: GoogleFonts.lexend(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF111418),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  instructor,
                  style: GoogleFonts.lexend(
                    fontSize: 12,
                    color: const Color(0xFF64748B),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    if (originalPrice != null) ...[
                      Text(
                        originalPrice,
                        style: GoogleFonts.lexend(
                          fontSize: 12,
                          color: const Color(0xFF64748B),
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      price,
                      style: GoogleFonts.lexend(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: isFree ? const Color(0xFF22C55E) : const Color(0xFF137FEC),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: const Color(0xFF137FEC).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add, size: 18),
                        color: const Color(0xFF137FEC),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
