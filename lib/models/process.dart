// enum TransType {
//   pending = 0,  // 对应 0: 待转运
// inTransit = 1, // 对应 1: 转运中
// completed = 2, // 对应 2: 已转运
// paused = 4,    // 对应 4: 已暂停
// }
//
// class Process {
//   Process({
//     required this.stepNo,
//     this.orderId = '',
//     this.productQr = '',
//     this.erpNo = '',
//     this.transType = TransType.pending,  // 默认值设置为待转运
//     this.lineName = '',
//     this.stepName = '',
//     this.workTime = '',
//     this.workUser = '',
//     this.submitUser = '',
//     this.notifiTime = '',
//   });
//
//   final String stepNo;
//   final String orderId;
//   final String productQr;
//   final String erpNo;
//   final TransType transType;  // 使用枚举代替int
//   final String lineName;
//   final String stepName;
//   final String workTime;
//   final String workUser;
//   final String submitUser;
//   final String notifiTime;
//
//   // 工厂构造函数，从 Map 初始化 Process 对象
//   factory Process.fromJson(Map<String, dynamic> json) {
//     return Process(
//       stepNo: json['stepNo'] ?? '',
//       orderId: json['orderId'] ?? '',
//       productQr: json['productQr'] ?? '',
//       erpNo: json['erpNo'] ?? '',
//       transType: _mapIntToTransType(json['transType']),  // 通过int映射到枚举
//       lineName: json['lineName'] ?? '',
//       stepName: json['stepName'] ?? '',
//       workTime: json['workTime'] ?? '',
//       workUser: json['workUser'] ?? '',
//       submitUser: json['submitUser'] ?? '',
//       notifiTime: json['notifiTime'] ?? '',
//     );
//   }
//
//   // 根据 transType 的值转换为枚举类型
//   static TransType _mapIntToTransType(int? value) {
//     switch (value) {
//       case 1:
//         return TransType.inTransit;
//       case 2:
//         return TransType.completed;
//       case 4:
//         return TransType.paused;
//       default:
//         return TransType.pending;
//     }
//   }
//
//   // 获取转运状态的文本描述
//   static String getTransTypeText(TransType type) {
//     switch (type) {
//       case TransType.pending:
//         return '待转运';
//       case TransType.inTransit:
//         return '转运中';
//       case TransType.completed:
//         return '已转运';
//       case TransType.paused:
//         return '已暂停';
//     }
//   }
//
//   // 转换为 Map，方便序列化
//   Map<String, dynamic> toJson() {
//     return {
//       'stepNo': stepNo,
//       'orderId': orderId,
//       'productQr': productQr,
//       'erpNo': erpNo,
//       'transType': _mapTransTypeToInt(transType),  // 将枚举转换为对应的int
//       'lineName': lineName,
//       'stepName': stepName,
//       'workTime': workTime,
//       'workUser': workUser,
//       'submitUser': submitUser,
//       'notifiTime': notifiTime,
//     };
//   }
//
//   // 将枚举类型转换为对应的整数
//   static int _mapTransTypeToInt(TransType type) {
//     switch (type) {
//       case TransType.inTransit:
//         return 1;
//       case TransType.completed:
//         return 2;
//       case TransType.paused:
//         return 4;
//       default:
//         return 0;
//     }
//   }
// }
