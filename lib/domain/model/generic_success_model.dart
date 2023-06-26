class GenericSuccessModel {
  final String? title;
  final String? description;
  final String? animation;
  final String? image;
  final String? buttonText;
  final dynamic Function()? action;

  const GenericSuccessModel({
    this.title, 
    this.description, 
    this.animation, 
    this.image, 
    this.buttonText,
    this.action
  });

  factory GenericSuccessModel.forTarot({dynamic Function()? action}) {
    return GenericSuccessModel(
      title: "Tarot Falı",
      description: "Tarot falı talebiniz başarıyla alındı.\nNe çıkarsa bahtına vs...",
      buttonText: "Ana sayfaya dön",
      animation: "assets/lottie_animations/success_lottie_anim.json",
      action: action,
    );
  }
}