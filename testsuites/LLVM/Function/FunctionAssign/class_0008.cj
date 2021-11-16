// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

abstract class R{
	var c: Int32 = 0
  open func a(): Int32{
    c = 10
    return 1
  }
}

class C <: R{
	let b : ()->Int32
	init(){
	  b = { => 3}
	  b = super.a //EXPECTED:regex 'open' modifier member 'a' cannot be accessed in constructor of class 'C'
	}
}


var a = C().b

func main(): Int64{
	var c = a()
	return Int64(c - 1)
}