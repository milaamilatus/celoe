import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiscussionDetailPage extends StatelessWidget {
  final String title;
  final String author;
  final String time;
  final String content;
  final String imageUrl;

  const DiscussionDetailPage({
    super.key,
    required this.title,
    required this.author,
    required this.time,
    required this.content,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF111418)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Detail Diskusi',
          style: GoogleFonts.lexend(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF111418),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Main Post
                  Container(
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
                              radius: 20,
                              backgroundImage: NetworkImage(imageUrl),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  author,
                                  style: GoogleFonts.lexend(
                                    fontSize: 16,
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
                        const SizedBox(height: 16),
                        Text(
                          content,
                          style: GoogleFonts.lexend(
                            fontSize: 16,
                            color: const Color(0xFF111418),
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Divider(),
                        Row(
                          children: [
                            Icon(Icons.chat_bubble_outline, size: 20, color: const Color(0xFF64748B)),
                            const SizedBox(width: 8),
                            Text(
                              '2 Balasan',
                              style: GoogleFonts.lexend(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF64748B),
                              ),
                            ),
                            const SizedBox(width: 24),
                            Icon(Icons.thumb_up_outlined, size: 20, color: const Color(0xFF64748B)),
                            const SizedBox(width: 8),
                            Text(
                              'Suka',
                              style: GoogleFonts.lexend(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF64748B),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Balasan',
                      style: GoogleFonts.lexend(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF111418),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Replies (Mock)
                  _buildReplyItem(
                    'Sarah Santoso',
                    'Instructor',
                    '1 jam yang lalu',
                    'Ya, di modul 4 kita akan membahas Auto Layout secara mendalam.',
                    true,
                  ),
                  _buildReplyItem(
                    'Andi Pratama',
                    'Student',
                    '30 menit yang lalu',
                    'Ditunggu modulnya!',
                    false,
                  ),
                ],
              ),
            ),
          ),
          
          // Input Field
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey[200]!)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Tulis balasan...',
                      hintStyle: GoogleFonts.lexend(color: Colors.grey[400]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(color: Colors.grey[200]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(color: Colors.grey[200]!),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      filled: true,
                      fillColor: const Color(0xFFF8FAFC),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                CircleAvatar(
                  backgroundColor: const Color(0xFF137FEC),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white, size: 20),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReplyItem(String name, String role, String time, String content, bool isInstructor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF1F5F9)), // Indent for reply
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: isInstructor ? const Color(0xFF137FEC) : Colors.grey[300],
                child: Text(name[0], style: GoogleFonts.lexend(color: Colors.white, fontSize: 12)),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.lexend(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF111418),
                        ),
                      ),
                      if (isInstructor) ...[
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFF137FEC).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'Instructor',
                            style: GoogleFonts.lexend(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF137FEC),
                            ),
                          ),
                        ),
                      ],
                    ],
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
          const SizedBox(height: 8),
          Text(
            content,
            style: GoogleFonts.lexend(
              fontSize: 14,
              color: const Color(0xFF475569),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
