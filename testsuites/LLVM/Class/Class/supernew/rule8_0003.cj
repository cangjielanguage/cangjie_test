// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


open class Base{
    init(){
        Test()
    }	
}

class Test <: Base{
    init(){ 
        
    }
}

func main(): Int64 {
    var test: Test = Test()
    return 0
}
