import 'dart:math' as math;

class Circle {
  double radius;
  Circle(this.radius);
  double get area => math.pi * math.pow(radius, 2);
}

class Nag {
  String name;
  List<Nag> _myList=[];

  Nag(this.name);

  String hello(String pre) {
    return pre+' ' + name;
  }
  void printMyList(){
      for (var item in _myList) {
        print(item.name);
      }
  }
}

void main() {
  var nag=Nag('NagRaj');
  print(Circle(2.0).area);
  print(nag.hello('hai'));
  print(Circle(2).area);
  nag.printMyList();
  // nag._myList.add(2);
  // nag._myList.add(6);
  nag._myList.add(nag);
  nag._myList.add(nag);
  nag.printMyList();
}
