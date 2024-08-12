import '../../../../core/helpers/helpers.dart';

abstract class MessagesControllerContract {}

abstract class MessagesViewContract extends BaseViewContract {
  @override
  Widget build(BuildContext context);
}
