enum Gender {
  Male(
    code: "male", 
    name: "erkek",
    description: "Erkeği",
    imagePath: "assets/images/genders/ic_male.png"
  ),
  Female(
    code:"female",
    name: "kadin",
    description: "Kadını",
    imagePath: "assets/images/genders/ic_female.png"
  );

  final String name;
  final String code;
  final String description;
  final String imagePath;

  const Gender({
    required this.code, 
    required this.name,
    required this.description,
    required this.imagePath,
  });
}