import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'config/theme.dart';
import 'widgets/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(const KPSHub()));
}

class KPSHub extends StatelessWidget {
  const KPSHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'KPS Hub',
        theme: theme(),
        debugShowCheckedModeBanner: false,
        home: const CommonWidget());
  }
}
