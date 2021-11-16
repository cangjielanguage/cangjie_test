// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

class A {
  static var b : Int32 = 0

  func aaa(){
    return b
  }
}

extend A{
  static public func me() {
   var a:()->Int32 = aaa//EXPECTED: regex 'aaa' is non-static member, cannot be accessed by static function 'me'
   a()
  }
}

func main(): Int64 {
  return 2
}