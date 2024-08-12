import '../../../../core/helpers/helpers.dart';

class YourProfileView extends StatelessWidget
    implements YourProfileViewContract {
  const YourProfileView({
    Key? key,
    required this.controller,
  }) : super(key: key);
  // final IWidgetHelper widgetHelper;
  final YourProfileControllerContract controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.skyWhite,
      appBar: AppUtils.normalAppBar(
        context,
        title: "Babatunde Adekunle",
        trailing: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownWidget(),
          ],
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
                              Container(
                                padding: REdgeInsets.all(4),
                                width: 60.w,
                                height: 60.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: AppColors.neutral400)),
                                child: const FlutterLogo(),
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
                          Column(
                            children: [
                              Text(
                                "345",
                                style: Styles.x12dp_222C27_600w(
                                  color: AppColors.neutral1000,
                                  height: 1.5.h,
                                ),
                              ),
                              Text(
                                "Posts",
                                style: Styles.x8dp_222C27_400w(
                                  color: AppColors.neutral800,
                                ),
                              )
                            ],
                          ),
                          SizedBox(width: 40.w),
                          Column(
                            children: [
                              Text(
                                "657",
                                style: Styles.x12dp_222C27_600w(
                                  color: AppColors.neutral1000,
                                  height: 1.5.h,
                                ),
                              ),
                              Text(
                                "Followers",
                                style: Styles.x8dp_222C27_400w(
                                  color: AppColors.neutral800,
                                ),
                              )
                            ],
                          ),
                          SizedBox(width: 40.w),
                          Column(
                            children: [
                              Text(
                                "256",
                                style: Styles.x12dp_222C27_600w(
                                  color: AppColors.neutral1000,
                                  height: 1.5.h,
                                ),
                              ),
                              Text(
                                "Following",
                                style: Styles.x8dp_222C27_400w(
                                  color: AppColors.neutral800,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        "Babatunde Adekunle",
                        style: Styles.x14dp_222C27_600w(
                          color: AppColors.neutral1000,
                          height: 1.4.h,
                        ),
                      ),
                      Text(
                        "@adetunes",
                        style: Styles.x14dp_222C27_400w(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        "Looking for an experienced people to help me find people in US to test my app. Looking for an experienced people to help me find people in US to test my app...see more",
                        style: Styles.x10dp_222C27_400w(
                          color: AppColors.neutral600,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 32.sp,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                        "assets/svgs/user_add.svg"),
                                    SizedBox(width: 4.w),
                                    Text(
                                      "Follow",
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
                                onPressed: () =>
                                    context.pushNamed(RouteConstants.chat),
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
                                      "assets/svgs/sms.svg",
                                      color: AppColors.primaryColor,
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(
                                      "Message",
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
                                onPressed: () =>
                                    context.pushNamed(RouteConstants.about),
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
                                      "assets/svgs/profile_circle.svg",
                                      color: AppColors.primaryColor,
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(
                                      "About",
                                      style: Styles.x10dp_222C27_400w(
                                          color: AppColors.primaryColor),
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
                  itemCount: 8,
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
