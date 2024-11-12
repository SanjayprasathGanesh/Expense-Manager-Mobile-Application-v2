import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/model/contact_us/contact_us_model.dart';
import 'package:expense_manager/model/incomes/income_model.dart';
import 'package:expense_manager/model/mygarage/accessories_model.dart';
import 'package:expense_manager/model/mygarage/vehicle_model.dart';
import 'package:expense_manager/model/myplans/plan_exp_model.dart';
import 'package:expense_manager/model/personal_diary/personal_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/expenses/expense_model.dart';
import '../model/leave_tracker/leave_model.dart';
import '../model/mileage_tracker/mileage_model.dart';
import '../model/myplans/plan_model.dart';
import '../model/users/user_model.dart';

class DatabaseConnection {
  Future<void> addUser(User user) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc()
        .set(user.toJson());
  }

  Future<QuerySnapshot> checkUserExist(String? uName) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .where('uName', isEqualTo: uName)
        .get();
  }

  Future<QuerySnapshot> checkUserDetails(String? uName, String? psw) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .where('uName', isEqualTo: uName)
        .where('psw', isEqualTo: psw)
        .get();
  }

  Future<void> addIncomes(Incomes incomes) async {
    return await FirebaseFirestore.instance
        .collection('incomes')
        .doc()
        .set(incomes.toJson());
  }

  Future<QuerySnapshot> getAllIncomes(String? uName, String month) async {
    return FirebaseFirestore.instance
        .collection('incomes')
        .where('uName', isEqualTo: uName!)
        .where('month', isEqualTo: month)
        .orderBy('incomeDate', descending: true)
        .get();
  }

  Future<DocumentSnapshot> getIncomeById(String id) async {
    return FirebaseFirestore.instance.collection('incomes').doc(id).get();
  }

  Future<void> updateIncome(String id, Incomes incomes) async {
    return FirebaseFirestore.instance
        .collection('incomes')
        .doc(id)
        .update(incomes.toJson());
  }

  Future<void> deleteIncome(String id) async {
    return FirebaseFirestore.instance.collection('incomes').doc(id).delete();
  }

  Future<void> addExpenses(Expense expense) async {
    return await FirebaseFirestore.instance
        .collection('expenses')
        .doc()
        .set(expense.toJson());
  }

  Future<QuerySnapshot> getAllExpenses(String? uName, String month) async {
    return FirebaseFirestore.instance
        .collection('expenses')
        .where('uName', isEqualTo: uName!)
        .where('month', isEqualTo: month)
        .orderBy('expenseDate', descending: true)
        .get();
  }

  Future<DocumentSnapshot> getExpenseById(String id) async {
    return FirebaseFirestore.instance.collection('expenses').doc(id).get();
  }

  Future<void> updateExpense(String id, Expense expense) async {
    return FirebaseFirestore.instance
        .collection('expenses')
        .doc(id)
        .update(expense.toJson());
  }

  Future<void> deleteExpense(String id) async {
    return FirebaseFirestore.instance.collection('expenses').doc(id).delete();
  }

  Future<void> addPersonalDiary(PersonalDiary personal) async {
    return FirebaseFirestore.instance
        .collection('personal_diary')
        .doc()
        .set(personal.toJson());
  }

  Future<QuerySnapshot> getAllDiary(String? uName, String month) async {
    return FirebaseFirestore.instance
        .collection('personal_diary')
        .where('uName', isEqualTo: uName!)
        .where('month', isEqualTo: month)
        .orderBy('date', descending: true)
        .get();
  }

  Future<DocumentSnapshot> getDiaryById(String id) async {
    return FirebaseFirestore.instance
        .collection('personal_diary')
        .doc(id)
        .get();
  }

  Future<void> updateDiary(String id, PersonalDiary personal) async {
    return FirebaseFirestore.instance
        .collection('personal_diary')
        .doc(id)
        .update(personal.toJson());
  }

  Future<void> deleteDiary(String id) async {
    return FirebaseFirestore.instance
        .collection('personal_diary')
        .doc(id)
        .delete();
  }

  Future<void> addLeave(Leave leave) async {
    return FirebaseFirestore.instance
        .collection('personal_leave')
        .doc()
        .set(leave.toJson());
  }

  Future<QuerySnapshot> getAllLeaves(String? uName, String month) async {
    return FirebaseFirestore.instance
        .collection('personal_leave')
        .where('uName', isEqualTo: uName!)
        .where('month', isEqualTo: month)
        .orderBy('fromDate', descending: true)
        .get();
  }

  Future<DocumentSnapshot> getLeaveById(String id) async {
    return FirebaseFirestore.instance
        .collection('personal_leave')
        .doc(id)
        .get();
  }

  Future<void> updateLeave(String id, Leave leave) async {
    return FirebaseFirestore.instance
        .collection('personal_leave')
        .doc(id)
        .update(leave.toJson());
  }

  Future<void> deleteLeave(String id) async {
    return FirebaseFirestore.instance
        .collection('personal_leave')
        .doc(id)
        .delete();
  }

  Future<void> addMileage(Mileage mileage) async {
    return FirebaseFirestore.instance
        .collection('mileage')
        .doc()
        .set(mileage.toJson());
  }

  Future<QuerySnapshot> getAllMileage(String? uName) async {
    return FirebaseFirestore.instance
        .collection('mileage')
        .where('uName', isEqualTo: uName!)
        .orderBy('date', descending: true)
        .get();
  }

  Future<DocumentSnapshot> getMileageById(String id) async {
    return FirebaseFirestore.instance.collection('mileage').doc(id).get();
  }

  Future<void> updateMileage(String id, Mileage mileage) async {
    return FirebaseFirestore.instance
        .collection('mileage')
        .doc(id)
        .update(mileage.toJson());
  }

  Future<void> deleteMileage(String id) async {
    return FirebaseFirestore.instance.collection('mileage').doc(id).delete();
  }

  Future<void> addVehicle(Vehicle vehicle) async {
    return FirebaseFirestore.instance
        .collection('vehicles')
        .doc()
        .set(vehicle.toJson());
  }

  Future<QuerySnapshot> getAllVehicles(String? uName) async {
    return FirebaseFirestore.instance
        .collection('vehicles')
        .where('uName', isEqualTo: uName!)
        .orderBy('buyedOn', descending: true)
        .get();
  }

  Future<DocumentSnapshot> getVehicleById(String id) async {
    return FirebaseFirestore.instance.collection('vehicles').doc(id).get();
  }

  Future<void> updateVehicle(String id, Vehicle vehicle) async {
    return FirebaseFirestore.instance
        .collection('vehicles')
        .doc(id)
        .update(vehicle.toJson());
  }

  Future<void> deleteVehicle(String id) async {
    return FirebaseFirestore.instance.collection('vehicles').doc(id).delete();
  }

  Future<void> addAccessories(Accessories accessories) async {
    return FirebaseFirestore.instance
        .collection('accessories')
        .doc()
        .set(accessories.toJson());
  }

  Future<QuerySnapshot> getAccessoriesForVehicles(
      String? uName, String? vehicleName) async {
    return FirebaseFirestore.instance
        .collection('accessories')
        .where('uName', isEqualTo: uName!)
        .where('vehicleName', isEqualTo: vehicleName)
        .orderBy('buyedOn', descending: true)
        .get();
  }

  Future<DocumentSnapshot> getAccessoryById(String id) async {
    return FirebaseFirestore.instance.collection('accessories').doc(id).get();
  }

  Future<void> updateAccessory(String id, Accessories accessories) async {
    return FirebaseFirestore.instance
        .collection('accessories')
        .doc(id)
        .update(accessories.toJson());
  }

  Future<void> deleteAccessory(String id) async {
    return FirebaseFirestore.instance
        .collection('accessories')
        .doc(id)
        .delete();
  }

  Future<QuerySnapshot> getExpenseByName(String name, String uName) async {
    return FirebaseFirestore.instance
        .collection('expenses')
        .where('expenseName', isEqualTo: name)
        .where('uName', isEqualTo: uName)
        .orderBy('expenseName', descending: true)
        .get();
  }

  Future<QuerySnapshot> getExpenseByDate(String date, String uName) async {
    return FirebaseFirestore.instance
        .collection('expenses')
        .where('expenseDate', isEqualTo: date)
        .where('uName', isEqualTo: uName)
        .orderBy('expenseDate', descending: true)
        .get();
  }

  Future<QuerySnapshot> getExpenseByAmount(int amt, String uName) async {
    return FirebaseFirestore.instance
        .collection('expenses')
        .where('expenseAmt', isEqualTo: amt)
        .where('uName', isEqualTo: uName)
        .orderBy('expenseDate', descending: true)
        .get();
  }

  Future<QuerySnapshot> getExpenseByType(String type, String uName) async {
    return FirebaseFirestore.instance
        .collection('expenses')
        .where('expenseType', isEqualTo: type)
        .where('uName', isEqualTo: uName)
        .orderBy('expenseDate', descending: true)
        .get();
  }

  Future<QuerySnapshot> getExpenseByTrans(String trans, String uName) async {
    return FirebaseFirestore.instance
        .collection('expenses')
        .where('expenseTrans', isEqualTo: trans)
        .where('uName', isEqualTo: uName)
        .orderBy('expenseDate', descending: true)
        .get();
  }

  Future<QuerySnapshot> getIncomeByName(String name, String uName) async {
    return FirebaseFirestore.instance
        .collection('incomes')
        .where('incomeName', isEqualTo: name)
        .where('uName', isEqualTo: uName)
        .orderBy('incomeName', descending: true)
        .get();
  }

  Future<QuerySnapshot> getIncomeByDate(String date, String uName) async {
    return FirebaseFirestore.instance
        .collection('incomes')
        .where('incomeDate', isEqualTo: date)
        .where('uName', isEqualTo: uName)
        .orderBy('incomeDate', descending: true)
        .get();
  }

  Future<QuerySnapshot> getIncomeByAmount(int amt, String uName) async {
    return FirebaseFirestore.instance
        .collection('incomes')
        .where('incomeAmt', isEqualTo: amt)
        .where('uName', isEqualTo: uName)
        .orderBy('incomeDate', descending: true)
        .get();
  }

  Future<QuerySnapshot> getIncomeByType(String type, String uName) async {
    return FirebaseFirestore.instance
        .collection('incomes')
        .where('incomeType', isEqualTo: type)
        .where('uName', isEqualTo: uName)
        .orderBy('incomeDate', descending: true)
        .get();
  }

  Future<QuerySnapshot> getIncomeByTrans(String trans, String uName) async {
    return FirebaseFirestore.instance
        .collection('incomes')
        .where('incomeTrans', isEqualTo: trans)
        .where('uName', isEqualTo: uName)
        .orderBy('incomeDate', descending: true)
        .get();
  }

  Future<QuerySnapshot> getExpenseForYear(String uName) async {
    return FirebaseFirestore.instance
        .collection('expenses')
        .where('uName', isEqualTo: uName)
        .get();
  }

  Future<QuerySnapshot> getIncomeForYear(String uName) async {
    return FirebaseFirestore.instance
        .collection('incomes')
        .where('uName', isEqualTo: uName)
        .get();
  }

  Future<QuerySnapshot> getLeavesForAnalytics(String? uName) async {
    return FirebaseFirestore.instance
        .collection('personal_leave')
        .where('uName', isEqualTo: uName)
        .get();
  }

  Future<void> addNewPlan(Plans plans) async {
    return FirebaseFirestore.instance
        .collection('plans')
        .doc()
        .set(plans.toJson());
  }

  Future<QuerySnapshot> getAllPlan(String? uName) async {
    return FirebaseFirestore.instance
        .collection('plans')
        .where('uName', isEqualTo: uName)
        .orderBy('fromDate', descending: true)
        .get();
  }

  Future<DocumentSnapshot> getAllPlanById(String? id) async {
    return FirebaseFirestore.instance.collection('plans').doc(id!).get();
  }

  Future<void> updatePlan(String? id, Plans plans) async {
    return FirebaseFirestore.instance
        .collection('plans')
        .doc(id)
        .update(plans.toJson());
  }

  Future<void> deletePlan(String? id) async {
    return FirebaseFirestore.instance.collection('plans').doc(id).delete();
  }

  Future<void> addExpPlan(PlanExpense expense) async {
    return FirebaseFirestore.instance
        .collection('expense_plans')
        .doc()
        .set(expense.toJson());
  }

  Future<QuerySnapshot> getAllExpPlan(String? uName, String? planName) async {
    return FirebaseFirestore.instance
        .collection('expense_plans')
        .where('uName', isEqualTo: uName)
        .where('planName', isEqualTo: planName)
        .orderBy('planExpenseDate', descending: true)
        .get();
  }

  Future<DocumentSnapshot> getAllExpPlanById(String? id) async {
    return FirebaseFirestore.instance
        .collection('expense_plans')
        .doc(id!)
        .get();
  }

  Future<void> updateExpensePlan(String? id, PlanExpense expense) async {
    return FirebaseFirestore.instance
        .collection('expense_plans')
        .doc(id)
        .update(expense.toJson());
  }

  Future<void> deleteExpensePlan(String? id) async {
    return FirebaseFirestore.instance
        .collection('expense_plans')
        .doc(id)
        .delete();
  }

  Future<void> updatePlanExp(String? planName, int? amt) async {
    QuerySnapshot qs = await FirebaseFirestore.instance
        .collection('plans')
        .where('planName', isEqualTo: planName)
        .get();

    String id = '';
    if (qs.size == 1) {
      id = qs.docs[0].id;
    } else {
      id = qs.docs[qs.size - 1].id;
    }

    int ttl = 0;
    for (int i = 0; i < qs.size; i++) {
      Map<String, dynamic> json = qs.docs[i].data() as Map<String, dynamic>;
      Plans plans = Plans.fromJson(json);

      ttl += plans.ttlExp!;
    }

    ttl += amt!;

    return FirebaseFirestore.instance
        .collection('plans')
        .doc(id)
        .update({'ttlExp': ttl});
  }

  Future<void> sendFeedback(ContactUs contactUs) async {
    return FirebaseFirestore.instance
        .collection('contact_us')
        .doc()
        .set(contactUs.toJson());
  }

  Future<QuerySnapshot> getUserById(String userName) async {
    return FirebaseFirestore.instance
        .collection('users')
        .where('uName', isEqualTo: userName)
        .get();
  }

  Future<void> updateUserProfile(String userId, User user) async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update(user.toJson());
  }

  like(String uName) async {
    return FirebaseFirestore.instance
        .collection('likes')
        .doc()
        .set({'uName': uName});
  }

  Future<bool> isLiked(String uName) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('likes')
        .where('uName', isEqualTo: uName)
        .get();

    if (querySnapshot.size >= 1) {
      return true;
    }
    return false;
  }

  Future<int> getLikesCount() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('likes').get();
    return querySnapshot.size;
  }

  unLike(String uName) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('likes')
        .where('uName', isEqualTo: uName)
        .get();

    String docId = querySnapshot.docs.first.id;

    FirebaseFirestore.instance.collection('likes').doc(docId).delete();
  }

  deleteUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString('uName');

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('user')
        .where('uName', isEqualTo: userId)
        .get();

    String docId = querySnapshot.docs.first.id;

    return FirebaseFirestore.instance.collection('user').doc(docId).delete();
  }
}
