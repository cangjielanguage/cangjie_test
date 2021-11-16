// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


open class Base{
    init(){
    }	
}

class Test <: Base{
    init(){ 
        this(false)
    }

    init(a: Bool){
    	if(a){
            this() //EXPECTED: regex call to 'this' must be first expression in constructor of class 'Test'

        }
        
    }
}

func main(): Int64 {
    var test: Test = Test()
    return 0
}
