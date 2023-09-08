// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  int? get orderNo => throw _privateConstructorUsedError;
  String? get orderStatus => throw _privateConstructorUsedError;
  int? get tableNo => throw _privateConstructorUsedError;
  List<RestaurantMenu>? get items => throw _privateConstructorUsedError;
  String? get customerName => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  Map<String, int>? get quanntity => throw _privateConstructorUsedError;
  double? get tax => throw _privateConstructorUsedError;
  double? get discount => throw _privateConstructorUsedError;
  String? get contactNo => throw _privateConstructorUsedError;
  double? get totalPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {int? orderNo,
      String? orderStatus,
      int? tableNo,
      List<RestaurantMenu>? items,
      String? customerName,
      double? price,
      Map<String, int>? quanntity,
      double? tax,
      double? discount,
      String? contactNo,
      double? totalPrice});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderNo = freezed,
    Object? orderStatus = freezed,
    Object? tableNo = freezed,
    Object? items = freezed,
    Object? customerName = freezed,
    Object? price = freezed,
    Object? quanntity = freezed,
    Object? tax = freezed,
    Object? discount = freezed,
    Object? contactNo = freezed,
    Object? totalPrice = freezed,
  }) {
    return _then(_value.copyWith(
      orderNo: freezed == orderNo
          ? _value.orderNo
          : orderNo // ignore: cast_nullable_to_non_nullable
              as int?,
      orderStatus: freezed == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      tableNo: freezed == tableNo
          ? _value.tableNo
          : tableNo // ignore: cast_nullable_to_non_nullable
              as int?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RestaurantMenu>?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      quanntity: freezed == quanntity
          ? _value.quanntity
          : quanntity // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      contactNo: freezed == contactNo
          ? _value.contactNo
          : contactNo // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$_OrderCopyWith(_$_Order value, $Res Function(_$_Order) then) =
      __$$_OrderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? orderNo,
      String? orderStatus,
      int? tableNo,
      List<RestaurantMenu>? items,
      String? customerName,
      double? price,
      Map<String, int>? quanntity,
      double? tax,
      double? discount,
      String? contactNo,
      double? totalPrice});
}

/// @nodoc
class __$$_OrderCopyWithImpl<$Res> extends _$OrderCopyWithImpl<$Res, _$_Order>
    implements _$$_OrderCopyWith<$Res> {
  __$$_OrderCopyWithImpl(_$_Order _value, $Res Function(_$_Order) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderNo = freezed,
    Object? orderStatus = freezed,
    Object? tableNo = freezed,
    Object? items = freezed,
    Object? customerName = freezed,
    Object? price = freezed,
    Object? quanntity = freezed,
    Object? tax = freezed,
    Object? discount = freezed,
    Object? contactNo = freezed,
    Object? totalPrice = freezed,
  }) {
    return _then(_$_Order(
      orderNo: freezed == orderNo
          ? _value.orderNo
          : orderNo // ignore: cast_nullable_to_non_nullable
              as int?,
      orderStatus: freezed == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      tableNo: freezed == tableNo
          ? _value.tableNo
          : tableNo // ignore: cast_nullable_to_non_nullable
              as int?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RestaurantMenu>?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      quanntity: freezed == quanntity
          ? _value._quanntity
          : quanntity // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      contactNo: freezed == contactNo
          ? _value.contactNo
          : contactNo // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Order implements _Order {
  const _$_Order(
      {this.orderNo,
      this.orderStatus,
      this.tableNo,
      final List<RestaurantMenu>? items,
      this.customerName,
      this.price,
      final Map<String, int>? quanntity,
      this.tax,
      this.discount,
      this.contactNo,
      this.totalPrice})
      : _items = items,
        _quanntity = quanntity;

  factory _$_Order.fromJson(Map<String, dynamic> json) =>
      _$$_OrderFromJson(json);

  @override
  final int? orderNo;
  @override
  final String? orderStatus;
  @override
  final int? tableNo;
  final List<RestaurantMenu>? _items;
  @override
  List<RestaurantMenu>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? customerName;
  @override
  final double? price;
  final Map<String, int>? _quanntity;
  @override
  Map<String, int>? get quanntity {
    final value = _quanntity;
    if (value == null) return null;
    if (_quanntity is EqualUnmodifiableMapView) return _quanntity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final double? tax;
  @override
  final double? discount;
  @override
  final String? contactNo;
  @override
  final double? totalPrice;

  @override
  String toString() {
    return 'Order(orderNo: $orderNo, orderStatus: $orderStatus, tableNo: $tableNo, items: $items, customerName: $customerName, price: $price, quanntity: $quanntity, tax: $tax, discount: $discount, contactNo: $contactNo, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Order &&
            (identical(other.orderNo, orderNo) || other.orderNo == orderNo) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.tableNo, tableNo) || other.tableNo == tableNo) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality()
                .equals(other._quanntity, _quanntity) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.contactNo, contactNo) ||
                other.contactNo == contactNo) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderNo,
      orderStatus,
      tableNo,
      const DeepCollectionEquality().hash(_items),
      customerName,
      price,
      const DeepCollectionEquality().hash(_quanntity),
      tax,
      discount,
      contactNo,
      totalPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      __$$_OrderCopyWithImpl<_$_Order>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  const factory _Order(
      {final int? orderNo,
      final String? orderStatus,
      final int? tableNo,
      final List<RestaurantMenu>? items,
      final String? customerName,
      final double? price,
      final Map<String, int>? quanntity,
      final double? tax,
      final double? discount,
      final String? contactNo,
      final double? totalPrice}) = _$_Order;

  factory _Order.fromJson(Map<String, dynamic> json) = _$_Order.fromJson;

  @override
  int? get orderNo;
  @override
  String? get orderStatus;
  @override
  int? get tableNo;
  @override
  List<RestaurantMenu>? get items;
  @override
  String? get customerName;
  @override
  double? get price;
  @override
  Map<String, int>? get quanntity;
  @override
  double? get tax;
  @override
  double? get discount;
  @override
  String? get contactNo;
  @override
  double? get totalPrice;
  @override
  @JsonKey(ignore: true)
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      throw _privateConstructorUsedError;
}
