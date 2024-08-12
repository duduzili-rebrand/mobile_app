import 'package:duduzili/config/di/app_initializer.dart';

import '../helpers/helpers.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: GlobalVariables.mainNavigatorKey,
    debugLogDiagnostics: kDebugMode,
    // initialLocation: '/${RouteConstants.home}',
    // AppInitializer.firstTime == null ? OnboardingScreen.route : null,
    observers: [
      if (kDebugMode) GoRouterObserver(),
    ],
    routes: [
      GoRoute(
        name: RouteConstants.splash,
        path: '/',
        // onExit: (context) => true,
        builder: (context, state) => const SplashScreen(),
        redirect: (context, state) async {
          Future.delayed(const Duration(seconds: 16), () {
            if (AppInitializer.isLoggedIn == true) {
              router.goNamed(RouteConstants.home);
            } else if (AppInitializer.firstTime == true) {
              router.goNamed(RouteConstants.onboard);
            } else {
              router.goNamed(RouteConstants.signIn);
            }
          });

          return "/";
        },
        // routes: const [],
      ),
      GoRoute(
        path: "/${RouteConstants.onboard}",
        name: RouteConstants.onboard,
        builder: (context, state) => const OnboardScreen(),
      ),
      GoRoute(
        path: "/${RouteConstants.welcome}",
        name: RouteConstants.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: "/${RouteConstants.appLock}",
        name: RouteConstants.appLock,
        builder: (context, state) => const AppLockScreen(),
      ),
      GoRoute(
        path: "/${RouteConstants.signIn}",
        name: RouteConstants.signIn,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: "/${RouteConstants.signUp}",
        name: RouteConstants.signUp,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: "/${RouteConstants.addProfilePicture}",
        name: RouteConstants.addProfilePicture,
        builder: (context, state) => const AddProfilePictureScreen(),
      ),
      GoRoute(
        path: "/${RouteConstants.completeRegistration}",
        name: RouteConstants.completeRegistration,
        builder: (context, state) => const CompleteRegistrationScreen(),
      ),
      GoRoute(
        path: "/${RouteConstants.selectPreference}",
        name: RouteConstants.selectPreference,
        builder: (context, state) => const SelectPreferenceScreen(),
      ),
      GoRoute(
        path: "/${RouteConstants.setupUsername}",
        name: RouteConstants.setupUsername,
        builder: (context, state) => const SetupUsernameScreen(),
      ),
      GoRoute(
        path: "/${RouteConstants.verifyOtp}",
        name: RouteConstants.verifyOtp,
        builder: (context, state) => VerifyOtpScreen(
          accountRecovery: state.extra as bool?,
          email: state.uri.queryParameters,
        ),
      ),
      GoRoute(
        path: "/${RouteConstants.recoverAccount}",
        name: RouteConstants.recoverAccount,
        builder: (context, state) => const RecoverAccountScreen(),
      ),
      GoRoute(
        path: "/${RouteConstants.setPassword}",
        name: RouteConstants.setPassword,
        builder: (context, state) => const SetPasswordScreen(),
      ),
      GoRoute(
        path: "/${RouteConstants.createPost}",
        name: RouteConstants.createPost,
        parentNavigatorKey: GlobalVariables.mainNavigatorKey,
        builder: (context, state) => const CreatePostScreen(),
      ),
      GoRoute(
        path: "/${RouteConstants.discoverPeople}",
        name: RouteConstants.discoverPeople,
        parentNavigatorKey: GlobalVariables.mainNavigatorKey,
        builder: (context, state) => const DiscoverPeopleScreen(),
      ),
      GoRoute(
        path: "/${RouteConstants.discoverCommunity}",
        name: RouteConstants.discoverCommunity,
        parentNavigatorKey: GlobalVariables.mainNavigatorKey,
        builder: (context, state) => const DiscoverCommunityScreen(),
      ),
      GoRoute(
        path: "/${RouteConstants.followRequest}",
        name: RouteConstants.followRequest,
        parentNavigatorKey: GlobalVariables.mainNavigatorKey,
        builder: (context, state) => const FollowRequestScreen(),
      ),
      GoRoute(
        path: "/${RouteConstants.yourProfile}",
        name: RouteConstants.yourProfile,
        parentNavigatorKey: GlobalVariables.mainNavigatorKey,
        builder: (context, state) => const YourProfileScreen(),
      ),
      GoRoute(
        path: "/${RouteConstants.about}",
        name: RouteConstants.about,
        parentNavigatorKey: GlobalVariables.mainNavigatorKey,
        builder: (context, state) => const AboutScreen(),
      ),
      GoRoute(
        path: "/${RouteConstants.notification}",
        name: RouteConstants.notification,
        parentNavigatorKey: GlobalVariables.mainNavigatorKey,
        builder: (context, state) => const NotificationScreen(),
      ),
      // GoRoute(
      //   path: "/${RouteConstants.media}",
      //   name: RouteConstants.media,
      //   parentNavigatorKey: GlobalVariables.mainNavigatorKey,
      //   builder: (context, state) => MediaViewWidget(
      //     statusType: state.extra as StatusType,
      //     audioPlayer: state.uri.,
      //   ),
      // ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return NestedScaffoldWidget(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: GlobalVariables.shellNavigatorHomeKey,
            routes: [
              // top route inside branch
              GoRoute(
                path: '/${RouteConstants.home}',
                name: RouteConstants.home,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: HomeScreen(),
                ),
                routes: [
                  GoRoute(
                    path: RouteConstants.comment,
                    name: RouteConstants.comment,
                    parentNavigatorKey: GlobalVariables.mainNavigatorKey,
                    builder: (context, state) => const CommentScreen(),
                  ),
                  GoRoute(
                    path: RouteConstants.post,
                    name: RouteConstants.post,
                    parentNavigatorKey: GlobalVariables.mainNavigatorKey,
                    builder: (context, state) => const PostScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: GlobalVariables.shellNavigatorSearchKey,
            routes: [
              // top route inside branch
              GoRoute(
                path: '/${RouteConstants.search}',
                name: RouteConstants.search,
                // parentNavigatorKey: GlobalVariables.rootNavigatorKey,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: SearchsScreen(),
                ),
                routes: const [],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: GlobalVariables.shellNavigatorCommunityKey,
            routes: [
              // top route inside branch
              GoRoute(
                path: '/${RouteConstants.community}',
                name: RouteConstants.community,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: CommunityScreen(),
                ),
                routes: [
                  GoRoute(
                    path: RouteConstants.communityInfo,
                    name: RouteConstants.communityInfo,
                    parentNavigatorKey: GlobalVariables.mainNavigatorKey,
                    builder: (context, state) => CommunityInfoScreen(
                      communityId: state.extra as String,
                    ),
                  ),
                  GoRoute(
                    path: RouteConstants.createCommunity,
                    name: RouteConstants.createCommunity,
                    parentNavigatorKey: GlobalVariables.mainNavigatorKey,
                    builder: (context, state) => const CreateCommunityScreen(),
                  ),
                  GoRoute(
                    path: RouteConstants.communityCoverPhoto,
                    name: RouteConstants.communityCoverPhoto,
                    parentNavigatorKey: GlobalVariables.mainNavigatorKey,
                    builder: (context, state) => CommunityCoverPhotoScreen(
                      communityId: state.extra as String,
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: GlobalVariables.shellNavigatorMessagesKey,
            routes: [
              // top route inside branch
              GoRoute(
                path: '/${RouteConstants.messages}',
                name: RouteConstants.messages,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: MessagesScreen(),
                ),
                routes: [
                  GoRoute(
                    path: RouteConstants.chat,
                    name: RouteConstants.chat,
                    parentNavigatorKey: GlobalVariables.mainNavigatorKey,
                    builder: (context, state) => const ChatScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: GlobalVariables.shellNavigatorProfileKey,
            routes: [
              // top route inside branch
              GoRoute(
                path: '/${RouteConstants.profile}',
                name: RouteConstants.profile,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ProfileScreen(),
                ),
                routes: [
                  GoRoute(
                    path: RouteConstants.editProfile,
                    name: RouteConstants.editProfile,
                    parentNavigatorKey: GlobalVariables.mainNavigatorKey,
                    builder: (context, state) => const EditProfileScreen(),
                  ),
                  GoRoute(
                    path: RouteConstants.aboutYou,
                    name: RouteConstants.aboutYou,
                    parentNavigatorKey: GlobalVariables.mainNavigatorKey,
                    builder: (context, state) => AboutYouScreen(
                      aboutYouData: state.extra as AboutYouData,
                    ),
                  ),
                  GoRoute(
                    path: RouteConstants.basicInfo,
                    name: RouteConstants.basicInfo,
                    parentNavigatorKey: GlobalVariables.mainNavigatorKey,
                    builder: (context, state) => const BasicInfoScreen(),
                  ),
                  GoRoute(
                    path: RouteConstants.contactInfo,
                    name: RouteConstants.contactInfo,
                    parentNavigatorKey: GlobalVariables.mainNavigatorKey,
                    builder: (context, state) => const ContactInfoScreen(),
                  ),
                  GoRoute(
                    path: RouteConstants.settings,
                    name: RouteConstants.settings,
                    parentNavigatorKey: GlobalVariables.mainNavigatorKey,
                    builder: (context, state) => const SettingsScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
