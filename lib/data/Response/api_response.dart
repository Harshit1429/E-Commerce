
import 'package:ecommerce/data/Response/status.dart';

class ApiResponses<T>{
  Status? status;
  T? data;
  String? message;

  ApiResponses(this.status,this.data,this.message);

  ApiResponses.loading() : status = Status.LOADING ;

  ApiResponses.complete(this.data) : status = Status.COMPLEATED ;

  ApiResponses.error(this.message)  : status = Status.ERROR ;

  @override
  String toString(){
    return "Status : $status \n Message : $message \n Data : $data ";
  }




}