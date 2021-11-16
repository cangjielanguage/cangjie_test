// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Base {
    var b :Int32 = 6
    private init(){
      this.b = 5
    }
	
}

class Test <: Base{
    var a: Int32 = 3
    Test(){ //EXPECTED: regex there is no non-parameter constructor in super class, please invoke super call explicitly
      this.a == a
    }

    init(x: Int32){ //EXPECTED: regex there is no non-parameter constructor in super class, please invoke super call explicitly
        super.b = x
        this.a = x
    }
}

func main(): Int64 {
    var test = Test()
    var test2 = Test(8)
    if(test.b == 5 && test.a == 3 && test2.a == 8 && test2.b == 8 ){
        return 0
    } 
    return 1
}
