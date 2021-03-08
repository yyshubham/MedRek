final List<String> startdate = <String>['7/03/21'];
final List<String> enddate = <String>['14/03/21'];
final List<String> disease = <String>['Corona'];
final List<String> doctor = <String>['JK Singh'];
final List<String> hospital = <String>['JK Hospital'];
final List<String> medicine = <String>['Paracetamol'];
final List<String> tests = <String>['X-Ray'];
int col = 4;
int row = 20;
var twoDList = List.generate(row, (i) => List(col), growable: true);

// final List<List<String>> medication = [''Paracetamol','Disprin''];
Map<String, dynamic> map;
