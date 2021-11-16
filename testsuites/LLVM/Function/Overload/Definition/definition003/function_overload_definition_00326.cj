// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

interface Father{
    static func foo(a:Int8):Int64{return 1}
    
}

class Child <: Father{
    protected func foo(a:Int16):Int64{return 2} //EXPECTED: regex non-static member 'foo' cannot have the same name with static member in parent class or interfaces
}

func main(){
    return 0
}
