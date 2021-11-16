// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class R{
  protected func a(){
    c = 10
  }
}

var c: Int32 = 0
let b = R().a   //EXPECTED: regex can not access function 'a'


func main(): Int64{
  let d = R().a   //EXPECTED: regex can not access function 'a'

  R().a()   //EXPECTED: regex no matching function declaration for function call 'a'
	b()
	return Int64(c - 10)
}