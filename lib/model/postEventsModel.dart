class PostModel {
  String name;
  String startTime;
  String endTime;
  String date;
  String phoneNumber;

  PostModel(
      {this.name, this.startTime, this.endTime, this.date, this.phoneNumber});



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['date'] = this.date;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}