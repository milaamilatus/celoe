import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _selectedAnswerIndex = 1; // Default selected for demo

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8), // background-light
      body: Column(
        children: [
          // Top Navigation
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
            ),
            child: SafeArea( // Ensure content is safe from status bar
              bottom: false,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back, color: Color(0xFF111418)),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Keluar',
                          style: GoogleFonts.lexend(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Ujian Akhir Biologi',
                    style: GoogleFonts.lexend(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF111418),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Main Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 100), // Bottom padding for footer
              child: Column(
                children: [
                  // Timer & Progress
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Timer Card
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey[100]!),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.02),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.timer, color: Color(0xFF137FEC), size: 20),
                                const SizedBox(width: 8),
                                Text(
                                  'Sisa Waktu',
                                  style: GoogleFonts.lexend(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF137FEC),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                _buildTimerBox('00'),
                                _buildTimerSeparator(),
                                _buildTimerBox('45'),
                                _buildTimerSeparator(),
                                _buildTimerBox('12', isRed: true),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Progress Bar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pertanyaan 3 dari 10',
                            style: GoogleFonts.lexend(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF64748B),
                            ),
                          ),
                          Text(
                            '30%',
                            style: GoogleFonts.lexend(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF137FEC),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: 0.3,
                          minHeight: 8,
                          backgroundColor: Colors.grey[200],
                          color: const Color(0xFF137FEC),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Question Card
                  Container(
                    padding: const EdgeInsets.all(4), // Inner padding mimic
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey[100]!),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.02),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image
                        Stack(
                          children: [
                            Container(
                              height: 192,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: const DecorationImage(
                                  image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuD7yjPuaJ3zpHLam8Beb5szgcYhvnsjOB5-dXVPpqhKsF7w87wkg4zKYE6zcspLK8DH0LBrOrYROuz7fSGoMKmzBj9N1pZuosjRU3tybo_ZdoVwl3pkkXSSntFs--is-iH5kBsxa7obInn4R3dZ3jP_KPeSbnXRJdrfGLQJUmv5-RQsJXj3UfvTOdFbtQiWM0VdhcsXY7Q-p9e5CLI3IUsF7lniS3ilTG2EMPKBdiwwwcYXPF8tCCV1E4UKPLKgch9wY9qZ6e0LnvY'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  '+5 Poin',
                                  style: GoogleFonts.lexend(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Apa fungsi utama dari mitokondria dalam sel hewan?',
                                style: GoogleFonts.lexend(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF111418),
                                  height: 1.3,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Pilihlah jawaban yang paling tepat berdasarkan materi Bab 3 tentang Struktur Sel.',
                                style: GoogleFonts.lexend(
                                  fontSize: 14,
                                  color: const Color(0xFF64748B),
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Answers
                  Column(
                    children: [
                      _buildAnswerOption(0, 'Sintesis protein'),
                      const SizedBox(height: 12),
                      _buildAnswerOption(1, 'Produksi energi (ATP)'),
                      const SizedBox(height: 12),
                      _buildAnswerOption(2, 'Pembelahan sel'),
                      const SizedBox(height: 12),
                      _buildAnswerOption(3, 'Transportasi nutrisi'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          // Bottom Navigation (Fixed)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey[200]!)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(color: Colors.grey[300]!),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      foregroundColor: const Color(0xFF111418),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.arrow_back, size: 20),
                        const SizedBox(width: 8),
                        Text('Sebelumnya', style: GoogleFonts.lexend(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF137FEC),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                      shadowColor: const Color(0xFF137FEC).withOpacity(0.4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Selanjutnya', style: GoogleFonts.lexend(fontWeight: FontWeight.bold)),
                        const SizedBox(width: 8),
                         const Icon(Icons.arrow_forward, size: 20),
                      ],
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

  Widget _buildTimerBox(String text, {bool isRed = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isRed ? Colors.red.withOpacity(0.1) : Colors.grey[100],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: GoogleFonts.ibmPlexMono( // Using a monospaced font if available or fallback
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: isRed ? Colors.red : const Color(0xFF111418),
        ),
      ),
    );
  }

  Widget _buildTimerSeparator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        ':',
        style: GoogleFonts.lexend(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey[400],
        ),
      ),
    );
  }

  Widget _buildAnswerOption(int index, String text) {
    bool isSelected = _selectedAnswerIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedAnswerIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF137FEC).withOpacity(0.05) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFF137FEC) : Colors.grey[200]!,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? const Color(0xFF137FEC) : Colors.grey[400]!,
                  width: 2,
                ),
                color: isSelected ? const Color(0xFF137FEC) : Colors.transparent,
              ),
              child: isSelected
                  ? const Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 3,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.lexend(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  color: isSelected ? const Color(0xFF137FEC) : const Color(0xFF111418),
                ),
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: Color(0xFF137FEC), size: 20),
          ],
        ),
      ),
    );
  }
}
