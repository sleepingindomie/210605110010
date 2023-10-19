// ignore_for_file: must_be_immutable

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tokobukusederhana/screens/Home.dart';
import 'package:tokobukusederhana/screens/LoginPage.dart';
import 'package:tokobukusederhana/screens/CheckoutPage.dart';
import 'package:tokobukusederhana/screens/DescPage.dart';
import 'package:tokobukusederhana/screens/OrderPage.dart';

class LandingPage extends StatefulWidget {
  bool isLoggedIn;
  String? loggedInUsername;

  LandingPage({
    Key? key,
    required this.isLoggedIn,
    this.loggedInUsername,
  }) : super(key: key);

  

  @override
  _LandingPageState createState() => _LandingPageState();
  
}

class _LandingPageState extends State<LandingPage> {
  bool _isGridView = false;
  List<Map<String, dynamic>> cartItems = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _getRandomProfileImage() {
    final random = Random();
    final profiles = ['assets/images/profil/cowo.jpg', 'assets/images/profil/cewe.jpg'];
    return profiles[random.nextInt(profiles.length)];
  }
  final List<Map<String, dynamic>> items = [
    {
      'category': 'Pendidikan',
      'items': [
        {
          'title': 'Pengantar Pemrograman Dart dan Flutter',
          'description': 'Flutter dan Dart adalah jalan pintas yang Anda butuhkan untuk membuat aplikasi android selain memanfaatkan Java. Buku ini memberi pengantar ringkas bagaimana memahami framework Flutter dan bahasa pemrograman Dart dari sudut pandang programmer pemula. Tidak memandang apakah anda pernah mempelajari bahasa pemrograman lainnya atau belum? buku ini cocok untuk dibaca sebab mengupas secara ringkas, singkat, dan tepat. Apabila anda memiliki rencana untuk membuat aplikasi android, mulailah selangkah lebih maju dengan membaca buku ini. Jadi tunggu apa lagi, ayo temukan kemudahan yang ditawarkan oleh bahasa pemrograman Dart',
          'image': 'assets/images/pendidikan/flut.jpg',
          'price': 'Rp 49.000',
          'author': 'Jubilee Enterprise',
          'publishDate': '10 Maret 2021',
          'numberOfPages': '106 halaman',
        },
        {
          'title': 'Informatika Smp/Mts Kls.Vii/K2021',
          'description': 'Buku Informatika SMP/MTs Kelas VIIini ditujukan bagi peserta didik SMP dan MTs yang ingin memahami Informatika secara lebih mendalam. Buku ini menyajikan materi esensial, kegiatan, dan soal-soal yang akan membantu peserta didik mencapai hasil pembelajaran secara holistik, baik dari aspek kompetensi kognitif maupun nonkognitif untuk mewujudkan Profil Pelajar Pancasila. Buku ini mengacu pada Kurikulum Merdeka. Di dalamnya terdapat fitur-fitur seperti: Tujuan Pembelajaran, Profil Pelajar Pancasila, Kata Kunci, TechnoWord, Shortcut, InfoTech, Contoh Soal dan Pembahasan, Rangkuman, Refleksi, Uji Pemahaman, Latihan Soal Akhir Bab, dan Uji Capaian Pembelajaran, Soal Model AKM, serta Praproyek',
          'image': 'assets/images/pendidikan/infsmp.jpg',
          'price': 'Rp 115.000',
          'author': 'Erlangga',
          'publishDate': '09 Jun 2022',
          'numberOfPages': '320 halaman',
        },
        {
          'title': 'The Magic of Blender',
          'description': 'Blender adalah software open source untuk modelling, Animasi 3 Dimensi handal yang menjadi andalan animator & digital artist profesional. Hasil rendernya biasa diterapkan pada Film, Iklan, Game, Arsitektur, Edukasi dll. Blender biasa digunakan oleh animator profesional, desainer grafis, arsitek, desainer interior, desainer produk, video editor atau effects, game programmer dll. Popularitasnya di indonesia sudah mengalahkan seniornya 3D Studio Max dan Maya. Buku Magic Of Blender 3D Animation ini menggunakan bahasa yang sederhana, memiliki gambar di setiap langkah dan video tutorial, maka saat belajar buku ini akan menjadi mudah dan menyenangkan. Dengan mempelajari Buku Magic Of Blender 3D Animation ini, visualisasi 3D anda bisa menyihir banyak orang. Its magic!',
          'image': 'assets/images/pendidikan/blender.jpg',
          'price': 'Rp 220.000',
          'author': 'Hendi H.',
          'publishDate': '09 Juli 2022',
          'numberOfPages': '598 halaman',
          
        },
        {
          'title': 'Dasar-Dasar Teknik Informatika',
          'description': 'Buku Teknik Informatika yang berjudul Dasar-Dasar Teknik Informatika merupakan karya dari Novega Pratama Adiputra. Buku ini bermanfaat bagi Siswa/Mahasiswa agar memiliki pengetahuan dan pengalaman dalam menggunakan teknologi informasi dan komunikasi dalam kegiatan perkuliahan, bekerja serta menerapkan dan menggunakannya dalam kehidupan sehari-hari, bahkan bisa juga dikembangkan menjadi kegiatan wira usaha. Buku Dasar-Dasar Teknik Informatika mencakup bahasan mengenai teknologi informasi yang digunakan untuk mengolah data, termasuk memproses, mendapatkan, menyusun, menyimpan, memanipulasi data dalam berbagai cara untuk menghasilkan informasi yang berkualitas, yaitu informasi yang relevan, akurat, dan tepat waktu',
          'image': 'assets/images/pendidikan/infor.jpg',
          'price': 'Rp 86.000',
          'author': 'Novega P.A.',
          'publishDate': '2020',
          'numberOfPages': '128 halaman',
        },
      ],
    },
    {
      'category': 'Novel',
      'items': [
        {
          'title': 'Harry Potter and The Deathly Hallows',
          'description': 'Harry Potter dan Relikui Kematian adalah novel fantasi karangan penulis Inggris, J. K. Rowling, yang merupakan novel ketujuh sekaligus terakhir dalam seri Harry Potter. Novel ini dirilis pada 14 Juli 2007 oleh Bloomsbury di Inggris, oleh Scholastic di Amerika Serikat, dan oleh Raincoast Books di Kanada.',
          'image': 'assets/images/novel/potter.png',
          'price': 'Rp 229.500',
          'author': 'Bloomsbury',
          'publishDate': '03 Mei 2019',
          'numberOfPages': '640 halaman',
        },
        {
          'title': 'Maze Runner The Scorch Trials',
          'description': 'Thomas yakin bahwa melarikan diri dari Labirin akan berarti kebebasan baginya dan para Gladers. Tetapi WICKED belum selesai. Fase Dua baru saja dimulai. The Scorch. Para Gladers memiliki dua minggu untuk melintasi The Scorch—bagian dunia yang paling terbakar. Dan WICKED telah memastikan untuk mengatur variabel dan menumpuk peluang melawan mereka. Ada orang lain sekarang. Kelangsungan hidup mereka bergantung pada kehancuran para Gladers—dan mereka bertekad untuk bertahan hidup. Persahabatan akan diuji. Kesetiaan akan terputus. Semua taruhan dibuka.',
          'image': 'assets/images/novel/runner.jpeg',
          'price': 'Rp 85.000',
          'author': 'James Dashner',
          'publishDate': '04 Agustus 2015',
          'numberOfPages': '384 halaman',
        },
        {
          'title': 'Negeri 5 Menara',
          'description': 'Man Jadda Wajada, siapa yang sungguh-sungguh akan berhasil. Kalimat itu bukan hanya “mantra” dalam cerita novel Negeri 5 Menara. Kata-kata juga dimaknai seutuhnya selama pembuatan filmnya oleh mereka yang terlibat. Buku ini menyajikan rangkaian kisah di balik sorot kamera; keringat, air mata, juga tawa milik mereka yang telah bahu-membahu menciptakan sebuah karya layar lebar.Simak perjalanan yang meliputi serunya perburuan pemeran Sahibul Menara, upaya menembus Pondok Modern Gontor, hingga gerilya syuting di London. Kisah kisah di balik layar ini akan melengkapi dan menjadi kesaksian terwujudnya sebuah keyakinan: Man Jadda Wajada.',
          'image': 'assets/images/novel/menara.jpg',
          'price': 'Rp 50.000',
          'author': 'A. Fuadi',
          'publishDate': 'Februari 2013',
          'numberOfPages': '440 halaman',
        },
        {
          'title': 'Negeri Di Ujung Tanduk',
          'description': 'Kisah Negeri Di Ujung Tanduk ini merupakan lanjutan dari perjalanan Thomas dan teman-temannya dalam memperjuangkan kebenaran. Dengan setting waktu setahun setelah peristiwa Om Liem, Thomas kembali menjalankan kehidupannya di negeri yang berada pada tanduk demokrasi.',
          'image': 'assets/images/novel/negeri.jpg',
          'price': 'Rp 84.000',
          'author': 'Tere Liye',
          'publishDate': 'November 2018',
          'numberOfPages': '788 halaman',
        },
      ],
    },
    {
      'category': 'Anak-anak',
      'items': [
        {
          'title': 'Tanya Jawab Seru Tentang Hutan Hujan',
          'description': 'Buku ini membahas berbagai hal menarik tentang hutan hujan, mulai dari pengenalan hutan hujan, makhluk-makhluk yang hidup di sana seperti elang harpy dan kungkang, hingga fungsi penting hutan hujan bagi dunia. Buku ini dilengkapi dengan ilustrasi lucu yang memungkinkan anak-anak membayangkan kehidupan di dalam hutan hujan. Pertanyaan-pertanyaan yang diajukan dijawab dengan singkat dan mudah dipahami oleh anak-anak. Buku ini mengajak pembaca menjelajahi keindahan dan keanehan hutan hujan dengan fakta-fakta seru dan mencengangkan. Sebuah pilihan tepat bagi orangtua yang ingin meningkatkan pengetahuan anak tentang hutan hujan. Dapatkan segera buku ini untuk pengalaman membaca yang menyenangkan!',
          'image': 'assets/images/anak/tanyajawab.jpg',
          'price': 'Rp 49.000',
          'author': 'Anne Rooney',
          'publishDate': '22 Agustus 2022',
          'numberOfPages': '32 halaman',
        },
        {
          'title': 'Mewarnai + Stiker: Dinosaurus',
          'description': 'Berisi 35 gambar dinosaurus yang bisa diwarnai, juga fakta-fakta seru tentang mereka. Dari Ankylosaurus, Brontosaurus, sampai Tyrannosaurus rex yang sangat terkenal, anak-anak bisa mewarnai dinosaurus favorit mereka di buku mewarnai ini. Dengan garis yang tebal dan gambar yang besar, buku ini sangat cocok untuk meningkatkan kemampuan motorik anak prasekolah. Ada stiker dino lucu yang bisa ditempel sesuka hati.',
          'image': 'assets/images/anak/mewarnai.jpg',
          'price': 'Rp 49.000',
          'author': 'Kanaya L.',
          'publishDate': '18 November 2022',
          'numberOfPages': '40 halaman',
        },
      ],
    },
    {
      'category': 'Biografi',
      'items': [
        {
          'title': 'Biografi Ibnu Khaldun',
          'description': 'Sang ulama multidisipliner. Di Timur, Ibnu Khaldun disebut al-Allamah (Mahaguru). Di Barat, digelari the Polymath (penghimpun berbagai bidang pengetahuan). Namun, di atas segalanya, ia menelaah semua kajiannya dengan kadar ilmiah yang tinggi, dan tak diragukan lagi sangat berkontribusi atas perkembangan ilmu pengetahuan manusia.Lahir di Tunisia pada 732 H/1332 M, ia langsung menghadapi berbagai kemelut sosial-politik yang terjadi di depan matanya. Dengan terombang ambing dalam berbagai konflik, ia menjalani kehidupannya dengan penuh bahaya dan petualangan. Terkadang, ia menang; di lain waktu ia kalah. Yang mengagumkan, dalam kondisi demikian la mampu menelurkan karya-karya brilian. Mulai dari sejarah, sosiologi, hingga ilmu agama. Terinspirasi metode Ibnu Khaldun, penulis menceritakan perikehidupan Sang Sejarawan dengan berimbang. Ditopang kajian literatur yang kuat, buku ini menghadirkan kehidupan Ibnu Khaldun apa adanya.',
          'image': 'assets/images/biografi/khaldun.jpeg',
          'price': 'Rp 40.000',
          'author': 'Serambi Ilmu Semesta',
          'publishDate': '01 Februari 2013',
          'numberOfPages': '224 halaman',
        },
        {
          'title': 'AYAH.....: Kisah Buya Hamka',
          'description': '"Buya Hamka merupakan ulama dan mubaligh yang hebat. Banyak ulama besar, tap tidak menjadi mubaligh yang besar. Saya pernah mendengar ceramah beliau ketika di Makasar sebanyak 36 kali ceramah, dan tidak ada satu pun yang sama. Hebat sekali," H. Muhammad Jusuf Kalla, Ketua Umum Pimpinan Pusat Dewan Masjid Indonesia/Mantan Wakil Presiden. Buku ini memuat serangkaian kisah tentang Buya Hamka di mata putra kelimanya, Irfan Hamka, yang meliputi kehidupa masa kecil, remaja, dewasa, berkeluarga, hingga memiliki 12 orang anak; memulai jalan dakwah sebagai politisi, sastrawan, dan ulama; akidah dan pedoman hidup Buya Hamka; hubungan Buya Hamka dengan masjid al-Azhar; bagaimana kehidupan Buya Hamka saat istrinya meninggal; menghadapi fitnah, kebencian, dan penjara; hingga Buya Hamka meninggal dunia. Semua kisah diceritakan dan dikemas dalam tulisan yang ringan, mengalir, dan sarat dengan pesan moral dan keteladanan. Pengantar Taufiq Ismail semakin melengkapi keindahan buku ini.',
          'image': 'assets/images/biografi/ayah.jpeg',
          'price': 'Rp 45.000',
          'author': 'Irfan Hamka',
          'publishDate': '13 Oktober 2013',
          'numberOfPages': '349 halaman',
        },
        {
          'title': '100 Tokoh Paling Berpengaruh Sepanjang Sejarah',
          'description': 'Siapakah yang paling berpengaruh dalam sejarah? Hart menyusun daftar urut (ranking) seratus tokoh dengan argumentasi yang meyakinkan,tapi juga mengundang perdebatan. Apa alasan Hart menempatkan Nabi Muhammad pada ranking pertama? Mengapa pula Nabi Isa menempati ranking ke-3, sementara Isaac Newton ranking ke-2? John F. Kennedy termasuk ke dalam seratus tokoh, tapi mengapa Mahatma Gandhi tidak? Siapa yang lebih berpengaruh, Karl Marx atau Kong Hu-Cu? Umar bin Khathab atau Alexander Yang Agung? 100 Tokoh penuh dengan argumentasi, penuh pula dengan humor, diterjemahkan dengan gaya kocak Mahbub Djunaidi.',
          'image': 'assets/images/biografi/tokoh.jpeg',
          'price': 'Rp 96.000',
          'author': 'Mahbub Djunaidi',
          'publishDate': 'Tahun 1978',
          'numberOfPages': '500 halaman',
        },
        {
          'title': 'Elon Musk: Pria di Balik Paypal, Tesla, SpaceX, dan Masa Depan yang Fantastis',
          'description': 'Di dunia ini, hanya sedikit industrialis dalam sejarah yang mampu menyamai visi jenius dan ambisi Musk dalam hidupnya. Bagaikan perpaduan versi modern dari Thomas Edison, Henry Ford, dan Steve Jobs, Musk merupakan orang dibalik PayPal, Tesla Motors, SpaceX, dan SolarCity yang telah menggemparkan industri dan bisnis di Amerika. Ditulis dengan akses ekslusif Vance terhadap Musk, keluarga, dan teman-temanya, buku ini menyusuri jejak perjalanannya dari masa-masa sulit Musk di Afrika Selatan, hingga pendakian ke puncak karirnya di bisnis global dunia. Ketika buku ini tiba di tanganmu, sangat mungkin bahwa Musk dan SpaceX telah berhasil mendaratkan sebuah roket dari luar angkasa pada sebuah landasan yang mengapung di lautan, atau kembali pada landasan peluncurannya di Florida. Vance menghabiskan waktu lebih dari 50 jam berbincang dengan Musk dan mewawancarai sekitar tiga ratus orang untuk menceritakan jatuh bangun dan riuh rendah yang terjadi dalam kehidupan Musk untuk membangun semua perusahaannya, menggambarkan sosok seorang Musk, seorang pria kompleks yang telah memperbaharui industri Amerika dan memancarkan level baru dari sebuah inovasi-yang tentu saja membuat dirinya memiliki banyak musuh di sepanjang perjalanan karirnya. Di saat banyaknya perusahaan Amerika yang lebih tertarik mengejar keuntungan bisnisnya dengan cara yang mudah, daripada harus mengambil resiko besar dengan mengusahakan sebuah teknologi radikal, Musk berdiri dengan tegap dan menjadi satu-satunya pebisnis yang mengambil alih-bahkan merevolusi-tiga bidang industri sekaligus. Buku ini bukan sekedar membahas tentang bisnis. Musk telah menguasai seni untuk memaksimalkan potensi dari seluruh karyawannya. ',
          'image': 'assets/images/biografi/elonmusk.jpeg',
          'price': 'Rp 55.000',
          'author': 'Ashlee Vance',
          'publishDate': '04 Juli 2017',
          'numberOfPages': '460 halaman',
        },
      ],
    },
    {
      'category': 'Bimbingan Belajar',
      'items': [
        {
          'title': 'The King TOEFL',
          'description': 'Buku ini memuat semua materi dan bank soal yang biasa diujikan pada saat Tes TOEFL dan dibahas dengan jelas. Buku ini memiliki uraian materi terlengkap, terdiri dari: 8 Paket Soal Prediksi (TOEFL Like) + Answer Key, Vocabulary Corner, Grammar Overview, Full Paket Soal + Pembahasan TOEFL, Full Skrip + Audio Listening TOEFL, Tips dan Trik Menyelesaikan Soal TOEFL',
          'image': 'assets/images/bimbel/king.jpeg',
          'price': 'Rp 145.000',
          'author': 'TIM TOEFL ELC-Internasional',
          'publishDate': '01 Januari 2018',
          'numberOfPages': '544 halaman',
        },
        {
          'title': 'Bank Soal Psikotes Matematika',
          'description': 'Jangan remehkan psikotes matematika yang sebentar lagi akan Anda hadapi. Sekalipun mungkin terlihat sepele, psikotes sangat berperan penting dalam menentukan masa depan. Psikotes ini digunakan untuk mengukur kepribadian seseorang sehingga tidak heran jika psikotes matematika sering muncul saat tes melamar kerja, tes kenaikan jabatan, tes masuk perguruan tinggi, tes pengajuan beasiswa, tes masuk BUMN, dan tes masuk CPNS. Psikotes matematika beda jauh dengan matematika yang dipelajari di sekolah. Penilaiannya bukan berdasarkan siapa yang lebih pintar, karena bisa saja orang yang langganan ranking 1 di kelas atau meraih IPK cumlaude, justru gagal dalam psikotes matematika. Kunci menaklukkan psikotes matematika cuma satu, berlatih mengerjakan soal sebanyak-banyaknya, dengan waktu yang dibatasi. Dan, buku ini siap membantu Anda karena berisi lebih dari 250 soal tes dan pembahasan',
          'image': 'assets/images/bimbel/mtk.jpeg',
          'price': 'Rp 40.000',
          'author': 'Bagus Triyanto S.T, M.m',
          'publishDate': '21 Maret 2018',
          'numberOfPages': '188 halaman',
        },
        {
          'title': 'Buku Pintar Tes Kemampuan Dasar Untuk CPNS, BUMN, dan Swasta',
          'description': 'Buku Tes Kompetensi Dasar (TKD) ini adalah salah satu perangkat tes bagian pertama yang harus dilalui peserta ujian CPNS, BUMN atau Swasta setelah lulus seleksi administrasi. Walaupun pelaksanaan Tes Kompetensi Dasar (TKD) sepenuhnya menjadi wewenang pemerintah pusat untuk merekrut peserta CPNS, namun Tes Kompetensi Dasar (TKD) ini juga dipergunakan sebagai alat untuk merekrut pegawai BUMN dan Swasta. Bagi peserta yang lulus Tes Kompetensi Dasar (TKD), mereka berhak untuk mengikuti tahapan tes CPNS, BUMN, dan Swasta berikutnya, yaitu Tes Kompetensi Bidang (TKB). Namun untuk jurusan tertentu, peserta tidak perlu lagi mengikuti Tes Kompetensi Bidang (TKB), artinya setelah lulus TKD, yang bersangkutan sudah dinyatakan lulus untuk menjadi pegawai negeri sipil (PNS), BUMN ataupun Swasta.',
          'image': 'assets/images/bimbel/cpns.jpeg',
          'price': 'Rp 69.000',
          'author': 'Muhammad Jauhar, S.Pd.',
          'publishDate': '16 Maret 2020',
          'numberOfPages': '168 halaman',
        },
        {
          'title': 'Strategi dan Bank Soal JLPT Japanese Language Proficiency Test N5-N3: JLPT',
           'description': 'JLPT (Japanese Language Proficiency Test), atau Nihongo Noryoku Shiken disebut juga dengan UKBJ (Uji Kompetensi Bahasa Jepang), adalah tes untuk menguji kemampuan Bahasa Jepang.',
          'image': 'assets/images/bimbel/jlpt.jpeg',
          'price': 'Rp 120.000',
          'author': 'Irma Nirmala',
          'publishDate': '04 Agustus 2020',
          'numberOfPages': '760 halaman',
        },
      ],
    },
    {
      'category': 'Bahasa Asing',
      'items': [
        {
          'title': 'Bahasa Mandarin itu Gampang',
          'description': 'Kebutuhan akan bahasa asing memang sangat penting bagi hampir setiap orang. Sebab, memiliki kemampuan untuk mengusai lebih dari satu bahasa asing akan meningkatkan keahlian Anda dalam berpikir serta memberikan Anda peluang yang banyak dalam dunia pendidikan dan karier. Pepatah kuno mengatakan, "Belajar merupakan sebuah warisan yang akan mengikuti pemiliknya di mana pun berada." Artinya, seseorang yang belajar suatu ilmu akan menuai manfaat dari apa yang telah ia pelajari dan ilmu tersebut akan sangat berguna sepanjang perjalanan hidupnya. Bahasa Mandarin adalah bahasa yang sedang banyak digemari oleh para pembelajar bahasa khususnya yang ingin bekerja di perusahaan-perusahaan Tiongkok yang banyak bertebaran di Indonesia. Dengan menguasai bahasa ini, diharapkan komunikasi dengan atasan dapat lebih optimal. Buku ini hadir di hadapan Anda sebagai pegangan pokok dalam mempelajari bahasa Mandarin, khususnya bagi para pemula hingga menengah. Buku ini disajikan dengan materi belajar bahasa Mandarin yang meliputi tata bahasa, kosakata, dan percakapan sehari-hari dalam sangat bermanfaat dan esensial.',
          'image': 'assets/images/bahasa/mandarin.jpeg',
          'price': 'Rp 27.000',
          'author': 'Rina Hidayati',
          'publishDate': '25 November 2019',
          'numberOfPages': '160 halaman',
        },
        {
          'title': 'Tata Bahasa Korea',
          'description': 'Tata Bahasa Korea Song Won untuk Berbicara adalah teks klasik untuk mempelajari cara berbicara dan menulis bahasa Korea. Sebagai guru yang terbukti, bersemangat, dan berdedikasi, Song Won telah menyempurnakan sistem pembelajaran bahasanya di kelas. Sekarang, dia akhirnya memasukkan metode yang sama ke dalam buku teks yang informatif dan mudah dipahami. Tata Bahasa Korea untuk Berbicara diatur secara metodis dan dipecah menjadi unit-unit terpisah. Pada awalnya, siswa akan membangun sebuah yayasan dengan mempelajari cara membaca, menulis, dan mengucapkan Hangul (alfabet Korea). Dari sana, siswa akan belajar segalanya dari sistem penghitungan dan menyajikan kata kerja tegang, hingga konsep tata bahasa yang lebih kompleks dan rumit. Dalam setiap unit, akan ada daftar kosa kata, berbagai macam masalah praktik, dan kuis akhir unit. Buku teks pembelajaran bahasa yang komprehensif ini akan membuat Anda berbicara, membaca, dan menulis bahasa Korea dalam waktu singkat! Seiring dengan tata bahasa Korea, buku teks ini akan mengajarkan siswa kata-kata kosa kata penting yang berguna dalam banyak situasi sehari-hari yang umum. Ini juga akan menyoroti bahasa gaul dan bahasa sehari-hari Korea. Metode pembelajaran bahasa Song Won berbeda dari buku teks klasik dan tradisional. Buku ini akan membuat siswa berpikir dan merespons secara organik dalam bahasa Korea. Tujuan dari Tata Bahasa Korea untuk Berbicara adalah untuk membuat siswa fasih berbahasa Korea dalam waktu enam bulan. Meskipun belajar bahasa Korea akan menjadi tantangan, itu adalah tantangan yang akan menghadiahkan siswa berkali-kali lipat.',
          'image': 'assets/images/bahasa/korea.jpeg',
          'price': 'Rp 168.000',
          'author': 'Songwon',
          'publishDate': '16 April 2019',
          'numberOfPages': '199 halaman',
        },
        {
          'title': 'Pengantar Penerjemah',
          'description' : 'Tuntutan capaian pembelajaran vokasional yang dirancang demi memenuhi tujuan-tujuan spesifik sesuai analisis kebutuhan industri menjadi pertimbangan kedalaman bahasan dalam setiap bab, selain keterbatasan jumlah jam pembelajaran terjemahan dalam keseluruhan masa studi. Sekalipun demikian, tantangan tersebut diharapkan tidak mengurangi tujuan besar bahwa buku ini mampu berperan sebagai pegangan yang memadai bagi mahasiswa vokasional yang lebih banyak menjalankan proses pembelajaran yang mendekati problem based learning. Di dalam buku ini juga diberikan petunjuk-petunjuk praktis agar mahasiswa mendapatkan gambaran secara lebih mendetail mengenai berbagai metode dan teknik penerjemahan yang efektif di dunia kerja pengalihbahasaan, serta latihan-latihan menerjemahkan teks yang dapat dilakukan baik di dalam kelas maupun di luar kuliah. Kami berharap agar setelah membaca isi buku ini dan menerapkan metode-metode yang diajarkan, para pemula dalam penerjemahan menjadi lebih percaya diri untuk mencoba berkarir sebagai penerjemah.',
          'image': 'assets/images/bahasa/terjemah.jpeg',
          'price': 'Rp 44.000',
          'author': 'Cisya Dewantara Nugraha',
          'publishDate': '22 Januari 2011',
          'numberOfPages': '106 halaman',
        },
        {
          'title': 'Kamus Jamak Taksir: Arab-Indonesia, Indonesia-Arab',
          'description': 'Bahasa Arab adalah bahasa yang sangat kaya dengan kaidah atau ketentuan mengenai penjamakan nomina (isim). Ada dua jenis jamak di dalam bahasa Arab, yakni jamak salim (beraturan) dan jamak taksir (jamak tidak beraturan/broken plural). Untuk jamak beraturan ini ada dua jenis, yakni jamak muddzakar salim untuk pembentukan jamak nomina jenis laki-laki (maskulin) dan jamak muannas salim untuk pembentukan jamak nomina jenis perempuan (feminin). Adapun jamak taksir pembentukannya dilakukan dengan beberapa cara, yakni dengan (a) penambahan huruf, (b) dengan pengaturan huruf, (c) dengan perubahan harakat, (d) dengan penambahan huruf sekaligus perubahan harakat, (e) dengan pengurangan huruf sekaligus perubahan harakat, dan (f) didapatkan juga penjamakan dengan cara matematis. ',
          'image': 'assets/images/bahasa/arabindo.jpeg',
          'price': 'Rp 52.000',
          'author': 'Syamsul Hadi',
          'publishDate': '18 Mei 2018',
          'numberOfPages': '540 halaman',
        },
        {
          'title': 'Kosakata Percakapan Sehari hari Bahasa Jepang',
          'description': 'Buku ini dilengkapi daftar kosakata yang fokus pada kebutuhan pembaca, bisa untuk kepentingan tinggal jangka pendek, tetapi juga tidak menutup kemungkinan bagi pembaca yang berencana tinggal jangka panjang. Pastinya akan sangat merasa terbantu dengan adanya buku ini. Setiap temanya diawali daftar kosakata, kemudian kalimat kalimat praktis, dilanjutkan dengan dialog-dialog yang sangat mudah ditangkap maknanya. Dilengkapi juga dengan karikatur untuk pemahaman situasinya. Semua kosakatanya, bisa digunakan secara langsung. Karena itu sangat mudah dan memang diupayakan agar tidak terlalu panjang, dimaksudkan agar mudah dipahami artinya. Semua tema-tema, fokus pada hal-hal yang bakal ditemui sehari-hari.',
          'image': 'assets/images/bahasa/jepang.jpeg',
          'price': 'Rp 35.000',
          'author': 'Dra.Parastuti, M.Pd, M.Ed.',
          'publishDate': '14 Juli 2020',
          'numberOfPages': '280 halaman',
        },
      ],
    },
    {
      'category': 'Komik',
      'items': [
        {
          'title': 'Naruto Vol. 64',
          'description': 'Kakashi goyah begitu mengetahui identitas si laki-laki bertopeng ternyata Obito, teman lamanya. Untungnya, kalimat “Aku takkan membiarkan teman-temanku terbunuh!!” dari Naruto kembali membangkitkan semangatnya. Naruto bersama kawan - kawan pun mengerahkan serangan… Tapi, Jubi akhirnya berhasil dibangkitkan!!',
          'image': 'assets/images/komik/naruto.jpg',
          'price': 'Rp 35.000',
          'author': 'Mashashi K.',
          'publishDate': '07 Mei 2014',
          'numberOfPages': '142 halaman',
        },
        {
          'title': 'One Piece Vol. 84',
          'description': 'Apa Sanji yang telah kehabisan akal untuk kabur karena cara kotor, bakal menjadi alat pernikahan politik? Sementara itu, bagaimana nasib rombongan Luffy yang bertarung dengan petinggi Big Mom untuk merebut Sanji kembali? Simak kelanjutan kisah petualangan di lautan, One Piece!!',
          'image': 'assets/images/komik/onepiece.jpg',
          'price': 'Rp 35.000',
          'author': 'Eiichiro Oda ',
          'publishDate': '13 Januari 2022',
          'numberOfPages': '192 halaman',
        },
        {
          'title': 'Jujutsu Kaisen Vol. 11',
          'description': 'Peron bawah tanah Stasiun Shibuya dipenuhi warga sipil dan manusia yang telah dimodifikasi. Dalam situasi mengerikan tanpa jalan keluar, Gojo masih memegang kendali atas para Jurei. Akan tetapi, kuasa untuk menyegel Gojo ada di tangan musuh...!! Sementara itu, ketika Itadori bergegas menuju peron bawah tanah, muncul sekutu yang tak terduga!?',
          'image': 'assets/images/komik/jjk.jpg',
          'price': 'Rp 35.000',
          'author': 'Elex Media',
          'publishDate': '03 September 2023',
          'numberOfPages': '200 halaman',
        },
      ],
    },
  ];

              @override
              Widget build(BuildContext context) {
                return Scaffold(
                  key: _scaffoldKey,
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    title: Text(
                      'Toko Buku Sederhana',
                      style: TextStyle(fontSize: 17.5),
                    ),
                    backgroundColor: Color.fromARGB(255, 21, 156, 156),
                    actions: <Widget>[
                      if (!widget.isLoggedIn) 
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
                          },
                          icon: Icon(Icons.home),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _isGridView = !_isGridView;
                            });
                          },
                          icon: Icon(_isGridView ? Icons.list : Icons.grid_on),
                        ),
                      if (widget.isLoggedIn)
                        IconButton(
                          onPressed: () {
                            _scaffoldKey.currentState!.openEndDrawer();
                          },
                          icon: Icon(Icons.menu),
                        ),
                    ],
                  ),
                  endDrawer: widget.isLoggedIn ? _buildDrawer() : null,
                  body: _buildBody(),
                );
              }

              Widget _buildBody() {
                return _isGridView ? _buildGridView() : _buildListView();
              }

              Widget _buildListView() {
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, categoryIndex) {
                    final category = items[categoryIndex];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            category['category'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Column(
                          children: category['items']
                              .map<Widget>((item) => _buildListItem(item))
                              .toList(),
                        ),
                      ],
                    );
                  },
                );
              }

            Widget _buildGridView() {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemCount: items.length,
              itemBuilder: (context, categoryIndex) {
                final category = items[categoryIndex];
                return Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            category['category'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: category['items']
                                .map<Widget>((item) => _buildGridItem(item))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }


              Widget _buildGridItem(Map<String, dynamic> item) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DescPage(
                      bookTitle: item['title'],
                      bookDescription: item['description'],
                      bookImage: item['image'],
                      author: item['author'],
                      publishDate: item['publishDate'],
                      numberOfPages: item['numberOfPages'],
                    ),
                  ));
                },
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        item['image'],
                        height: 183.5,
                        width: 130,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              );
            }



          Widget _buildListItem(Map<String, dynamic> item) {
            return Card(
              elevation: 2,
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text(item['title']),
                subtitle: Text(item['price']),
                leading: Image.asset(
                  item['image'],
                  height: 100,
                  width: 100,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DescPage(
                      bookTitle: item['title'],
                      bookDescription: item['description'],
                      bookImage: '${item['image']}',
                      author: item['author'],
                      publishDate: item['publishDate'],
                      numberOfPages: item['numberOfPages'],
                    ),
                  ));
                },
                trailing: ElevatedButton(
                  onPressed: () {
                    if (widget.isLoggedIn) {
                      setState(() {
                        cartItems.add({
                          'title': item['title'],
                          'price': item['price'],
                        });
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Item ditambahkan ke keranjang.'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                    }
                  },
                  child: Text('Beli'),
                ),
              ),
            );
          }

          Widget _buildDrawer() {
            return Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                DrawerHeader(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 21, 156, 156),
                        image: DecorationImage(
                          image: AssetImage('${_getRandomProfileImage()}'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.6),
                            BlendMode.srcOver,
                          ),
                        ),
                      ),
                      child: Text(
                        'Selamat Berbelanja, ${widget.loggedInUsername}!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.5,
                        ),
                      ),
                    ),

              ListTile(
                leading: Icon(Icons.shopping_bag),
                title: Text('Pesanan Saya'),
                onTap: () {
                  DateTime currentDateTime = DateTime.now();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => OrderPage(
                      loggedInUsername: widget.loggedInUsername,
                      cartItems: cartItems,
                      orderDateTime: currentDateTime,
                    ),
                  ));
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('Keranjang Belanja'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CheckoutPage(
                      loggedInUsername: widget.loggedInUsername,
                      cartItems: cartItems,
                      itemTitle: '',
                      itemPrice: '',
                    ),
                  ));
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  _showLogoutConfirmationDialog(context);
                },
              ),
            ],
          ),
          );
        }

          Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
            return showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Konfirmasi Logout'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text('Apakah Anda ingin keluar?'),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Tidak'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text('Ya'),
                      onPressed: () {
                        setState(() {
                          cartItems.clear();
                          widget.isLoggedIn = false;
                          widget.loggedInUsername = null;
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        }
