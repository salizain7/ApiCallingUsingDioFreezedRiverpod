import 'package:firstflutter/src/core/helper/helper.dart';
import 'package:firstflutter/src/core/helper/helper_ui.dart';
import 'package:firstflutter/src/core/router/app_route_name_enum.dart';
import 'package:firstflutter/src/core/styles/app_colors.dart';
import 'package:firstflutter/src/core/translations/l10n.dart';
import 'package:firstflutter/src/core/utils/constant/app_constants.dart';
import 'package:firstflutter/src/shared/domain/entities/enums/language_enum.dart';
import 'package:firstflutter/src/shared/domain/providers/language/language_provider.dart';
import 'package:firstflutter/src/shared/presentation/widgets/drawer_item_widget.dart';
import 'package:firstflutter/src/shared/presentation/widgets/rounded_border_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class AppDrawerPage extends ConsumerStatefulWidget {
  const AppDrawerPage({Key? key}) : super(key: key);

  @override
  ConsumerState<AppDrawerPage> createState() => _AppDrawerPageState();
}

class _AppDrawerPageState extends ConsumerState<AppDrawerPage> {
  late LanguageEnum selectedLanguage ;
  String name = defaultStr;
  String? image;

  @override
  void initState() {
    selectedLanguage = ref.read(languageProvider);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.minHeight,
          ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                _buildHeader(),

                // Content
                _buildContent(),

                const Spacer(),

                // Social Media
                SingleChildScrollView(
                  child: _buildSocialMedia(),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  // Header
  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30.sp,
      ),
      color: AppColors.primaryColor,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: kToolbarHeight,
          ),

          // Image and name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Image nad name
              Row(
                children: [
                  const RoundedBorderImageWidget(
                    width: 60,
                    height: 60,
                    image: Text("Image Here!")
                  ),

                  SizedBox(
                    width: 15.sp,
                  ),

                  // Name
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Welcome title
                      Row(
                        children: [
                          Text(
                            "Welcome",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white,
                                ),
                          ),

                          // Space
                          SizedBox(
                            width: 3.w,
                          ),

                          SvgPicture.asset(
                            Helper.getSvgPath("waving.svg"),
                            width: 16.sp,
                            height: 16.sp,
                          )
                        ],
                      ),

                      // Name
                      Text(
                        name,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white,
                                ),
                      )
                    ],
                  ),
                ],
              ),

              Flexible(
                child: IconButton(
                  constraints: const BoxConstraints(),
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Scaffold.of(context).closeDrawer();
                  },
                  icon: Icon(
                    Icons.close,
                    size: 20.sp,
                    color: AppColors.white,
                  ),
                ),
              )
            ],
          ),

          SizedBox(
            height: 20.sp,
          ),
        ],
      ),
    );
  }

  // Content
  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(30.sp),
      child: Column(
        children: [
          // My profile
          DrawerItemWidget(
            image: SvgPicture.asset(
              Helper.getSvgPath("profile.svg"),
              colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor, BlendMode.srcIn),
              width: 20.sp,
              height: 20.sp,
            ),
            title: "Profile",
            onTap: () {
              Navigator.pop(context);

              // Navigator.pushNamed(
              //   context,
              //   AppRouteNameEnum.profile.name,
              // );
            },
          ),

          SizedBox(
            height: 30.sp,
          ),

        ],
      ),
    );
  }

  Widget _buildSocialMedia() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.sp, horizontal: 30.sp),
      child: Wrap(
        spacing: 5.sp,
        runSpacing: 5.sp,
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.spaceBetween,
        children: [
          // Facebook
          RoundedBorderImageWidget(
            withShadow: false,
            borderColor: AppColors.unselectedTapColor,
            borderRadius: 18,
            width: 40.sp,
            height: 40.sp,
            image: Center(
              child: SvgPicture.asset(
                Helper.getSvgPath(
                  "facebook.svg",
                ),
                width: 17.sp,
                height: 17.sp,
              ),
            ),
          ),

          // Twitter
          RoundedBorderImageWidget(
            withShadow: false,
            borderColor: AppColors.unselectedTapColor,
            borderRadius: 18,
            width: 40.sp,
            height: 40.sp,
            image: Center(
              child: SvgPicture.asset(
                Helper.getSvgPath(
                  "twitter.svg",
                ),
                width: 17.sp,
                height: 17.sp,
              ),
            ),
          ),

          // Instagram
          RoundedBorderImageWidget(
            withShadow: false,
            borderColor: AppColors.unselectedTapColor,
            borderRadius: 18,
            width: 40.sp,
            height: 40.sp,
            image: Center(
              child: SvgPicture.asset(
                Helper.getSvgPath(
                  "instagram.svg",
                ),
                width: 17.sp,
                height: 17.sp,
              ),
            ),
          ),

          // Tiktok
          RoundedBorderImageWidget(
            withShadow: false,
            borderColor: AppColors.unselectedTapColor,
            borderRadius: 18,
            width: 40.sp,
            height: 40.sp,
            image: Center(
              child: SvgPicture.asset(
                Helper.getSvgPath(
                  "tiktok.svg",
                ),
                width: 17.sp,
                height: 17.sp,
              ),
            ),
          ),

          // telegram
          RoundedBorderImageWidget(
            withShadow: false,
            borderColor: AppColors.unselectedTapColor,
            borderRadius: 18,
            width: 40.sp,
            height: 40.sp,
            image: Center(
              child: SvgPicture.asset(
                Helper.getSvgPath(
                  "telegram.svg",
                ),
                width: 17.sp,
                height: 17.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Language
// Text(
//   S.of(context).language,
//   style: Theme.of(context).textTheme.headlineMedium,
// ),
//
// // Arabic language
// Theme(
//   data: ThemeData(
//     unselectedWidgetColor: AppColors.lightGrayColor,
//   ),
//   child: RadioListTile(
//     activeColor: AppColors.primaryColor,
//     contentPadding: EdgeInsets.zero,
//     title: Text(
//       S.of(context).arabic,
//       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//             fontWeight: FontWeight.bold,
//           ),
//     ),
//     value: LanguageEnum.values[0],
//     groupValue: selectedLanguage,
//     onChanged: (value) {
//       selectedLanguage = value!;
//       BlocProvider.of<LanguageCubit>(context)
//           .changeLanguage(selectedLanguage);
//     },
//   ),
// ),
//
// // English language
// Theme(
//   data: ThemeData(
//     unselectedWidgetColor: AppColors.lightGrayColor,
//   ),
//   child: RadioListTile(
//     activeColor: AppColors.primaryColor,
//     contentPadding: EdgeInsets.zero,
//     title: Text(
//       S.of(context).english,
//       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//             fontWeight: FontWeight.bold,
//           ),
//     ),
//     value: LanguageEnum.values[1],
//     groupValue: selectedLanguage,
//     onChanged: (value) {
//       selectedLanguage = value!;
//       BlocProvider.of<LanguageCubit>(context)
//           .changeLanguage(selectedLanguage);
//     },
//   ),
// ),
//
// // Theme
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     Text(
//       Helper.isDarkTheme()
//           ? S.of(context).dark_skin
//           : S.of(context).light_skin,
//       style: Theme.of(context).textTheme.headlineMedium,
//     ),
//     Switch(
//       activeColor: Theme.of(context).primaryColor,
//       value: Helper.isDarkTheme(),
//       onChanged: (value) {
//         BlocProvider.of<ThemeCubit>(context).changeLanguage(value);
//       },
//     ),
//   ],
// ),
//
// Spacer(),
//
// // Login/Logout Button
// BlocConsumer<GeneralBloc, GeneralState>(
//   bloc: _bloc,
//   listener: (context, state) {
//     if (state is ErrorLogoutState) {
//       Navigator.pushNamedAndRemoveUntil(
//           context, AppPageRouteName.login.name, (route) => false);
//       HelperUi.showSnackBar(context, state.errorMessage,
//           type: ToastTypeEnum.error);
//     } else if (state is SuccessLogoutState) {
//       Navigator.pushNamedAndRemoveUntil(
//           context, AppPageRouteName.login.name, (route) => false);
//       HelperUi.showSnackBar(context, S.of(context).logout_successful,
//           type: ToastTypeEnum.success);
//     }
//   },
//   builder: (context, state) {
//     if (state is LoadingLogoutState) {
//       return AppLoader();
//     }
//
//     return ButtonWidget(
//       text: sl<AuthSharedPrefs>().getUser() == null
//           ? S.of(context).login
//           : S.of(context).logout,
//       onPressed: () {
//         if (sl<AuthSharedPrefs>().getUser() == null) {
//           Navigator.pushNamed(context, AppPageRouteName.login.name);
//         } else {
//           _bloc.add(OnLogoutEvent());
//         }
//       },
//       backgroundColor: AppColors.red,
//       textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//             fontWeight: FontWeight.w600,
//             color: AppColors.white,
//           ),
//     );
//   },
// )
