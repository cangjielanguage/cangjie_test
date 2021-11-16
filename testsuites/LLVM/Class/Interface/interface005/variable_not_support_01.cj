// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class A{}

interface I<T>{
  static var a1: Int32 = 0 // EXPECTED: regex variable 'a1' can not be declared in interface
  var a2 = 0 // EXPECTED: regex variable 'a2' can not be declared in interface
  var a3: Bool // EXPECTED: regex  variable 'a3' can not be declared in interface
  var a4: Array<Char> // EXPECTED: regex  variable 'a4' can not be declared in interface
  var a5: T // EXPECTED: regex  variable 'a5' can not be declared in interface

  static let a6: Int32 = 0 // EXPECTED: regex variable 'a6' can not be declared in interface
  let a7 = 0 // EXPECTED: regex variable 'a7' can not be declared in interface
  let a8: Bool // EXPECTED: regex  variable 'a8' can not be declared in interface
  let a9: Array<Char> // EXPECTED: regex  variable 'a9' can not be declared in interface
  let a10: T // EXPECTED: regex  variable 'a10' can not be declared in interface

  let a11: A // EXPECTED: regex  variable 'a11' can not be declared in interface
  let a12: ()->Unit // EXPECTED: regex  variable 'a12' can not be declared in
  let a13: List<Bool> // EXPECTED: regex  variable 'a13' can not be declared in interface
}

func main(): Int64{
	return 0
}