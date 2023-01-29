import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/link.dart';

import '../../constants/constants.dart';
import '../../widgets/widgets.dart';

class CardData {
  final String imageUrl;
  final String title;
  final VoidCallback onTap;

  CardData({
    required this.imageUrl,
    required this.title,
    required this.onTap,
  });
}

class MoreScreen extends StatelessWidget {
  final List<CardData> cardsData = [
    CardData(
      imageUrl: '$mainUrl/kpshub/logo/contact_us.png',
      title: 'Contact Us',
      onTap: () {},
    ),
    CardData(
      imageUrl: '$mainUrl/kpshub/logo/about_app.png',
      title: 'About App',
      onTap: () {},
    ),
  ];

  MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Link(
                target: LinkTarget.blank,
                uri: Uri.parse(websiteUrl),
                builder: (context, followLink) => GestureDetector(
                  onTap: followLink,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      leading: SizedBox(
                        width: 25,
                        height: 25,
                        child: CachedNetworkImage(
                          imageUrl: '$mainUrl/kpshub/logo/website_appbar.png',
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      title: const Text('Komatsu Global'),
                      trailing: const SizedBox(
                          width: 25,
                          height: 25,
                          child: Icon(Icons.navigate_next)),
                    ),
                  ),
                ),
              ),
            ),
            for (var i = 0; i < cardsData.length; i++)
              Padding(
                padding: i == 0
                    ? const EdgeInsets.only(top: 20)
                    : const EdgeInsets.only(top: 20),
                child: MoreScreenCard(
                  imageUrl: cardsData[i].imageUrl,
                  title: cardsData[i].title,
                  onTap: cardsData[i].onTap,
                ),
              ),
          ],
        ),
      ),
    ));
  }
}

class MoreScreenCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onTap;
  const MoreScreenCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          leading: SizedBox(
            width: 25,
            height: 25,
            child: CachedImageWidget(imageUrl: imageUrl),
          ),
          title: Text(title),
          trailing: const SizedBox(
              width: 25, height: 25, child: Icon(Icons.navigate_next)),
        ),
      ),
    );
  }
}
