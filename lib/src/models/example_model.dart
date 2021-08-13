class ExampleModel {
  late int userId; 

  ExampleModel.formJson(Map<String, dynamic> jsonDecoded){
    this.userId = jsonDecoded['userId'];
  }
}