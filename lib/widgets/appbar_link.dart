import 'package:flutter/material.dart';
import 'package:kps_hub/widgets/widgets.dart';
import 'package:url_launcher/link.dart';
import '../../constants/constants.dart';

class AppBarLink extends StatelessWidget {
  const AppBarLink({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Link(
        target: LinkTarget.blank,
        uri: Uri.parse(kpsWebsiteUrl),
        builder: (context, followLink) => GestureDetector(
          onTap: followLink,
          child: SizedBox(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Komatsu Pakistan',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: kSecondaryColor,
                          decoration: TextDecoration.underline)),
                  const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CachedImageWidget(
                          imageUrl: '$mainUrl/kpshub/logo/website_appbar.png',
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
