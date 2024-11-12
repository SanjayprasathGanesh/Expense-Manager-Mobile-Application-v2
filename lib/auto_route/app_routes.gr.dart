// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i54;
import 'package:expense_manager/view/pages/login/setUserProfile.dart' as _i35;
import 'package:expense_manager/view/pages/login/splashScreen.dart' as _i37;
import 'package:expense_manager/view/pages/login/userLogin.dart' as _i49;
import 'package:expense_manager/view/pages/login/userSignup.dart' as _i51;
import 'package:expense_manager/view/pages/main_screens/analytics.dart' as _i11;
import 'package:expense_manager/view/pages/main_screens/expenses.dart' as _i28;
import 'package:expense_manager/view/pages/main_screens/home.dart' as _i19;
import 'package:expense_manager/view/pages/main_screens/main_screen.dart'
    as _i24;
import 'package:expense_manager/view/pages/main_screens/personal.dart' as _i32;
import 'package:expense_manager/view/pages/main_screens/settings.dart' as _i36;
import 'package:expense_manager/view/pages/other_screens/analytics/expense_analytics.dart'
    as _i14;
import 'package:expense_manager/view/pages/other_screens/analytics/expense_stats.dart'
    as _i15;
import 'package:expense_manager/view/pages/other_screens/analytics/income_analytics.dart'
    as _i21;
import 'package:expense_manager/view/pages/other_screens/analytics/income_stats.dart'
    as _i22;
import 'package:expense_manager/view/pages/other_screens/analytics/leave_analytics.dart'
    as _i23;
import 'package:expense_manager/view/pages/other_screens/analytics/year_analytics.dart'
    as _i53;
import 'package:expense_manager/view/pages/other_screens/expenses/add_expense.dart'
    as _i3;
import 'package:expense_manager/view/pages/other_screens/expenses/update_expense.dart'
    as _i40;
import 'package:expense_manager/view/pages/other_screens/garage/add_accessories.dart'
    as _i2;
import 'package:expense_manager/view/pages/other_screens/garage/add_vehicle.dart'
    as _i10;
import 'package:expense_manager/view/pages/other_screens/garage/my_accessories.dart'
    as _i26;
import 'package:expense_manager/view/pages/other_screens/garage/my_garage.dart'
    as _i29;
import 'package:expense_manager/view/pages/other_screens/garage/update_accessory.dart'
    as _i39;
import 'package:expense_manager/view/pages/other_screens/garage/update_vehicle.dart'
    as _i48;
import 'package:expense_manager/view/pages/other_screens/incomes/add_income.dart'
    as _i4;
import 'package:expense_manager/view/pages/other_screens/incomes/update_income.dart'
    as _i42;
import 'package:expense_manager/view/pages/other_screens/incomes/view_all_incomes.dart'
    as _i30;
import 'package:expense_manager/view/pages/other_screens/leave_tracker/add_leave.dart'
    as _i5;
import 'package:expense_manager/view/pages/other_screens/leave_tracker/myLeaves.dart'
    as _i31;
import 'package:expense_manager/view/pages/other_screens/leave_tracker/update_leave.dart'
    as _i43;
import 'package:expense_manager/view/pages/other_screens/mileage_tracker/add_mileage.dart'
    as _i6;
import 'package:expense_manager/view/pages/other_screens/mileage_tracker/mileage_calculator.dart'
    as _i25;
import 'package:expense_manager/view/pages/other_screens/mileage_tracker/update_mileage.dart'
    as _i44;
import 'package:expense_manager/view/pages/other_screens/myplans/add_plan.dart'
    as _i8;
import 'package:expense_manager/view/pages/other_screens/myplans/add_plan_expense.dart'
    as _i9;
import 'package:expense_manager/view/pages/other_screens/myplans/update_expense_plan.dart'
    as _i41;
import 'package:expense_manager/view/pages/other_screens/myplans/update_plan.dart'
    as _i46;
import 'package:expense_manager/view/pages/other_screens/myplans/view_all_plan_exp.dart'
    as _i33;
import 'package:expense_manager/view/pages/other_screens/myplans/view_all_plans.dart'
    as _i52;
import 'package:expense_manager/view/pages/other_screens/personal_diary/add_personal_diary.dart'
    as _i7;
import 'package:expense_manager/view/pages/other_screens/personal_diary/mydiary.dart'
    as _i27;
import 'package:expense_manager/view/pages/other_screens/personal_diary/update_personal_diary.dart'
    as _i45;
import 'package:expense_manager/view/pages/setting_screens/about_us.dart'
    as _i1;
import 'package:expense_manager/view/pages/setting_screens/cards.dart' as _i17;
import 'package:expense_manager/view/pages/setting_screens/contact_submitted.dart'
    as _i12;
import 'package:expense_manager/view/pages/setting_screens/contact_us.dart'
    as _i13;
import 'package:expense_manager/view/pages/setting_screens/faq.dart' as _i16;
import 'package:expense_manager/view/pages/setting_screens/help_centre.dart'
    as _i18;
import 'package:expense_manager/view/pages/setting_screens/terms_and_conditions.dart'
    as _i38;
import 'package:expense_manager/view/pages/setting_screens/update_user_profile.dart'
    as _i47;
import 'package:expense_manager/view/pages/setting_screens/user_profile.dart'
    as _i50;
import 'package:expense_manager/view/widgets/image_capture.dart' as _i20;
import 'package:expense_manager/view/widgets/save_img.dart' as _i34;
import 'package:flutter/foundation.dart' as _i55;
import 'package:flutter/material.dart' as _i56;

abstract class $AppRouter extends _i54.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i54.PageFactory> pagesMap = {
    AboutUs.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutUs(),
      );
    },
    AddAccessories.name: (routeData) {
      final args = routeData.argsAs<AddAccessoriesArgs>(
          orElse: () => const AddAccessoriesArgs());
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AddAccessories(
          key: args.key,
          vehicleName: args.vehicleName,
        ),
      );
    },
    AddExpense.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AddExpense(),
      );
    },
    AddIncome.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.AddIncome(),
      );
    },
    AddLeave.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.AddLeave(),
      );
    },
    AddMileage.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.AddMileage(),
      );
    },
    AddPersonalDiary.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.AddPersonalDiary(),
      );
    },
    AddPlan.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.AddPlan(),
      );
    },
    AddPlanExpense.name: (routeData) {
      final args = routeData.argsAs<AddPlanExpenseArgs>(
          orElse: () => const AddPlanExpenseArgs());
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.AddPlanExpense(
          key: args.key,
          planName: args.planName,
        ),
      );
    },
    AddVehicle.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.AddVehicle(),
      );
    },
    Analytics.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.Analytics(),
      );
    },
    ContactSubmitted.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.ContactSubmitted(),
      );
    },
    ContactUs.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.ContactUs(),
      );
    },
    ExpenseAnalytics.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.ExpenseAnalytics(),
      );
    },
    ExpenseStats.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.ExpenseStats(),
      );
    },
    FAQ.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.FAQ(),
      );
    },
    GiftVoucher.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.GiftVoucher(),
      );
    },
    HelpCentre.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.HelpCentre(),
      );
    },
    Home.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.Home(),
      );
    },
    ImageCapture.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.ImageCapture(),
      );
    },
    IncomeAnalytics.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.IncomeAnalytics(),
      );
    },
    IncomeStats.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.IncomeStats(),
      );
    },
    LeaveAnalytics.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.LeaveAnalytics(),
      );
    },
    MainRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.MainScreen(),
      );
    },
    MileageTracker.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.MileageTracker(),
      );
    },
    MyAccessory.name: (routeData) {
      final args = routeData.argsAs<MyAccessoryArgs>(
          orElse: () => const MyAccessoryArgs());
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i26.MyAccessory(
          key: args.key,
          vehicleName: args.vehicleName,
        ),
      );
    },
    MyDiary.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.MyDiary(),
      );
    },
    MyExpenses.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i28.MyExpenses(),
      );
    },
    MyGarage.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i29.MyGarage(),
      );
    },
    MyIncomes.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i30.MyIncomes(),
      );
    },
    MyLeaves.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i31.MyLeaves(),
      );
    },
    Personal.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i32.Personal(),
      );
    },
    PlanExpenses.name: (routeData) {
      final args = routeData.argsAs<PlanExpensesArgs>(
          orElse: () => const PlanExpensesArgs());
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i33.PlanExpenses(
          key: args.key,
          planName: args.planName,
        ),
      );
    },
    SaveImage.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i34.SaveImage(),
      );
    },
    SetUserProfile.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i35.SetUserProfile(),
      );
    },
    Settings.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i36.Settings(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i37.SplashScreen(),
      );
    },
    TermsAndConditions.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i38.TermsAndConditions(),
      );
    },
    UpdateAccessories.name: (routeData) {
      final args = routeData.argsAs<UpdateAccessoriesArgs>(
          orElse: () => const UpdateAccessoriesArgs());
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i39.UpdateAccessories(
          key: args.key,
          vehicleName: args.vehicleName,
          id: args.id,
        ),
      );
    },
    UpdateExpense.name: (routeData) {
      final args = routeData.argsAs<UpdateExpenseArgs>(
          orElse: () => const UpdateExpenseArgs());
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.UpdateExpense(
          key: args.key,
          id: args.id,
        ),
      );
    },
    UpdateExpensePlan.name: (routeData) {
      final args = routeData.argsAs<UpdateExpensePlanArgs>(
          orElse: () => const UpdateExpensePlanArgs());
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i41.UpdateExpensePlan(
          key: args.key,
          id: args.id,
          planName: args.planName,
        ),
      );
    },
    UpdateIncome.name: (routeData) {
      final args = routeData.argsAs<UpdateIncomeArgs>(
          orElse: () => const UpdateIncomeArgs());
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i42.UpdateIncome(
          key: args.key,
          id: args.id,
        ),
      );
    },
    UpdateLeave.name: (routeData) {
      final args = routeData.argsAs<UpdateLeaveArgs>(
          orElse: () => const UpdateLeaveArgs());
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i43.UpdateLeave(
          key: args.key,
          id: args.id,
        ),
      );
    },
    UpdateMileage.name: (routeData) {
      final args = routeData.argsAs<UpdateMileageArgs>(
          orElse: () => const UpdateMileageArgs());
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.UpdateMileage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    UpdatePersonalDiary.name: (routeData) {
      final args = routeData.argsAs<UpdatePersonalDiaryArgs>(
          orElse: () => const UpdatePersonalDiaryArgs());
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i45.UpdatePersonalDiary(
          key: args.key,
          id: args.id,
        ),
      );
    },
    UpdatePlan.name: (routeData) {
      final args = routeData.argsAs<UpdatePlanArgs>(
          orElse: () => const UpdatePlanArgs());
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i46.UpdatePlan(
          key: args.key,
          id: args.id,
        ),
      );
    },
    UpdateUserProfile.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i47.UpdateUserProfile(),
      );
    },
    UpdateVehicle.name: (routeData) {
      final args = routeData.argsAs<UpdateVehicleArgs>(
          orElse: () => const UpdateVehicleArgs());
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i48.UpdateVehicle(
          key: args.key,
          id: args.id,
        ),
      );
    },
    UserLogin.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i49.UserLogin(),
      );
    },
    UserProfile.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i50.UserProfile(),
      );
    },
    UserSignup.name: (routeData) {
      final args = routeData.argsAs<UserSignupArgs>();
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i51.UserSignup(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
    ViewAllPlans.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i52.ViewAllPlans(),
      );
    },
    YearAnalytics.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i53.YearAnalytics(),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutUs]
class AboutUs extends _i54.PageRouteInfo<void> {
  const AboutUs({List<_i54.PageRouteInfo>? children})
      : super(
          AboutUs.name,
          initialChildren: children,
        );

  static const String name = 'AboutUs';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddAccessories]
class AddAccessories extends _i54.PageRouteInfo<AddAccessoriesArgs> {
  AddAccessories({
    _i55.Key? key,
    String? vehicleName,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          AddAccessories.name,
          args: AddAccessoriesArgs(
            key: key,
            vehicleName: vehicleName,
          ),
          initialChildren: children,
        );

  static const String name = 'AddAccessories';

  static const _i54.PageInfo<AddAccessoriesArgs> page =
      _i54.PageInfo<AddAccessoriesArgs>(name);
}

class AddAccessoriesArgs {
  const AddAccessoriesArgs({
    this.key,
    this.vehicleName,
  });

  final _i55.Key? key;

  final String? vehicleName;

  @override
  String toString() {
    return 'AddAccessoriesArgs{key: $key, vehicleName: $vehicleName}';
  }
}

/// generated route for
/// [_i3.AddExpense]
class AddExpense extends _i54.PageRouteInfo<void> {
  const AddExpense({List<_i54.PageRouteInfo>? children})
      : super(
          AddExpense.name,
          initialChildren: children,
        );

  static const String name = 'AddExpense';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i4.AddIncome]
class AddIncome extends _i54.PageRouteInfo<void> {
  const AddIncome({List<_i54.PageRouteInfo>? children})
      : super(
          AddIncome.name,
          initialChildren: children,
        );

  static const String name = 'AddIncome';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i5.AddLeave]
class AddLeave extends _i54.PageRouteInfo<void> {
  const AddLeave({List<_i54.PageRouteInfo>? children})
      : super(
          AddLeave.name,
          initialChildren: children,
        );

  static const String name = 'AddLeave';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i6.AddMileage]
class AddMileage extends _i54.PageRouteInfo<void> {
  const AddMileage({List<_i54.PageRouteInfo>? children})
      : super(
          AddMileage.name,
          initialChildren: children,
        );

  static const String name = 'AddMileage';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i7.AddPersonalDiary]
class AddPersonalDiary extends _i54.PageRouteInfo<void> {
  const AddPersonalDiary({List<_i54.PageRouteInfo>? children})
      : super(
          AddPersonalDiary.name,
          initialChildren: children,
        );

  static const String name = 'AddPersonalDiary';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i8.AddPlan]
class AddPlan extends _i54.PageRouteInfo<void> {
  const AddPlan({List<_i54.PageRouteInfo>? children})
      : super(
          AddPlan.name,
          initialChildren: children,
        );

  static const String name = 'AddPlan';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i9.AddPlanExpense]
class AddPlanExpense extends _i54.PageRouteInfo<AddPlanExpenseArgs> {
  AddPlanExpense({
    _i55.Key? key,
    String? planName,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          AddPlanExpense.name,
          args: AddPlanExpenseArgs(
            key: key,
            planName: planName,
          ),
          initialChildren: children,
        );

  static const String name = 'AddPlanExpense';

  static const _i54.PageInfo<AddPlanExpenseArgs> page =
      _i54.PageInfo<AddPlanExpenseArgs>(name);
}

class AddPlanExpenseArgs {
  const AddPlanExpenseArgs({
    this.key,
    this.planName,
  });

  final _i55.Key? key;

  final String? planName;

  @override
  String toString() {
    return 'AddPlanExpenseArgs{key: $key, planName: $planName}';
  }
}

/// generated route for
/// [_i10.AddVehicle]
class AddVehicle extends _i54.PageRouteInfo<void> {
  const AddVehicle({List<_i54.PageRouteInfo>? children})
      : super(
          AddVehicle.name,
          initialChildren: children,
        );

  static const String name = 'AddVehicle';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i11.Analytics]
class Analytics extends _i54.PageRouteInfo<void> {
  const Analytics({List<_i54.PageRouteInfo>? children})
      : super(
          Analytics.name,
          initialChildren: children,
        );

  static const String name = 'Analytics';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i12.ContactSubmitted]
class ContactSubmitted extends _i54.PageRouteInfo<void> {
  const ContactSubmitted({List<_i54.PageRouteInfo>? children})
      : super(
          ContactSubmitted.name,
          initialChildren: children,
        );

  static const String name = 'ContactSubmitted';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i13.ContactUs]
class ContactUs extends _i54.PageRouteInfo<void> {
  const ContactUs({List<_i54.PageRouteInfo>? children})
      : super(
          ContactUs.name,
          initialChildren: children,
        );

  static const String name = 'ContactUs';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i14.ExpenseAnalytics]
class ExpenseAnalytics extends _i54.PageRouteInfo<void> {
  const ExpenseAnalytics({List<_i54.PageRouteInfo>? children})
      : super(
          ExpenseAnalytics.name,
          initialChildren: children,
        );

  static const String name = 'ExpenseAnalytics';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i15.ExpenseStats]
class ExpenseStats extends _i54.PageRouteInfo<void> {
  const ExpenseStats({List<_i54.PageRouteInfo>? children})
      : super(
          ExpenseStats.name,
          initialChildren: children,
        );

  static const String name = 'ExpenseStats';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i16.FAQ]
class FAQ extends _i54.PageRouteInfo<void> {
  const FAQ({List<_i54.PageRouteInfo>? children})
      : super(
          FAQ.name,
          initialChildren: children,
        );

  static const String name = 'FAQ';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i17.GiftVoucher]
class GiftVoucher extends _i54.PageRouteInfo<void> {
  const GiftVoucher({List<_i54.PageRouteInfo>? children})
      : super(
          GiftVoucher.name,
          initialChildren: children,
        );

  static const String name = 'GiftVoucher';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i18.HelpCentre]
class HelpCentre extends _i54.PageRouteInfo<void> {
  const HelpCentre({List<_i54.PageRouteInfo>? children})
      : super(
          HelpCentre.name,
          initialChildren: children,
        );

  static const String name = 'HelpCentre';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i19.Home]
class Home extends _i54.PageRouteInfo<void> {
  const Home({List<_i54.PageRouteInfo>? children})
      : super(
          Home.name,
          initialChildren: children,
        );

  static const String name = 'Home';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i20.ImageCapture]
class ImageCapture extends _i54.PageRouteInfo<void> {
  const ImageCapture({List<_i54.PageRouteInfo>? children})
      : super(
          ImageCapture.name,
          initialChildren: children,
        );

  static const String name = 'ImageCapture';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i21.IncomeAnalytics]
class IncomeAnalytics extends _i54.PageRouteInfo<void> {
  const IncomeAnalytics({List<_i54.PageRouteInfo>? children})
      : super(
          IncomeAnalytics.name,
          initialChildren: children,
        );

  static const String name = 'IncomeAnalytics';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i22.IncomeStats]
class IncomeStats extends _i54.PageRouteInfo<void> {
  const IncomeStats({List<_i54.PageRouteInfo>? children})
      : super(
          IncomeStats.name,
          initialChildren: children,
        );

  static const String name = 'IncomeStats';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i23.LeaveAnalytics]
class LeaveAnalytics extends _i54.PageRouteInfo<void> {
  const LeaveAnalytics({List<_i54.PageRouteInfo>? children})
      : super(
          LeaveAnalytics.name,
          initialChildren: children,
        );

  static const String name = 'LeaveAnalytics';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i24.MainScreen]
class MainRoute extends _i54.PageRouteInfo<void> {
  const MainRoute({List<_i54.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i25.MileageTracker]
class MileageTracker extends _i54.PageRouteInfo<void> {
  const MileageTracker({List<_i54.PageRouteInfo>? children})
      : super(
          MileageTracker.name,
          initialChildren: children,
        );

  static const String name = 'MileageTracker';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i26.MyAccessory]
class MyAccessory extends _i54.PageRouteInfo<MyAccessoryArgs> {
  MyAccessory({
    _i56.Key? key,
    String? vehicleName,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          MyAccessory.name,
          args: MyAccessoryArgs(
            key: key,
            vehicleName: vehicleName,
          ),
          initialChildren: children,
        );

  static const String name = 'MyAccessory';

  static const _i54.PageInfo<MyAccessoryArgs> page =
      _i54.PageInfo<MyAccessoryArgs>(name);
}

class MyAccessoryArgs {
  const MyAccessoryArgs({
    this.key,
    this.vehicleName,
  });

  final _i56.Key? key;

  final String? vehicleName;

  @override
  String toString() {
    return 'MyAccessoryArgs{key: $key, vehicleName: $vehicleName}';
  }
}

/// generated route for
/// [_i27.MyDiary]
class MyDiary extends _i54.PageRouteInfo<void> {
  const MyDiary({List<_i54.PageRouteInfo>? children})
      : super(
          MyDiary.name,
          initialChildren: children,
        );

  static const String name = 'MyDiary';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i28.MyExpenses]
class MyExpenses extends _i54.PageRouteInfo<void> {
  const MyExpenses({List<_i54.PageRouteInfo>? children})
      : super(
          MyExpenses.name,
          initialChildren: children,
        );

  static const String name = 'MyExpenses';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i29.MyGarage]
class MyGarage extends _i54.PageRouteInfo<void> {
  const MyGarage({List<_i54.PageRouteInfo>? children})
      : super(
          MyGarage.name,
          initialChildren: children,
        );

  static const String name = 'MyGarage';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i30.MyIncomes]
class MyIncomes extends _i54.PageRouteInfo<void> {
  const MyIncomes({List<_i54.PageRouteInfo>? children})
      : super(
          MyIncomes.name,
          initialChildren: children,
        );

  static const String name = 'MyIncomes';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i31.MyLeaves]
class MyLeaves extends _i54.PageRouteInfo<void> {
  const MyLeaves({List<_i54.PageRouteInfo>? children})
      : super(
          MyLeaves.name,
          initialChildren: children,
        );

  static const String name = 'MyLeaves';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i32.Personal]
class Personal extends _i54.PageRouteInfo<void> {
  const Personal({List<_i54.PageRouteInfo>? children})
      : super(
          Personal.name,
          initialChildren: children,
        );

  static const String name = 'Personal';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i33.PlanExpenses]
class PlanExpenses extends _i54.PageRouteInfo<PlanExpensesArgs> {
  PlanExpenses({
    _i56.Key? key,
    String? planName,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          PlanExpenses.name,
          args: PlanExpensesArgs(
            key: key,
            planName: planName,
          ),
          initialChildren: children,
        );

  static const String name = 'PlanExpenses';

  static const _i54.PageInfo<PlanExpensesArgs> page =
      _i54.PageInfo<PlanExpensesArgs>(name);
}

class PlanExpensesArgs {
  const PlanExpensesArgs({
    this.key,
    this.planName,
  });

  final _i56.Key? key;

  final String? planName;

  @override
  String toString() {
    return 'PlanExpensesArgs{key: $key, planName: $planName}';
  }
}

/// generated route for
/// [_i34.SaveImage]
class SaveImage extends _i54.PageRouteInfo<void> {
  const SaveImage({List<_i54.PageRouteInfo>? children})
      : super(
          SaveImage.name,
          initialChildren: children,
        );

  static const String name = 'SaveImage';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i35.SetUserProfile]
class SetUserProfile extends _i54.PageRouteInfo<void> {
  const SetUserProfile({List<_i54.PageRouteInfo>? children})
      : super(
          SetUserProfile.name,
          initialChildren: children,
        );

  static const String name = 'SetUserProfile';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i36.Settings]
class Settings extends _i54.PageRouteInfo<void> {
  const Settings({List<_i54.PageRouteInfo>? children})
      : super(
          Settings.name,
          initialChildren: children,
        );

  static const String name = 'Settings';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i37.SplashScreen]
class SplashRoute extends _i54.PageRouteInfo<void> {
  const SplashRoute({List<_i54.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i38.TermsAndConditions]
class TermsAndConditions extends _i54.PageRouteInfo<void> {
  const TermsAndConditions({List<_i54.PageRouteInfo>? children})
      : super(
          TermsAndConditions.name,
          initialChildren: children,
        );

  static const String name = 'TermsAndConditions';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i39.UpdateAccessories]
class UpdateAccessories extends _i54.PageRouteInfo<UpdateAccessoriesArgs> {
  UpdateAccessories({
    _i55.Key? key,
    String? vehicleName,
    String? id,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          UpdateAccessories.name,
          args: UpdateAccessoriesArgs(
            key: key,
            vehicleName: vehicleName,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateAccessories';

  static const _i54.PageInfo<UpdateAccessoriesArgs> page =
      _i54.PageInfo<UpdateAccessoriesArgs>(name);
}

class UpdateAccessoriesArgs {
  const UpdateAccessoriesArgs({
    this.key,
    this.vehicleName,
    this.id,
  });

  final _i55.Key? key;

  final String? vehicleName;

  final String? id;

  @override
  String toString() {
    return 'UpdateAccessoriesArgs{key: $key, vehicleName: $vehicleName, id: $id}';
  }
}

/// generated route for
/// [_i40.UpdateExpense]
class UpdateExpense extends _i54.PageRouteInfo<UpdateExpenseArgs> {
  UpdateExpense({
    _i55.Key? key,
    String? id,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          UpdateExpense.name,
          args: UpdateExpenseArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateExpense';

  static const _i54.PageInfo<UpdateExpenseArgs> page =
      _i54.PageInfo<UpdateExpenseArgs>(name);
}

class UpdateExpenseArgs {
  const UpdateExpenseArgs({
    this.key,
    this.id,
  });

  final _i55.Key? key;

  final String? id;

  @override
  String toString() {
    return 'UpdateExpenseArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i41.UpdateExpensePlan]
class UpdateExpensePlan extends _i54.PageRouteInfo<UpdateExpensePlanArgs> {
  UpdateExpensePlan({
    _i55.Key? key,
    String? id,
    String? planName,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          UpdateExpensePlan.name,
          args: UpdateExpensePlanArgs(
            key: key,
            id: id,
            planName: planName,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateExpensePlan';

  static const _i54.PageInfo<UpdateExpensePlanArgs> page =
      _i54.PageInfo<UpdateExpensePlanArgs>(name);
}

class UpdateExpensePlanArgs {
  const UpdateExpensePlanArgs({
    this.key,
    this.id,
    this.planName,
  });

  final _i55.Key? key;

  final String? id;

  final String? planName;

  @override
  String toString() {
    return 'UpdateExpensePlanArgs{key: $key, id: $id, planName: $planName}';
  }
}

/// generated route for
/// [_i42.UpdateIncome]
class UpdateIncome extends _i54.PageRouteInfo<UpdateIncomeArgs> {
  UpdateIncome({
    _i56.Key? key,
    String? id,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          UpdateIncome.name,
          args: UpdateIncomeArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateIncome';

  static const _i54.PageInfo<UpdateIncomeArgs> page =
      _i54.PageInfo<UpdateIncomeArgs>(name);
}

class UpdateIncomeArgs {
  const UpdateIncomeArgs({
    this.key,
    this.id,
  });

  final _i56.Key? key;

  final String? id;

  @override
  String toString() {
    return 'UpdateIncomeArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i43.UpdateLeave]
class UpdateLeave extends _i54.PageRouteInfo<UpdateLeaveArgs> {
  UpdateLeave({
    _i56.Key? key,
    String? id,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          UpdateLeave.name,
          args: UpdateLeaveArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateLeave';

  static const _i54.PageInfo<UpdateLeaveArgs> page =
      _i54.PageInfo<UpdateLeaveArgs>(name);
}

class UpdateLeaveArgs {
  const UpdateLeaveArgs({
    this.key,
    this.id,
  });

  final _i56.Key? key;

  final String? id;

  @override
  String toString() {
    return 'UpdateLeaveArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i44.UpdateMileage]
class UpdateMileage extends _i54.PageRouteInfo<UpdateMileageArgs> {
  UpdateMileage({
    _i56.Key? key,
    String? id,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          UpdateMileage.name,
          args: UpdateMileageArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateMileage';

  static const _i54.PageInfo<UpdateMileageArgs> page =
      _i54.PageInfo<UpdateMileageArgs>(name);
}

class UpdateMileageArgs {
  const UpdateMileageArgs({
    this.key,
    this.id,
  });

  final _i56.Key? key;

  final String? id;

  @override
  String toString() {
    return 'UpdateMileageArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i45.UpdatePersonalDiary]
class UpdatePersonalDiary extends _i54.PageRouteInfo<UpdatePersonalDiaryArgs> {
  UpdatePersonalDiary({
    _i56.Key? key,
    String? id,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          UpdatePersonalDiary.name,
          args: UpdatePersonalDiaryArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdatePersonalDiary';

  static const _i54.PageInfo<UpdatePersonalDiaryArgs> page =
      _i54.PageInfo<UpdatePersonalDiaryArgs>(name);
}

class UpdatePersonalDiaryArgs {
  const UpdatePersonalDiaryArgs({
    this.key,
    this.id,
  });

  final _i56.Key? key;

  final String? id;

  @override
  String toString() {
    return 'UpdatePersonalDiaryArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i46.UpdatePlan]
class UpdatePlan extends _i54.PageRouteInfo<UpdatePlanArgs> {
  UpdatePlan({
    _i56.Key? key,
    String? id,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          UpdatePlan.name,
          args: UpdatePlanArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdatePlan';

  static const _i54.PageInfo<UpdatePlanArgs> page =
      _i54.PageInfo<UpdatePlanArgs>(name);
}

class UpdatePlanArgs {
  const UpdatePlanArgs({
    this.key,
    this.id,
  });

  final _i56.Key? key;

  final String? id;

  @override
  String toString() {
    return 'UpdatePlanArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i47.UpdateUserProfile]
class UpdateUserProfile extends _i54.PageRouteInfo<void> {
  const UpdateUserProfile({List<_i54.PageRouteInfo>? children})
      : super(
          UpdateUserProfile.name,
          initialChildren: children,
        );

  static const String name = 'UpdateUserProfile';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i48.UpdateVehicle]
class UpdateVehicle extends _i54.PageRouteInfo<UpdateVehicleArgs> {
  UpdateVehicle({
    _i55.Key? key,
    String? id,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          UpdateVehicle.name,
          args: UpdateVehicleArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateVehicle';

  static const _i54.PageInfo<UpdateVehicleArgs> page =
      _i54.PageInfo<UpdateVehicleArgs>(name);
}

class UpdateVehicleArgs {
  const UpdateVehicleArgs({
    this.key,
    this.id,
  });

  final _i55.Key? key;

  final String? id;

  @override
  String toString() {
    return 'UpdateVehicleArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i49.UserLogin]
class UserLogin extends _i54.PageRouteInfo<void> {
  const UserLogin({List<_i54.PageRouteInfo>? children})
      : super(
          UserLogin.name,
          initialChildren: children,
        );

  static const String name = 'UserLogin';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i50.UserProfile]
class UserProfile extends _i54.PageRouteInfo<void> {
  const UserProfile({List<_i54.PageRouteInfo>? children})
      : super(
          UserProfile.name,
          initialChildren: children,
        );

  static const String name = 'UserProfile';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i51.UserSignup]
class UserSignup extends _i54.PageRouteInfo<UserSignupArgs> {
  UserSignup({
    _i56.Key? key,
    required dynamic Function(bool?) onResult,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          UserSignup.name,
          args: UserSignupArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'UserSignup';

  static const _i54.PageInfo<UserSignupArgs> page =
      _i54.PageInfo<UserSignupArgs>(name);
}

class UserSignupArgs {
  const UserSignupArgs({
    this.key,
    required this.onResult,
  });

  final _i56.Key? key;

  final dynamic Function(bool?) onResult;

  @override
  String toString() {
    return 'UserSignupArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [_i52.ViewAllPlans]
class ViewAllPlans extends _i54.PageRouteInfo<void> {
  const ViewAllPlans({List<_i54.PageRouteInfo>? children})
      : super(
          ViewAllPlans.name,
          initialChildren: children,
        );

  static const String name = 'ViewAllPlans';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i53.YearAnalytics]
class YearAnalytics extends _i54.PageRouteInfo<void> {
  const YearAnalytics({List<_i54.PageRouteInfo>? children})
      : super(
          YearAnalytics.name,
          initialChildren: children,
        );

  static const String name = 'YearAnalytics';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}
