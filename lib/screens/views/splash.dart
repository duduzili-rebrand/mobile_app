import '../../utils/helper.dart';

class SplashView extends StatelessView<SplashScreen, SplashController> {
  const SplashView(SplashController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff281461),
      body: Text("data"),
    );
  }
}
