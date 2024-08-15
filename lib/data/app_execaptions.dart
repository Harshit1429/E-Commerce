class AppExceptions implements Exception{

  final _massage;
  final _perfix;
  AppExceptions([this._massage,this._perfix]);

  @override
  String toString(){
    return '$_perfix,$_massage';
  }

}

 class FatchDataExecption extends AppExceptions{
   FatchDataExecption([String? massage]) : super(massage , 'Error during communication');
 }

class BadRequestExecption extends AppExceptions{
  BadRequestExecption([String? massage]) : super(massage , 'Invalid request');
}

class UnAuthorizedExecption extends AppExceptions{
  UnAuthorizedExecption([String? massage]) : super(massage , 'Unauthorised request');
}

class InvalidInputExecption extends AppExceptions{
  InvalidInputExecption([String? massage]) : super(massage , 'Invalid input');
}