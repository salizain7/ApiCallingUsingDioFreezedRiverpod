import 'package:firstflutter/src/core/styles/app_colors.dart';
import 'package:firstflutter/src/core/translations/l10n.dart';
import 'package:firstflutter/src/shared/presentation/pages/background_page.dart';
import 'package:firstflutter/src/shared/presentation/widgets/default_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomErrorPage extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const CustomErrorPage({
    Key? key,
    required this.errorDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DefaultAppBarWidget(
            title: S.of(context).internal_error,
            backgroundColor: AppColors.red,
          ),
          Expanded(
            child: Center(
              child: Column(
                children: [
                  Text(
                    S.of(context).internal_error,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.red,
                        ),
                  ),
                  SizedBox(
                    height: 15.sp,
                  ),
                  Text(
                    errorDetails.exception.toString(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.red,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
