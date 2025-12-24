class Course {
  final String title;
  final String description; // subtitle or instructor depending on context
  final String image;
  final String category;
  final String status; // 'in_progress', 'not_started', 'completed', 'recommended'
  final double? progress;
  final String? progressText; // '12/16 Modul'
  final String? duration;
  final String? completedDate;
  final String? price;
  final String? originalPrice;
  final double? rating;
  final int? reviews;
  final bool isFree;

  Course({
    required this.title,
    required this.description,
    required this.image,
    required this.category,
    required this.status,
    this.progress,
    this.progressText,
    this.duration,
    this.completedDate,
    this.price,
    this.originalPrice,
    this.rating,
    this.reviews,
    this.isFree = false,
  });
}

final List<Course> mockCourses = [
  // Active Courses (Home & Course List)
  Course(
    title: 'Dasar Pemrograman Python',
    description: 'Bab 3: Struktur Data & Array',
    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD9fbwKkzea-anX24IvyD0YyZu3yZJoqP-DZUyN98BQMtrym1oJeoLIspYqf5rB2w51Kq2_C9ki_9rePGi5Hk_F_rIRZm3O7xICZ3B2vW7AjLgJZisAOgf8y2wNyxd44DSo08c56r64REYC4BMCvl6eUwp69NO9c60HwHA7DyPYURUr8mlT1VOKCdb9FaDSsXQNua4ihdqsH0lX0KQLLSVB-zZnTq-ON-8WO06YRIa0U025kWg0avxdgbK9TQhtSP52725S2yC_XkU',
    category: 'Pemrograman',
    status: 'in_progress',
    progress: 0.75,
    progressText: '12/16 Modul',
  ),
  Course(
    title: 'Desain UI/UX Modern',
    description: 'Bab 2: Teori Warna',
    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBnxsGIatevanjIPqasTUpBOLdZm716rt3Oe8hdWvr6MibQ7PWVas7PV4traWWL4PBhaYxZjDvtzi2WYC4jEaJM27PNsde0ITpE0i58jQHMzzLiDw87NaWPJObfot-Yad9CSnDf4qvtdhLbQS10SHThOa0vvGtn417QBQcSj_hzQnjWimKD3NNPr2GaUgYB2Pd5f2ryy0QdE9O1Zkm09yqaz_MHQSzYJdV-eTZB5EFTLHwN1MThmwS9aX3Jf-wltomFlMqKtgW2CW4',
    category: 'Desain',
    status: 'in_progress', // Changed to in_progress to match Home Page logic
    progress: 0.40,
    progressText: '4/10 Modul',
  ),
  Course(
    title: 'Agile Project Management',
    description: 'Metodologi scrum dan manajemen tim yang efektif.',
    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDUwlXNMfTWY30yYHjKChPRDGCw_FEsjeJalqoHsXmURaafYns96JSczb6NQQswBXwaSN5HWD6olAlgbda1UdKDqlrXmHXCfMmMrwusJxzgMDrXGMiO38V2gC3BCdMT3enRfglNg_sTioXWTt6EHPzKIlAP_doAyBTGp9Wn7uVvcXIdReVuiaBhk_lFFgL4CHlDzknPVRSlbh8AGi7y29zkRzSEo20iYmyu_lscdtr-BnbQHlndJcqdsewcFdJs29OJbPGk6arrAok',
    category: 'Bisnis',
    status: 'in_progress',
    progress: 0.90,
    progressText: 'Final Quiz',
  ),
  
  // Not Started
  Course(
    title: 'Desain UI/UX Mobile App (Lanjutan)',
    description: 'Mastering Figma dan prinsip desain antarmuka pengguna.',
    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBOgt2U46FZUV2kYOScYjNv5xMER9ao2PElZZp6p701ByG_BJraYnlfGA6yW0TvTq59qLLVIHPjY7IQ4D1eA7GQttUJX24qZRBxf_QZeZZHPxvaHy58qslMdEGje03GV23HAD1qL19OoFcyCkyA0OA33e6iMi3shMbpBmrIgD3-pQGTE_0UJDTMAWJW4fKYFQnRclCqT-H6T3M5ODNAq31c4pmtOArNvIOCwwo9PKmh2KC6h-8DQNH-dxeFEt8JblY_wWjXEMnPfBs',
    category: 'Desain',
    status: 'not_started',
    duration: '4j 30m',
  ),

  // Completed
  Course(
    title: 'Data Science Intro',
    description: 'Pengenalan Big Data dan analisis statistik dasar.',
    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDykKPgjT8W4Y1LhREc0I7gSRe5dF0sUxl9YSh1xhmPCY8QbMzARfR1wauIQT3Sy0-ph1Y01UNdRXLmsQB5Qj-1EfcEKfySxSxdgxRlAgTTbhsJQ6zmXwQ93L_ChwfPnkd_VhHWTTN62-FU6WmElxzo-9QlXBNJV_YczhXrr4X9NnLODpWAeOCzthGhn80ccsdScW5G1fpIHNWr2ADhaGAXC4gHthxXxLxkQ_w5vzHl35nopljX0sN1NbYK3OUdxL9PpdaSaDc4Urk',
    category: 'Data',
    status: 'completed',
    completedDate: '12 Okt 2023',
  ),

  // Recommendations
  Course(
    title: 'Analisis Data Bisnis untuk Pemula',
    description: 'Oleh Dr. Andi Wijaya',
    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuC1lW4hycHUcCygkOKCuKf3I0iCwcEWFobDkmWHGwk_IsNqCQDoJyyR4sOQnYesdwDR2rOV_vrgKk6S-dFnbXtQRYv63KaZXOXl3GUsA73T14RSUpLYOfzpOESn6sZO-egRaEv9KeEKomhXDfcAMMEKeSQklvKv9mskKWQBBAvUp09Nq97iI5BQXUyz-p4zRdyfx1ZpeY1h4vzSKr3tFGJ0tfVS26K4ZwVDx0EOHTzq3GTRcL_XPIDFdCtePoqQZq66zL9YRSUfynk',
    category: 'Bisnis',
    status: 'recommended',
    rating: 4.8,
    reviews: 120,
    price: 'Gratis',
    isFree: true,
  ),
  Course(
    title: 'Masterclass Digital Marketing 2024',
    description: 'Oleh Sarah Putri',
    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDVE_hfdAR3KFfM9oqnrY0C9qPw-uKpK06TxQgOlywu3eHrXSGdSqgjDSqHQfbVu5BejRFHqbsB50Jk42S0hkYw-dnE8zqeE2lmKCXBvN4uBZdFBAI02nPV2uYgsjoTRO7rc-QwA8UZc-bs_VqJswSUPpbrPJwwK3-bX669G_WkuOvv30U37HzxY0DzEOT0gaRM0gID7bbHtZSesIHlQR1GphYkOfhkNFkItbS-i3WXxQU9NQiQyv_-uR5DisqbVnLwrQ9lzy2LVuM',
    category: 'Marketing',
    status: 'recommended',
    rating: 4.9,
    reviews: 85,
    price: 'Rp 150k',
    originalPrice: 'Rp 500k',
    isFree: false,
  ),
];
