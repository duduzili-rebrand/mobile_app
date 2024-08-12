import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../helpers/helpers.dart';
// import 'global_variables.dart';

class AppUtils {
  static AppBar storyViewAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 48.h,
      leadingWidth: 80,
      leading: Row(
        children: [
          SizedBox(width: 20.w),
          ExpandTapWidget(
            onTap: () => context.pop(),
            tapPadding: REdgeInsets.all(10),
            child: SvgPicture.asset(
              "assets/svgs/xmark.svg",
              width: 20.w,
              height: 20.h,
            ),
          ),
          // ExpandTapWidget(
          //   onTap: () => context.pop(),
          //   tapPadding: REdgeInsets.all(20),
          // ),
        ],
      ),
      title: Text(
        "Babatunde Adekunle",
        style: Styles.x16dp_222C27_600w(color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.black,
      elevation: 0,
      actions: [
        Icon(
          Icons.more_vert,
          size: 20.w.h,
        ),
        SizedBox(width: 20.w),
      ],
    );
  }

  static AppBar postAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 57.h,
      leadingWidth: 80,
      leading: Row(
        children: [
          SizedBox(width: 20.w),
          ExpandTapWidget(
            onTap: () => context.pop(),
            tapPadding: REdgeInsets.all(10),
            child: Container(
              padding: REdgeInsets.all(10),
              width: 32.w,
              height: 32.h,
              decoration: const BoxDecoration(
                color: Color(0xfff3f3f3),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                "assets/svgs/xmark.svg",
                width: 8.w,
                height: 8.h,
                fit: BoxFit.scaleDown,
                color: AppColors.inkDarkest,
              ),
            ),
          ),
        ],
      ),
      title: Text(
        "Create Post",
        style: Styles.x16dp_222C27_600w(color: AppColors.neutral1000),
      ),
      centerTitle: true,
      backgroundColor: AppColors.skyWhite,
      elevation: 0,
      actions: [
        Padding(
          padding: REdgeInsets.symmetric(vertical: 12),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              // padding: EdgeInsets.zero,
              fixedSize: Size(68.w, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
            child: Text(
              "Post",
              style: Styles.x12dp_222C27_600w(
                  color: AppColors.skyWhite, height: 1.5),
            ),
          ),
        ),
        SizedBox(width: 20.w),
      ],
    );
  }

  static AppBar homeAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 20.w),
          ExpandTapWidget(
            tapPadding: REdgeInsets.all(10),
            onTap: () => GlobalVariables.scaffoldKey.currentState!.openDrawer(),
            child: Stack(
              children: [
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      profileLoading: () => SizedBox.shrink(),
                      profileSuccess: (ProfileData data) => ExtendedImageWidget(
                        imageUrl: data.profilePicture.toString().decrypt(),
                      ),
                      orElse: () => const Text("data"),
                    );
                  },
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 10.w,
                    height: 10.h,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      color: const Color(0xff008000),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.skyWhite,
                        width: 1.2.w,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      leadingWidth: 100.w,
      title: SvgPicture.asset(
        "assets/svgs/logo.svg",
        width: 42.w,
        height: 32.h,
      ),
      actions: [
        ExpandTapWidget(
          tapPadding: REdgeInsets.all(10),
          onTap: () => context.goNamed(RouteConstants.search),
          child: SvgPicture.asset(
            "assets/svgs/search_inactive.svg",
            width: 24.w,
            height: 24.h,
            color: const Color(0xff292D32),
          ),
        ),
        SizedBox(width: 15.45.w),
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
              logoutLoading: () => EasyLoading.show(),
              logoutSuccess: () {
                EasyLoading.dismiss();
                context.goNamed(RouteConstants.signIn);
              },
              loginError: (error) {
                EasyLoading.dismiss();
              },
              orElse: () {},
            );
          },
          child: ExpandTapWidget(
            tapPadding: REdgeInsets.all(10),
            onTap: () => context.read<AuthBloc>().add(
                  const AuthEvent.logout(),
                ),
            child: SvgPicture.asset(
              "assets/svgs/notification_outline.svg",
              height: 24.h,
              width: 24.w,
              color: const Color(0xff292D32),
            ),
          ),
        ),
        SizedBox(width: 20.w),
      ],
      centerTitle: true,
    );
  }

  static AppBar normalAppBar(
    BuildContext context, {
    required String title,
    Widget? trailing,
    String? assetPath,
  }) {
    return AppBar(
      toolbarHeight: 57.h,
      leadingWidth: 60.sp,
      leading: Row(
        children: [
          SizedBox(width: 20.sp),
          ExpandTapWidget(
            onTap: () => context.pop(),
            tapPadding: REdgeInsets.all(10),
            child: Container(
              padding: REdgeInsets.all(10),
              width: 32.w,
              height: 32.h,
              decoration: const BoxDecoration(
                color: Color(0xfff3f3f3),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                assetPath ?? "assets/svgs/arrow_left.svg",
                width: 8.w,
                height: 8.h,
                fit: BoxFit.none,
                color: AppColors.inkDarkest,
              ),
            ),
          ),
        ],
      ),
      title: Text(
        title,
        style: Styles.x16dp_222C27_600w(color: AppColors.neutral1000),
      ),
      actions: trailing == null
          ? null
          : [
              trailing,
              SizedBox(width: 20.w),
            ],
      centerTitle: true,
      backgroundColor: AppColors.skyWhite,
      elevation: 0,
    );
  }

  static AppBar appBarIcon(BuildContext context,
          {String? title, Widget? trailingWidget}) =>
      AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Row(
          children: [
            SizedBox(width: 20.w),
            ExpandTapWidget(
              tapPadding: REdgeInsets.all(10),
              onTap: () =>
                  GlobalVariables.scaffoldKey.currentState!.openDrawer(),
              child: Stack(
                children: [
                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        profileSuccess: (ProfileData data) =>
                            ExtendedImageWidget(
                          imageUrl: data.profilePicture.toString().decrypt(),
                        ),
                        orElse: () => const Text("data"),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 10.w,
                      height: 10.h,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        color: const Color(0xff008000),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.skyWhite,
                          width: 1.2.w,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        leadingWidth: 100.w,
        title: title == null
            ? BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    profileSuccess: (ProfileData data) => Text(
                      data.fullName.toString().decrypt(),
                      style: Styles.x16dp_222C27_600w(
                        color: AppColors.neutral1000,
                      ),
                    ),
                    orElse: () => const Text("data"),
                  );
                },
              )
            : Text(
                title,
                style: Styles.x16dp_222C27_600w(
                  color: AppColors.neutral1000,
                ),
              ),
        actions: [
          ExpandTapWidget(
            tapPadding: REdgeInsets.all(10),
            onTap: () {},
            child: trailingWidget ??
                SvgPicture.asset(
                  "assets/svgs/search_inactive.svg",
                  width: 24.w,
                  height: 24.w,
                  color: const Color(0xff292D32),
                ),
          ),
          SizedBox(width: 20.w),
        ],
        centerTitle: true,
      );
}
