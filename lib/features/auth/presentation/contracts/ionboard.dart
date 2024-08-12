import '../../../../core/helpers/helpers.dart';

abstract class OnboardControllerContract {
  late int currentNumber;

  late double progressPercentage;

  late AnimationController animationController;

  late List<String> svgAsset;

  late List<String> title;

  late List<String> subTitle;

  onChangePercentHandler() {}
}

abstract class OnboardViewContract extends BaseViewContract {
  @override
  Widget build(BuildContext context);
}
