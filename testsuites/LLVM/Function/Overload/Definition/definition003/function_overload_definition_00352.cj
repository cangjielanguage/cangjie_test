// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface Father{
    static func foo(a:Int8):Int64{return 1}
    
}

abstract class Child <: Father{
    public func foo(a:Int16):Int64{return 1} // EXPECTED: regex non-static member 'foo' cannot have the same name with static member in parent class or interfaces
}

func main(){
    return 0
}
