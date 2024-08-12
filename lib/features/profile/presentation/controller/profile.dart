import '../../../../core/helpers/helpers.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => ProfileController();
}

class ProfileController extends State<ProfileScreen>
    with SingleTickerProviderStateMixin
    implements ProfileControllerContract {
  late ProfileViewContract view;

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
    view = ProfileView(controller: this);
    tabController = TabController(length: 4, vsync: this);
    initializeBlocs();
  }

  initializeBlocs() {}

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }
}
