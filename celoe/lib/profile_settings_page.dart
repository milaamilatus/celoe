import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  // Mock State for toggles
  bool _darkMode = true;
  bool _autoDownload = true;
  bool _pushNotifications = true;
  bool _assignmentReminders = false;
  bool _emailUpdates = true;
  bool _biometrics = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F7F8).withOpacity(0.95),
        elevation: 0,
        leadingWidth: 100,
        leading: TextButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, size: 18, color: Color(0xFF137FEC)),
          label: Text('Kembali', style: GoogleFonts.lexend(fontSize: 16, fontWeight: FontWeight.w500, color: const Color(0xFF137FEC))),
          style: TextButton.styleFrom(alignment: Alignment.centerLeft, padding: const EdgeInsets.only(left: 16)),
        ),
        title: Text(
          'Pengaturan Akun',
          style: GoogleFonts.lexend(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF111418),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Section
            Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        image: const DecorationImage(
                          image: NetworkImage('https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=200&auto=format&fit=crop'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Color(0xFF137FEC),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.edit, size: 16, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Amilatus Sholehah',
                  style: GoogleFonts.lexend(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF111418),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'amilatussholehah6@gmail.com',
                  style: GoogleFonts.lexend(
                    fontSize: 14,
                    color: const Color(0xFF64748B),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF137FEC).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFF137FEC).withOpacity(0.2)),
                  ),
                  child: Text(
                    'Siswa Aktif',
                    style: GoogleFonts.lexend(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF137FEC),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Preferensi Section
            _buildSectionHeader('Preferensi'),
            _buildSectionContainer(
              children: [
                _buildListItem(
                  icon: Icons.language,
                  iconColor: Colors.orange,
                  title: 'Bahasa',
                  trailing: Row(
                    children: [
                      Text('Indonesia', style: GoogleFonts.lexend(fontSize: 14, color: const Color(0xFF64748B))),
                      const Icon(Icons.chevron_right, color: Color(0xFF94A3B8)),
                    ],
                  ),
                  onTap: () {},
                ),
                _buildDivider(),
                _buildSwitchItem(
                  icon: Icons.dark_mode,
                  iconColor: Colors.purple,
                  title: 'Mode Gelap',
                  value: _darkMode,
                  onChanged: (v) => setState(() => _darkMode = v),
                ),
                _buildDivider(),
                _buildSwitchItem(
                  icon: Icons.cloud_download,
                  iconColor: Colors.blue,
                  title: 'Unduhan Otomatis',
                  subtitle: 'Hanya via Wi-Fi',
                  value: _autoDownload,
                  onChanged: (v) => setState(() => _autoDownload = v),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Notifikasi Section
            _buildSectionHeader('Notifikasi'),
            _buildSectionContainer(
              children: [
                _buildSwitchItem(
                  icon: Icons.notifications,
                  iconColor: Colors.red,
                  title: 'Notifikasi Push',
                  value: _pushNotifications,
                  onChanged: (v) => setState(() => _pushNotifications = v),
                ),
                _buildDivider(),
                _buildSwitchItem(
                  icon: Icons.event_note,
                  iconColor: Colors.green,
                  title: 'Pengingat Tugas',
                  value: _assignmentReminders,
                  onChanged: (v) => setState(() => _assignmentReminders = v),
                ),
                _buildDivider(),
                _buildSwitchItem(
                  icon: Icons.mail,
                  iconColor: Colors.yellow[700]!, // Yellow 500 equivalent
                  title: 'Update Email',
                  value: _emailUpdates,
                  onChanged: (v) => setState(() => _emailUpdates = v),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Keamanan Section
            _buildSectionHeader('Keamanan'),
            _buildSectionContainer(
              children: [
                _buildListItem(
                  icon: Icons.lock_reset,
                  iconColor: Colors.indigo,
                  title: 'Ubah Kata Sandi',
                  trailing: const Icon(Icons.chevron_right, color: Color(0xFF94A3B8)),
                  onTap: () {},
                ),
                _buildDivider(),
                _buildSwitchItem(
                  icon: Icons.face, // Material Symbols face_2 usually maps to face or similar
                  iconColor: Colors.teal,
                  title: 'Masuk dengan Wajah',
                  value: _biometrics,
                  onChanged: (v) => setState(() => _biometrics = v),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Footer Actions
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                   // Logic for Logout
                },
                icon: const Icon(Icons.logout, color: Colors.red),
                label: Text('Keluar', style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red)),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xFFE2E8F0)),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'LMS Mobile App v1.0.2 • Build 2024',
              style: GoogleFonts.lexend(fontSize: 12, color: const Color(0xFF94A3B8)),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Text(
        title.toUpperCase(),
        style: GoogleFonts.lexend(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.0,
          color: const Color(0xFF64748B),
        ),
      ),
    );
  }

  Widget _buildSectionContainer({required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildListItem({required IconData icon, required Color iconColor, required String title, Widget? trailing, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.lexend(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF111418),
                ),
              ),
            ),
            if (trailing != null) trailing,
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchItem({required IconData icon, required Color iconColor, required String title, String? subtitle, required bool value, required ValueChanged<bool> onChanged}) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: iconColor, size: 20),
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
                if (subtitle != null)
                  Text(
                    subtitle,
                    style: GoogleFonts.lexend(
                      fontSize: 12,
                      color: const Color(0xFF64748B),
                    ),
                  ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFF137FEC),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(height: 1, thickness: 1, color: const Color(0xFFF1F5F9).withOpacity(0.8), indent: 16, endIndent: 16);
  }
}
