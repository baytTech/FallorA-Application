enum Horoscope {
  Aries(
    code: "aries",
    name: "koc",
    description: "Koç",
    imagePath: "./assets/images/horoscope/gemini_sign.png"
  ),
  Taurus(
    code:"taurus", 
    name: "boga",
    description: "Boğa",
    imagePath: "./assets/images/horoscope/gemini_sign.png"
  ),
  Gemini(
    code: "gemini", 
    name: "ikizler",
    description:"İkizler",
    imagePath: "./assets/images/horoscope/gemini_sign.png"
  ),
  Cancer(
    code: "cancer", 
    name: "yengec",
    description:"Yengeç",
    imagePath: "./assets/images/horoscope/gemini_sign.png"
  ),
  Leo(
    code: "leo", 
    name: "aslan",
    description: "Aslan",
    imagePath: "./assets/images/horoscope/gemini_sign.png"
  ),
  Virgo(
    code: "virgo",
    name:"basak",
    description: "Başak",
    imagePath: "./assets/images/horoscope/gemini_sign.png"
  ),
  Libra(
    code: "libra", 
    name:"terazi",
    description: "Terazi",
    imagePath: "./assets/images/horoscope/gemini_sign.png"
  ),
  Scorpio(
    code: "scorpio", 
    name:"akrep",
    description: "Akrep",
    imagePath: "./assets/images/horoscope/gemini_sign.png"
  ),
  Sagittarius(
    code: "sagittarius", 
    name: "yay",
    description: "Yay",
    imagePath: "./assets/images/horoscope/gemini_sign.png"
  ),
  Capricorn(
    code: "capricorn",
    name:"oglak",
    description: "Oğlak",
    imagePath: "./assets/images/horoscope/gemini_sign.png"
  ),
  Aquarius(
    code: "aquarius", 
    name: "kova",
    description: "Kova",
    imagePath: "./assets/images/horoscope/gemini_sign.png"
  ),
  Pisces(
    code: "pisces", 
    name:"balik",
    description: "Balık",
    imagePath: "./assets/images/horoscope/gemini_sign.png"
  );

  final String name;
  final String code;
  final String description;
  final String imagePath;

  const Horoscope({
    required this.code, 
    required this.name,
    required this.description,
    required this.imagePath
  });
}