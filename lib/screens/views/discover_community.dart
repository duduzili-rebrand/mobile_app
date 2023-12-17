import '../../utils/helper.dart';

class DiscoverCommunityView extends StatelessView<DiscoverCommunityScreen,
    DiscoverCommunityController> {
  const DiscoverCommunityView(DiscoverCommunityController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.skyWhite,
      body: Container(
        color: AppColors.skyWhite,
        child: SafeArea(
            bottom: false,
            child: Container(
              color: AppColors.skyWhite,
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: REdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverPersistentHeader(
                        delegate: SliverCustomHeaderDelegate(
                          minHeight: 50.h,
                          maxHeight: 50.h,
                          child: Container(
                            color: AppColors.skyWhite,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      prefixIcon: SvgPicture.asset(
                                        "assets/svgs/search_inactive.svg",
                                        color: AppColors.neutral1000,
                                        // width: 24.w,
                                        // height: 24.h,
                                        fit: BoxFit.scaleDown,
                                      ),
                                      filled: true,
                                      fillColor: AppColors.neutral200,
                                      hintText: "Search by name or username",
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                GestureDetector(
                                  onTap: () => context.pop(),
                                  child: Text(
                                    "Cancel",
                                    style: Styles.x12dp_222C27_400w(
                                        color: AppColors.inkDarkest),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        pinned: true,
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 33.h),
                            Text(
                              "Discover community",
                              style: Styles.x16dp_222C27_600w(
                                  color: AppColors.neutral1000),
                            ),
                          ],
                        ),
                      )
                    ];
                  },
                  body: ListView.separated(
                    primary: false,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          padding: REdgeInsets.all(4),
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.neutral300,
                            ),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: const FlutterLogo(),
                        ),
                        title: Text(
                          "Justice League",
                          style: Styles.x14dp_222C27_400w(
                            color: AppColors.neutral1000,
                            height: 1.5.h,
                          ),
                        ),
                        subtitle: Row(
                          children: [
                            StackedImage(
                              likedStringUrl: [
                                "",
                                "",
                                "",
                                "",
                              ],
                            ),
                            // SizedBox(width: 4.w),
                            Text(
                              "449 members",
                              style: Styles.x10dp_222C27_400w(
                                color: AppColors.neutral800,
                              ),
                            )
                          ],
                        ),
                        trailing: SizedBox(
                          height: 32.h,
                          width: 87.w,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                            child: Text(
                              "Join",
                              style: Styles.x12dp_222C27_400w(
                                color: AppColors.skyWhite,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 0.h),
                    itemCount: 18,
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
