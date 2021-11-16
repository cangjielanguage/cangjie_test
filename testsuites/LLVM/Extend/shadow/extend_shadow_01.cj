// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

class A{
	private var a:Int32 = 1
	private let b:Unit = ()
	protected var aa:Char = 'a'
	protected let bb:Bool = true
	private func foo(){

	}

	protected func foo1(){
	
	}
}

extend A {
    func plus(): Int32 { 
      a // EXPECTED: regex can not access field 'a'
      b // EXPECTED: regex can not access field 'b'
      aa // EXPECTED: regex can not access field 'aa'
      bb // EXPECTED: regex can not access field 'bb'
      foo() // EXPECTED: regex no matching function declaration for function call 'foo'
      foo1() // EXPECTED: regex no matching function declaration for function call 'foo1'

    }
}



func main(): Int64 {
    return 0
}
