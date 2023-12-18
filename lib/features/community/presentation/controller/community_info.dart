import '../../../../core/helpers/helpers.dart';

class CommunityInfoScreen extends StatefulWidget {
  const CommunityInfoScreen({Key? key}) : super(key: key);

  @override
  State<CommunityInfoScreen> createState() => CommunityInfoController();
}

class CommunityInfoController extends State<CommunityInfoScreen>
    implements CommunityInfoControllerContract {
  late CommunityInfoViewContract view;

  @override
  void initState() {
    super.initState();
    view = CommunityInfoView(
      controller: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }
}