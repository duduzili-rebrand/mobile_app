import '../../../../core/helpers/helpers.dart';

abstract class SetupUsernameControllerContract {
  late TextEditingController usernameController;
  AnimationController? controller;
  Tween<double>? opacityTween;
  Animation<double>? enableLocationAnimation;
  Function? onPressed;

  //Methods
  void onFetchDefaultUsernameHandler();
  void onValidateUsername();
}

abstract class SetupUsernameViewContract extends BaseViewContract {
  @override
  Widget build(BuildContext context);
}
