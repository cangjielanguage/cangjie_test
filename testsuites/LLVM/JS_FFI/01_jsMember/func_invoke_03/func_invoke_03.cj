// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix


@JavaScript
foreign class Moment {
  func fromNow() : Bool
}

@JsMember["./momentMember"]
foreign func moment1() : Moment

class A{
  static var a = moment1
  static let b = moment1()
}

unsafe func main() {
  if(A.a().fromNow() && A.b.fromNow()){
    return 0;
  }
  return 1;
}
