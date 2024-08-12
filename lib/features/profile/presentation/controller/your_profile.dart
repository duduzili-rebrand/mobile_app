import '../../../../core/helpers/helpers.dart';

class YourProfileScreen extends StatefulWidget {
  const YourProfileScreen({Key? key}) : super(key: key);

  @override
  State<YourProfileScreen> createState() => YourProfileController();
}

class YourProfileController extends State<YourProfileScreen>
    with SingleTickerProviderStateMixin
    implements YourProfileControllerContract {
  late YourProfileViewContract view;

  @override
  late TabController tabController;

  @override
  int currentTabIndex = 0;

  @override
  setCurrentIndex(int value) {
    setState(() {
      // tabController.index = value;
      currentTabIndex = value;
    });
  }

  @override
  void initState() {
    super.initState();
    view = YourProfileView(controller: this);
    tabController = TabController(length: 4, vsync: this);
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
