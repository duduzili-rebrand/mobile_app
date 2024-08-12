import '../helpers/helpers.dart';

class ErrorState extends StatelessWidget {
  const ErrorState({super.key, this.refresh});

  final Function()? refresh;

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 'empty_favorites'.svgPicture(),
        // 'error_state'.toText(
        //   style: context.typography.dynamicStyle(
        //     fontSize: 14.sp,
        //     fontWeight: FontWeight.w600,
        //     color: context.customColors.textColor,
        //     height: 18 / 14,
        //   ),
        // ),
        // 8.heightBox,
        // 'error_state_sub'.toText(
        //   align: TextAlign.center,
        //   style: context.typography.dynamicStyle(
        //     fontSize: 12.sp,
        //     fontWeight: FontWeight.w400,
        //     color: Color(0xff8F8E91),
        //     height: 16 / 12,
        //   ),
        // ),
        // 16.heightBox,
        // if (refresh != null)
        //   Row(
        //     children: [
        //       Spacer(),
        //       OutlinedButton(
        //         onPressed: refresh,
        //         style: OutlinedButton.styleFrom(
        //           side: BorderSide(
        //             color: context.customColors.textColor!.withOpacity(0.1),
        //           ),
        //           foregroundColor: context.customColors.textColor,
        //         ),
        //         child: 'refresh'.toText(
        //           style: context.typography.dynamicStyle(
        //             fontWeight: FontWeight.w300,
        //           ),
        //         ),
        //       ).applySize(width: 200, height: 40),
        //     Spacer(),
        //   ],
        // ),
      ],
    );
  }
}

class EmptyState extends StatelessWidget {
  const EmptyState({super.key, this.refresh, this.text});
  final Function()? refresh;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // BlocBuilder<ThemeBloc, ThemeState>(
        //   builder: (context, state) => state.maybeWhen(
        //     orElse: () => 'empty_favorites'.svgPicture(),
        //     loaded: (isDark) => isDark ?? false
        //         ? 'empty_favorites'.svgPicture()
        //         : 'empty_favorites_dark'.svgPicture(),
        //   ),
        // ),
        // 8.heightBox,
        // (text ?? 'empty_state').toText(
        //   style: context.typography.dynamicStyle(
        //     fontSize: 14.sp,
        //     fontWeight: FontWeight.w500,
        //     color: Color(0xff8F8E91),
        //     height: 18 / 14,
        //   ),
        // ),
        // 8.heightBox,
        // if (refresh != null)
        //   'empty_state_sub'.toText(
        //     align: TextAlign.center,
        //     style: context.typography.dynamicStyle(
        //       fontSize: 12.sp,
        //       fontWeight: FontWeight.w400,
        //       color: Color(0xff8F8E91),
        //       height: 16 / 12,
        //     ),
        //   ),
        // if (refresh != null) 16.heightBox,
        // if (refresh != null)
        //   Row(
        //     children: [
        //       Spacer(),
        //       OutlinedButton(
        //         onPressed: refresh,
        //         style: OutlinedButton.styleFrom(
        //           side: BorderSide(
        //             color: context.customColors.textColor!.withOpacity(0.1),
        //           ),
        //           foregroundColor: context.customColors.textColor,
        //         ),
        //         child: (text ?? 'refresh').toText(
        //           style: context.typography.dynamicStyle(
        //             fontWeight: FontWeight.w300,
        //           ),
        //         ),
        //       ).applySize(width: 200, height: 40),
        //       Spacer(),
        //     ],
        //   ),
      ],
    );
  }
}
