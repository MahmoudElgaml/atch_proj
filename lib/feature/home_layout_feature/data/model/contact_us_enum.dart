import '../../../../generated/assets.dart';

enum ContactUsModel {
  face(Assets.imagesFacebookIcon,
      "https://www.facebook.com/profile.php?id=61550837405127&mibextid=LQQJ4d"),
  instagram(Assets.imagesInstagramIcon,
      "https://www.instagram.com/greateagleeg?igsh=a3NwYjNmYmc2b281"),
  linkedIn(Assets.imagesLinkedinIcon,
      "https://www.linkedin.com/in/great-eagle-428375271/"),
  whats(Assets.imagesWhatsIcon, "01555504487");

  final String icon;
  final String link;

  const ContactUsModel(this.icon, this.link);
}
