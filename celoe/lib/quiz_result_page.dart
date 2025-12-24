import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class QuizResultPage extends StatelessWidget {
  const QuizResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8),
      body: Stack(
        children: [
          // Content
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: const Color(0xFFF6F7F8).withOpacity(0.95),
                pinned: true,
                elevation: 1,
                leading: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Color(0xFF111418)),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                title: Text(
                  'Hasil Kuis',
                  style: GoogleFonts.lexend(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF111418),
                  ),
                ),
                centerTitle: true,
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 100),
                  child: Column(
                    children: [
                      // Score Section
                      _buildScoreSection(),
                      const SizedBox(height: 32),

                      // Stats Grid
                      _buildStatsGrid(),
                      const SizedBox(height: 24),

                      // Review Section Header
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Ulasan Jawaban',
                          style: GoogleFonts.lexend(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF111418),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Review List
                      _buildReviewList(),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Sticky Footer
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildStickyFooter(context),
          ),
        ],
      ),
    );
  }

  Widget _buildScoreSection() {
    return Column(
      children: [
        SizedBox(
          width: 160,
          height: 160,
          child: CustomPaint(
            painter: _RadialProgressPainter(
              value: 0.85, 
              color: const Color(0xFF137FEC), 
              backgroundColor: Colors.grey[200]!
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '85%',
                    style: GoogleFonts.lexend(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF111418),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF137FEC).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Lulus',
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
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Kerja Bagus, Sarah!',
          style: GoogleFonts.lexend(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF111418),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Kamu telah menyelesaikan kuis "Dasar-Dasar Desain UI" dengan hasil yang memuaskan.',
          textAlign: TextAlign.center,
          style: GoogleFonts.lexend(
            fontSize: 14,
            color: const Color(0xFF64748B),
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildStatsGrid() {
    return Row(
      children: [
        Expanded(child: _buildStatCard(Icons.check_circle, '12', 'Benar', Colors.green)),
        const SizedBox(width: 12),
        Expanded(child: _buildStatCard(Icons.cancel, '3', 'Salah', Colors.red)),
        const SizedBox(width: 12),
        Expanded(child: _buildStatCard(Icons.timer, '12m', 'Durasi', Colors.orange)),
      ],
    );
  }

  Widget _buildStatCard(IconData icon, String value, String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.lexend(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF111418),
            ),
          ),
          Text(
            label,
            style: GoogleFonts.lexend(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewList() {
    return Column(
      children: [
        _buildReviewItem(
          1,
          'correct',
          'Apa prinsip utama dari \'Hierarchy\' dalam desain UI?',
          'Mengatur elemen visual untuk menunjukkan tingkat kepentingannya.',
          correctAnswer: '',
          explanation: '',
        ),
        const SizedBox(height: 16),
        _buildReviewItem(
          2,
          'wrong',
          'Manakah format file gambar yang mendukung transparansi?',
          'JPG',
          correctAnswer: 'PNG',
          explanation: 'JPG tidak mendukung transparansi alpha channel, sehingga latar belakang akan selalu terisi warna (biasanya putih). PNG dan SVG adalah format yang mendukung transparansi.',
        ),
        const SizedBox(height: 16),
        _buildReviewItem(
          3,
          'correct',
          'Warna manakah yang paling sering dikaitkan dengan \'kesalahan\' atau \'bahaya\' dalam desain antarmuka?',
          'Merah',
          correctAnswer: '',
          explanation: '',
        ),
      ],
    );
  }

  Widget _buildReviewItem(int number, String status, String question, String userAnswer, {required String correctAnswer, required String explanation}) {
    bool isCorrect = status == 'correct';
    Color statusColor = isCorrect ? const Color(0xFF137FEC) : Colors.red;
    Color bgColor = isCorrect ? Colors.white : Colors.white; // Can change for wrong answer differentiation if needed
    Color borderColor = isCorrect ? const Color(0xFFF1F5F9) : Colors.red.withOpacity(0.2);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
        boxShadow: [
          if (!isCorrect) 
            BoxShadow(color: Colors.red.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: No + Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'No. $number',
                  style: GoogleFonts.lexend(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF475569),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(isCorrect ? Icons.check : Icons.close, size: 16, color: statusColor),
                    const SizedBox(width: 4),
                    Text(
                      isCorrect ? 'Benar' : 'Salah',
                      style: GoogleFonts.lexend(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: statusColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          // Question
          Text(
            question,
            style: GoogleFonts.lexend(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF111418),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),

          // User Answer Section
          if (!isCorrect) ...[
             Text(
              'Jawaban Kamu:',
              style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.w500, color: const Color(0xFF64748B)),
            ),
            const SizedBox(height: 6),
          ],
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isCorrect ? const Color(0xFF137FEC).withOpacity(0.05) : Colors.red.withOpacity(0.05),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: isCorrect ? const Color(0xFF137FEC).withOpacity(0.2) : Colors.red.withOpacity(0.2)),
            ),
            child: Row(
              children: [
                Icon(
                  isCorrect ? Icons.check_circle_outline : Icons.radio_button_checked,
                  size: 18,
                  color: isCorrect ? const Color(0xFF137FEC) : Colors.red,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                     userAnswer,
                    style: GoogleFonts.lexend(
                      fontSize: 14,
                      color: const Color(0xFF334155),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Correct Answer & Explanation (Only if wrong)
          if (!isCorrect) ...[
            const SizedBox(height: 16),
            Text(
              'Jawaban Benar:',
              style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.w500, color: const Color(0xFF64748B)),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.05),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.green.withOpacity(0.2)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, size: 18, color: Colors.green),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      correctAnswer,
                      style: GoogleFonts.lexend(
                        fontSize: 14,
                        color: const Color(0xFF334155),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Penjelasan:',
                    style: GoogleFonts.lexend(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF111418),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    explanation,
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
        ],
      ),
    );
  }

  Widget _buildStickyFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: const Color(0xFFE2E8F0))),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, -4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF111418),
                side: const BorderSide(color: Color(0xFFCBD5E1)),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text('Kembali', style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // Restart logic
                Navigator.pop(context); // Pop result
                // Navigator.pop(context); // Pop quiz (optional, or push replacement)
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF137FEC),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 4,
                shadowColor: const Color(0xFF137FEC).withOpacity(0.4),
              ),
              child: Text('Ulangi Kuis', style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}

class _RadialProgressPainter extends CustomPainter {
  final double value;
  final Color color;
  final Color backgroundColor;

  _RadialProgressPainter({required this.value, required this.color, required this.backgroundColor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = math.min(size.width / 2, size.height / 2) - 6;

    // Background circle
    paint.color = backgroundColor;
    canvas.drawCircle(center, radius, paint);

    // Progress arc
    paint.color = color;
    double sweepAngle = 2 * math.pi * value;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -math.pi / 2, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
