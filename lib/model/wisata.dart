class Wisata {
  String name;
  String location;
  String description;
  String imageAsset;
  List<String> imageUrls;

  Wisata({
    required this.name,
    required this.description,
    required this.location,
    required this.imageAsset,
    required this.imageUrls,
  });
}

var wisataList = [
  Wisata(
    name: 'Wisata Kintamani',
    location: 'Desa Penelokan, Kecamatan Kintamani, Kabupaten Bangli, Bali',
    description:
        'Ngomongin soal destinasi wisata di Bali memang gak akan ada habisnya. Hampir semua sudut Pulau Dewata ini dipenuhi wisata yang menarik. Begitu pula di kawasan Kintamani, banyak wisata alam dengan pemandangan memukau yang wajib dijelajahi.Kintamani sendiri masih berada di Kabupaten Bangli, letaknya di sebelah utara Pulau Bali. Berikut beberapa rekomendasi wisata di Kintamani, Bali, yang wajib masuk list liburanmu',
    imageAsset: 'images/kitamani.jpg',
    imageUrls: [
      'https://asset.kompas.com/crops/5fOXY3K4oKdIzs-F7qNcs0qtt68=/0x0:1430x953/750x500/data/photo/2022/01/17/61e57605c2256.jpg',
      'https://ik.imagekit.io/tvlk/blog/2021/08/Destinasi-Wisata-di-Kintamani-Pura-Ulun-Danu-Batur-Shutterstock.jpg?tr=dpr-2,w-675',
      'https://cdn.idntimes.com/content-images/post/20220104/9-17a75e16d9c36adc41296a841f23fb09.jpeg',
      'https://www.balitoursclub.net/wp-content/uploads/2015/10/Objek-wisata-Kintamani-di-Bangli-Bali.jpg',
      'https://cdn0-production-images-kly.akamaized.net/jLTiPPoRmMw7EoMP_pfAt8NL0I8=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/4167435/original/051109400_1663834139-unknown_307840382_605347144584725_8284557679761339325_n.jpghttps://cdn.nativeindonesia.com/foto/2018/11/Lawangsewu-Park-Nite.jpg',
    ],
  ),
  Wisata(
    name: 'Wisata Pantai Pandawa',
    location: 'Jl. Pantai Pandawa, Kutuh, Kec. Kuta Sel.',
    description:
        'Pantai Pandawa Bali, salah satu pantai pasir putih terkenal di Bali yang wajib di kunjungi jika anda liburan di pulau dewata. Pandawa beach terletak di Desa Kutuh, Kabupaten Badung dan lebih terkenal di kalangan wisatawan mancanegara khususnya Australia dengan nama secret beach of Bali. Sedangkan masyarakat lokal lebih mengenal dengan nama pantai Kutuh. Bagaimana dengan anda, apakah tertarik untuk liburan ke pantai Pandawa Bali? Jika iya, mohon lanjutkan membaca halaman ini! Karena terdapat informasi harga tiket masuk, panduan & tips liburan ke Pandawa beach Kutuh.',
    imageAsset: 'images/pantai.jpg',
    imageUrls: [
      'https://cdn1.katadata.co.id/media/images/thumb/2020/07/11/2020_07_11-16_51_03_9dccdcd160129c794bab37fa7d80a98d_400x267_thumb.jpg',
      'https://blog.tiket.com/wp-content/uploads/2018/10/8.-Spot-Foto_2.jpg',
      'https://www.gotravelaindonesia.com/wp-content/uploads/Pesona-Pantai-Pandawa-Bali.jpg',
      'https://pinhome-blog-assets-public.s3.amazonaws.com/2022/03/romitour-com.jpg',
      'https://tempatwisatadibali.info/wp-content/uploads/2017/07/Pantai-Pandawa-Bali-2.jpg'
    ],
  ),
  Wisata(
    name: 'Wisata Ambengan',
    location: 'Ambengan, Kec. Sukasada, Kabupaten Buleleng, Bali',
    description:
        'Panorama alam dari ketinggian di Banjar Pebantenan, Desa Ambengan, Kecamatan Sukasada, Buleleng nampak sangat indah dipandang mata. Pohon besar berusia ratusan tahun serta aliran sungai gatep lawas yang jernih menjadi spot wisata alam yang menakjubkan untuk dikunjungi. Gatep lawas merupakan salah satu destinasi wisata di Buleleng yang menawarkan keindahan alam serta aliran sungainya yang begitu jernih. Tempat ini dulunya merupakan saluran air biasa yang sering digunakan oleh masyarakat sekitar untuk keperluan mandi ataupun berendam',
    imageAsset: 'images/ambengan.jpeg',
    imageUrls: [
      'https://visitambengan.com//media/images/berita/gatep2.jpg',
      'https://visitambengan.com//media/images/berita/gatep2.jpg',
      'https://visitambengan.com//media/images/berita/gatep2.jpg',
      'https://visitambengan.com//media/images/berita/gatep2.jpg',
      'https://visitambengan.com//media/images/berita/gatep2.jpg'
    ],
  ),
  Wisata(
    name: 'Bukit Asah',
    location:
        'Jl. Raya Bukit Asah Desa Adat Bugbug, Kec. Karangasem, Kabupaten Karangasem, Bali ',
    description:
        'Bukit Asah Bali merupakan sebuah obyek wisata yang berlokasi di desa Bugbug, Kecamatan Karangasem, Kabupaten Karangasem Bali. Sebuah bukit tinggi yang mejolor kelaut diapit oleh Bukit Panggian yang juram dan sebuah pantai Bias Putih dikenal dengan nama Virgin Beach Bali. Pulau Kuan yang berbentuk ikan Paus berada tepat didepan Bukit Asah nampak sangat indah yang menjadi ikon Bukit Asah dan sering digunakan sebagai background untuk berphotoria oleh pengunjung yang datang.',
    imageAsset: 'images/bukitasah.jpg',
    imageUrls: [
      'https://blog.bookingtogo.com/wp-content/uploads/2022/08/Matahari-Terbit-di-Bukit-Asah-Karangasem.jpg',
      'https://blog.bookingtogo.com/wp-content/uploads/2022/08/Matahari-Terbit-di-Bukit-Asah-Karangasem.jpg',
      'https://blog.bookingtogo.com/wp-content/uploads/2022/08/Matahari-Terbit-di-Bukit-Asah-Karangasem.jpg',
      'https://blog.bookingtogo.com/wp-content/uploads/2022/08/Matahari-Terbit-di-Bukit-Asah-Karangasem.jpg',
      'https://blog.bookingtogo.com/wp-content/uploads/2022/08/Matahari-Terbit-di-Bukit-Asah-Karangasem.jpg'
    ],
  ),
  Wisata(
    name: 'Wisata Tanah Lot',
    location: 'Beraban, Kec. Kediri, Kabupaten Tabanan, Bali 82121',
    description:
        'Tanah Lot salah satu pura penting bagi umat Hindu Bali dan lokasi pura terletak di atas batu besar yang berada di lepas pantai. Selain itu, Pura Tanah Lot merupakan ikon pariwisata pulau Bali dan telah menjadi salah satu objek wisata terkenal di pulau Bali yang wajib di kunjungi. Karena saking terkenalnya tempat wisata di Bali ini, maka hampir setiap hari, objek wisata ini selalu ramai dengan kunjungan wisatawan.',
    imageAsset: 'images/tanah.jpeg',
    imageUrls: [
      'https://www.rentalmobilbali.net/wp-content/uploads/2019/12/Sunset-Pura-Tanah-Lot-Bali-Twitter.jpg',
    ],
  ),
  Wisata(
    name: 'Pantai Cinta',
    location:
        'Jl. Pantai Kedungu, Belalang, Kec. Kediri, Kabupaten Tabanan, Bali 82115',
    description:
        'Pantai Cinta Kedungu Bali Lokasi Foto dan Harga Tiket Masuk Terbaru Mei 2023 – Bali merupakan pulau yang sangat terkenal hingga mancanegara. Hal ini dikarenakan tempat wisatanya yang sangat banyak, menarik dan indah-indah. Pantai merupakan tempat wisata di Bali yang mendominasi dan terdapat banyak pantai yang bisa anda kunjungi. Nah pada kesempatan kali ini kami akan memberikan informasi tentang pantai yang sedang viral dan menarik banyak wisatawan. Pantai ini bernama pantai Cinta Kedungu.',
    imageAsset: 'images/cinta.jpeg',
    imageUrls: [
      'https://cdn-2.tstatic.net/bali/foto/bank/images/the-beach-love-tabanan-bali.jpg',
      'https://wisatamilenial.com/wp-content/uploads/2021/03/Pantai-Cinta-Kedungu-Dilihat-Dari-Atas-Image-From-@arphotto_.jpg',
      'https://www.kabarwisatabali.com/wp-content/uploads/2021/10/The-Beach-Love-Kedungu.jpg'
    ],
  ),
  Wisata(
    name: 'Obyek Wisata Nusa Penida',
    location: 'Bunga Mekar, Kec. Nusa Penida, Kabupaten Klungkung, Bali 80771',
    description:
        "Pantai Kelingking merupakan singkapan bebatuan yang spektakuler yang menghadap ke laut. Batuan tersebut terlihat seperti tulang belakang dinosaurus yang datang untuk minum air laut. Di Google Map, teluk tersebut disebut Teluk T-Rex. Pemandangan di sana luar biasa, namun jika Anda memiliki keberanian dan waktu, anda HARUS turun ke pantai. Gunakan sepatu yang baik dan hati-hati saat turun ke pantai karena ada ombak dan arus yang kuat. Berkunjung ke Pantai Kelingking akan memberikan pengalaman yang sangat menyenangkan!",
    imageAsset: 'images/Kelingking.jpg',
    imageUrls: [
      'https://assets.pikiran-rakyat.com/crop/0x115:1080x1206/x/photo/2020/07/14/2990405272.jpg',
      'https://assets.pikiran-rakyat.com/crop/0x115:1080x1206/x/photo/2020/07/14/2990405272.jpg',
      'https://assets.pikiran-rakyat.com/crop/0x115:1080x1206/x/photo/2020/07/14/2990405272.jpg',
      'https://assets.pikiran-rakyat.com/crop/0x115:1080x1206/x/photo/2020/07/14/2990405272.jpg',
      'https://assets.pikiran-rakyat.com/crop/0x115:1080x1206/x/photo/2020/07/14/2990405272.jpg',
    ],
  ),
  Wisata(
    name: "Wisata Pura Tirta Empul",
    location: "Tampaksiring, Kec. Tampaksiring, Kabupaten Gianyar, Bali 80552",
    description:
        "Tirta Empul adalah nama sebuah pura Hindu yang terletak di desa Manukaya, kecamatan Tampak Siring, kabupaten Gianyar Bali. Keunikan arsitektur dan adanya mata air pada area dalam pura, membuat pura Tirta Empul menarik banyak kunjungan wisatawan. Baik wisatawan mancanegara maupun wisatawan domestik. Jika anda sedang merencanakan liburan ke pulau Bali, dan tertarik mengunjungi objek wisata pura Hindu. ",
    imageAsset: 'images/tirta.jpg',
    imageUrls: [
      'https://www.rentalmobilbali.net/wp-content/uploads/2021/08/Pura-Tirta-Empul-Tampak-Siring-Feature-Image.jpg',
      'https://cdn0-production-images-kly.akamaized.net/1Ne56NRd1G_P1TD_hQpgEEKYbcU=/1231x710/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/4014877/original/078433600_1651818204-20220506-Antrean_Wisata_Melukat_Di_Pura_Tirta_Empul-1.jpg',
      'https://s3-ap-southeast-1.amazonaws.com/cntres-assets-ap-southeast-1-250226768838-cf675839782fd369/imageResource/2017/07/11/1499752533774-a9d23818e7be50f36942779791eb7606.jpeg'
    ],
  ),
];
