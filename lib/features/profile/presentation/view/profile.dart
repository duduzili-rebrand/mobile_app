import '../../../../core/components/extended_image_widget.dart';
import '../../../../core/data/models/profile.dart';
import '../../../../core/helpers/helpers.dart';

class ProfileView extends StatelessWidget implements ProfileViewContract {
  const ProfileView({
    Key? key,
    required this.controller,
  }) : super(key: key);
  // final IWidgetHelper widgetHelper;
  final ProfileControllerContract controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.skyWhite,
      appBar: AppUtils.appBarIcon(
        context,
        trailingWidget: ExpandTapWidget(
          onTap: () => context.pushNamed(RouteConstants.settings),
          tapPadding: REdgeInsets.all(10),
          child: SvgPicture.asset(
            "assets/svgs/setting_slim.svg",
            width: 24.w,
            height: 24.h,
            color: const Color(0xff292D32),
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Container(
                  padding: REdgeInsets.symmetric(horizontal: 20),
                  margin: REdgeInsets.only(bottom: 4),
                  color: AppColors.skyWhite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Stack(
                            children: [
                              BlocBuilder<ProfileBloc, ProfileState>(
                                builder: (context, state) {
                                  return state.maybeWhen(
                                    profileSuccess: (ProfileData data) =>
                                        ExtendedImageWidget(
                                      imageUrl: data.profilePicture
                                          .toString()
                                          .decrypt(),
                                      size: 60,
                                    ),
                                    orElse: () => const Text("data"),
                                  );
                                },
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  padding: REdgeInsets.all(4),
                                  width: 20.w,
                                  height: 20.h,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.skyWhite,
                                      width: 1.2.w,
                                    ),
                                  ),
                                  child: SvgPicture.asset(
                                    "assets/svgs/camera.svg",
                                    color: AppColors.skyWhite,
                                    // width: 12.w,
                                    // height: 12.h,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(width: 60.w),
                          BlocBuilder<ProfileBloc, ProfileState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                profileSuccess: (ProfileData data) => Column(
                                  children: [
                                    Text(
                                      data.numberOfPosts?.decrypt() ?? "",
                                      style: Styles.x12dp_222C27_600w(
                                        color: AppColors.neutral1000,
                                        height: 1.5.h,
                                      ),
                                    ),
                                    Text(
                                      data.numberOfPosts?.decrypt() == "0"
                                          ? "Post"
                                          : "Posts",
                                      style: Styles.x8dp_222C27_400w(
                                        color: AppColors.neutral800,
                                      ),
                                    )
                                  ],
                                ),
                                orElse: () => const Text("data"),
                              );
                            },
                          ),
                          SizedBox(width: 40.w),
                          BlocBuilder<ProfileBloc, ProfileState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                profileSuccess: (ProfileData data) => Column(
                                  children: [
                                    Text(
                                      data.followers?.decrypt() ?? "",
                                      style: Styles.x12dp_222C27_600w(
                                        color: AppColors.neutral1000,
                                        height: 1.5.h,
                                      ),
                                    ),
                                    Text(
                                      data.followers?.decrypt() == "0"
                                          ? "Follower"
                                          : "Followers",
                                      style: Styles.x8dp_222C27_400w(
                                        color: AppColors.neutral800,
                                      ),
                                    )
                                  ],
                                ),
                                orElse: () => const Text("data"),
                              );
                            },
                          ),
                          SizedBox(width: 40.w),
                          BlocBuilder<ProfileBloc, ProfileState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                profileSuccess: (ProfileData data) => Column(
                                  children: [
                                    Text(
                                      data.followings?.decrypt() ?? "",
                                      style: Styles.x12dp_222C27_600w(
                                        color: AppColors.neutral1000,
                                        height: 1.5.h,
                                      ),
                                    ),
                                    Text(
                                      data.followings?.decrypt() == "0"
                                          ? "Following"
                                          : "Followings",
                                      style: Styles.x8dp_222C27_400w(
                                        color: AppColors.neutral800,
                                      ),
                                    )
                                  ],
                                ),
                                orElse: () => const Text("data"),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            profileSuccess: (ProfileData data) => Text(
                              data.fullName.toString().decrypt(),
                              style: Styles.x14dp_222C27_600w(
                                color: AppColors.neutral1000,
                                height: 1.4.h,
                              ),
                            ),
                            orElse: () => const Text("data"),
                          );
                        },
                      ),
                      BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            profileSuccess: (ProfileData data) =>
                                DetectableText(
                              text: "@${data.username.toString().decrypt()}",
                              basicStyle: Styles.x14dp_222C27_400w(
                                  color: AppColors.neutral1000, height: 1.5.h),
                              detectedStyle: Styles.x14dp_222C27_400w(
                                  color: AppColors.primaryColor, height: 1.5.h),
                              detectionRegExp: GlobalVariables.userRegex,
                            ),
                            orElse: () => const Text("data"),
                          );
                        },
                      ),
                      BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            profileSuccess: (ProfileData data) =>
                                data.bio!.decrypt().toLowerCase() == "none"
                                    ? SizedBox(height: 12.h)
                                    : Column(
                                        children: [
                                          SizedBox(height: 12.h),
                                          Text(
                                            data.bio!.decrypt(),
                                            style: Styles.x10dp_222C27_400w(
                                              color: AppColors.neutral600,
                                            ),
                                          ),
                                          SizedBox(height: 12.h),
                                        ],
                                      ),
                            orElse: () => const Text("data"),
                          );
                        },
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 32.sp,
                              child: ElevatedButton(
                                onPressed: () => context
                                    .pushNamed(RouteConstants.createPost),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  padding: EdgeInsets.zero,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      size: 14.w.h,
                                      color: AppColors.skyWhite,
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(
                                      "New post",
                                      style: Styles.x10dp_222C27_400w(
                                        color: AppColors.skyWhite,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: SizedBox(
                              height: 32.sp,
                              child: OutlinedButton(
                                onPressed: () => Navigator.push(
                                    GlobalVariables
                                        .mainNavigatorKey.currentContext!,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CameraWidget(),
                                    )),
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  backgroundColor: AppColors.primaryColor,
                                  side: const BorderSide(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset("assets/svgs/status.svg"),
                                    SizedBox(width: 4.w),
                                    Text(
                                      "New story",
                                      style: Styles.x10dp_222C27_400w(
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: SizedBox(
                              height: 32.sp,
                              child: OutlinedButton(
                                onPressed: () => context
                                    .pushNamed(RouteConstants.editProfile),
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  backgroundColor: AppColors.primaryColor,
                                  side: const BorderSide(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                        "assets/svgs/edit_plain.svg"),
                                    SizedBox(width: 4.w),
                                    Text(
                                      "Edit Profile",
                                      style: Styles.x10dp_222C27_400w(
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
              // SizedBox(height: 16.h),
              SliverPersistentHeader(
                delegate: SliverCustomHeaderDelegate(
                    minHeight: 45.h,
                    maxHeight: 45.h,
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                          width: 0.6,
                          color: AppColors.neutral400,
                        )),
                        color: AppColors.skyWhite,
                      ),
                      // margin: REdgeInsets.only(top: 4),
                      child: TabBar(
                        padding: REdgeInsets.symmetric(horizontal: 16),
                        onTap: (value) => controller.setCurrentIndex(value),
                        controller: controller.tabController,
                        indicatorPadding: EdgeInsets.zero,
                        labelPadding: EdgeInsets.zero,
                        tabAlignment: TabAlignment.fill,
                        labelColor: AppColors.primaryColor,
                        labelStyle: Styles.x10dp_222C27_600w(
                            color: AppColors.primaryColor),
                        indicatorColor: Colors.transparent,
                        unselectedLabelStyle: Styles.x10dp_222C27_600w(
                            color: AppColors.neutral600),
                        unselectedLabelColor: AppColors.neutral600,
                        tabs: [
                          Tab(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              controller.currentTabIndex == 0
                                  ? SvgPicture.asset(
                                      "assets/svgs/menu.svg",
                                    )
                                  : SvgPicture.asset(
                                      "assets/svgs/menu_grey.svg",
                                    ),
                              SizedBox(width: 4.w),
                              const FittedBox(
                                child: Text(
                                  "All posts",
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          )),
                          Tab(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              controller.currentTabIndex == 1
                                  ? SvgPicture.asset(
                                      "assets/svgs/photo_filled.svg",
                                    )
                                  : SvgPicture.asset(
                                      "assets/svgs/photo.svg",
                                    ),
                              SizedBox(width: 4.w),
                              const Text("Photos")
                            ],
                          )),
                          Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                controller.currentTabIndex == 2
                                    ? SvgPicture.asset(
                                        "assets/svgs/video_filled.svg",
                                      )
                                    : SvgPicture.asset(
                                        "assets/svgs/video.svg",
                                      ),
                                SizedBox(width: 4.w),
                                const Text("Videos")
                              ],
                            ),
                          ),
                          Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                controller.currentTabIndex == 3
                                    ? SvgPicture.asset(
                                        "assets/svgs/audio_filled.svg",
                                      )
                                    : SvgPicture.asset(
                                        "assets/svgs/audio.svg",
                                      ),
                                SizedBox(width: 4.w),
                                const Text("Audios")
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                pinned: true,
              ),
            ];
          },
          body: Container(
            color: AppColors.skyWhite,
            child: TabBarView(
              physics: const ClampingScrollPhysics(),
              controller: controller.tabController,
              children: [
                ListView.separated(
                  // primary: false,
                  physics: const ClampingScrollPhysics(),
                  padding: REdgeInsets.only(top: 16),
                  itemBuilder: (context, index) {
                    return const AudioPlayerWidget();
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 8.h),
                  itemCount: 3,
                ),
                Text("data"),
                Text("data"),
                Text("data"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
