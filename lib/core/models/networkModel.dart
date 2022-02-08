class NetworkModel{
  IPModel? eth0;
  IPModel? wifi;
  NetworkModel({this.eth0,this.wifi});
  factory NetworkModel.fromJson(Map<String,dynamic>? json){
    if(json!=null){
      return NetworkModel(
        eth0: json["eth0"]!=null ? IPModel.fromJson(json["eth0"]) : null,
        wifi: json["wifi"]!=null ? IPModel.fromJson(json["wifi"]) : null,
      );
    } else {
      return NetworkModel();
    }
  }
  Map<String,dynamic> toJson(){
    return{
      "eth0": eth0!=null ? eth0!.toJson() : null,
      "wifi": wifi!=null ? wifi!.toJson() : null,
    };
  }
}

class IPModel{
  String? ip;
  String? mac;
  String? name;

  IPModel({this.ip,this.mac,this.name});
  factory IPModel.fromJson(Map<String,dynamic>? json){
    if(json!=null){
      return IPModel(
        ip: json["ip"],
        mac: json["mac"],
        name: json["name"],
      );
    } else {
      return IPModel();
    }
  }

  Map<String,dynamic> toJson(){
    return{
      "ip":ip,
      "mac":mac,
      "name":name,
    };
  }

}