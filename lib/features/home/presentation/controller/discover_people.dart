import '../../../../core/helpers/helpers.dart';

class DiscoverPeopleScreen extends StatefulWidget {
  const DiscoverPeopleScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverPeopleScreen> createState() => DiscoverPeopleController();
}

class DiscoverPeopleController extends State<DiscoverPeopleScreen>
    implements DiscoverPeopleControllerContract {
  late DiscoverPeopleViewContract view;

  @override
  int currentTab = 0;

  @override
  void initState() {
    super.initState();
    view = DiscoverPeopleView(
      controller: this,
    );
  }

  @override
  changeCurrentTab(int value) {
    setState(() {
      currentTab = value;
    });
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
