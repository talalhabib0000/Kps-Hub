import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  List<CardData> cardsData = [
    CardData(
      leading: const Icon(Icons.card_giftcard),
      title: 'Komatsu Global',
      onTap: () {},
      trailing: Icons.more,
    ),
    CardData(
      leading: const Icon(Icons.card_giftcard),
      title: 'Contact Us',
      onTap: () {},
      trailing: Icons.more,
    ),
    CardData(
      leading: const Icon(Icons.card_giftcard),
      title: 'About App',
      onTap: () {},
      trailing: Icons.more,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            for (var i = 0; i < cardsData.length; i++)
              Padding(
                padding: i == 0
                    ? const EdgeInsets.only(top: 50)
                    : const EdgeInsets.only(top: 20),
                child: MoreScreenCard(
                  leading: cardsData[i].leading,
                  title: cardsData[i].title,
                  onTap: cardsData[i].onTap,
                  trailing: cardsData[i].trailing,
                ),
              ),
          ],
        ),
      ),
    ));
  }
}

class CardData {
  final Icon leading;
  final String title;
  final IconData trailing;
  final VoidCallback onTap;

  CardData(
      {required this.leading,
      required this.title,
      required this.trailing,
      required this.onTap});
}

class MoreScreenCard extends StatelessWidget {
  final Icon leading;
  final String title;
  final IconData trailing;
  final VoidCallback onTap;
  const MoreScreenCard(
      {super.key,
      required this.leading,
      required this.title,
      required this.trailing,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: leading,
        title: Text(title),
        trailing: Icon(trailing),
        onTap: onTap,
      ),
    );
  }
}
