import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // Lấy tham chiếu của bộ sưu tập đơn hàng
  final CollectionReference orders =
  FirebaseFirestore.instance.collection('orders');

  // Lưu đơn hàng vào cơ sở dữ liệu
  Future<void> saveOrderToDatabase(String receipt) async {
    await orders.add({
      'date': DateTime.now(),
      'order': receipt,
      // Thêm các trường khác nếu cần..
    });
  }
}
