
class InvoiceDetailsModel{
  String? _id;
  String? _name;
  String? _unitNo;
  String? _price;
  String? _quantity;
  String? _total;
  String? _expireDate;

  InvoiceDetailsModel({
    required String id,
    required String name,
    required String unitNo,
    required String price,
    required String quantity,
    required String total,
    required String expireDate
}){
    _name = name;
    _id = id;
    _unitNo = unitNo;
    _price = price;
    _quantity = quantity;
    _total = total;
    _expireDate = expireDate;
  }


  toJson(){
    return {
      "id": _id,
      "name": _name,
      "unitNo": _unitNo,
      "price": _price,
      "quantity": _quantity,
      "total": _total,
      "expireDate": _expireDate
    };
  }

  InvoiceDetailsModel.fromJson(Map<String, dynamic> json){
    _name = json["name"];
    _id = json["id"];
    _unitNo = json["unitNo"];
    _price = json["price"];
    _quantity = json["quantity"];
    _total = json["total"];
    _expireDate = json["expireDate"];
  }

  String get id => _id ?? "";

  String get expireDate => _expireDate ?? "";

  String get total => _total ?? "";

  String get quantity => _quantity ?? "";

  String get price => _price ?? "";

  String get unitNo => _unitNo ?? "";

  String get name => _name ?? "";
}