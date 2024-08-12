import '../../../../core/helpers/helpers.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => EditProfileController();
}

class EditProfileController extends State<EditProfileScreen>
    with SingleTickerProviderStateMixin
    implements EditProfileControllerContract {
  late EditProfileViewContract view;

  @override
  void initState() {
    super.initState();
    view = EditProfileView(controller: this);
    initializeBlocs();
  }

  initializeBlocs() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }
}
