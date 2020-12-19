class Category {
  Category({
    this.title = '',
    this.imagePath = '',
    this.classCount = 0,
    this.faculty = '',
  });

  String title;
  int classCount;
  String faculty;
  String imagePath;

  static List<Category> categoryList = <Category>[
    Category(
      imagePath: 'assets/cn.png',
      title: 'Computer Networks',
      classCount: 24,
      faculty: 'KS',
    ),
    Category(
      imagePath: 'assets/unix.png',
      title: 'Unix System\nProgramming',
      classCount: 20,
      faculty: 'SAN',
    ),
    Category(
      imagePath: 'assets/interFace1.png',
      title: 'Adv Algorithms',
      classCount: 24,
      faculty: "GRP",
    ),
    Category(
      imagePath: 'assets/interFace2.png',
      title: 'IOT',
      classCount: 22,
      faculty: "PMK",
    ),
  ];

  static List<Category> newsList = <Category>[
    Category(
      imagePath: 'assets/interFace3.png',
      title: 'Offline Exams Cancelled',
      faculty: 'Principal\nOffice',
    ),
    Category(
      imagePath: 'assets/interFace4.png',
      title: 'Web Design Workshop',
      faculty: 'ISE Dept',
    ),
    Category(
      imagePath: 'assets/interFace1.png',
      title: 'Interview Prep Workshop',
      faculty: 'Placement\nDept',
    ),
    Category(
      imagePath: 'assets/interFace2.png',
      title: 'Protocol Day',
      faculty: 'CSE Dept',
    ),
  ];
}
