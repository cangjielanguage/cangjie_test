// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class Father{
    static func foo(a:Int8):Int64{return 1}
    
}

class Child <: Father{
    public func foo(a:Int16):Int64{return 2} // EXPECTED: regex non-static member 'foo' cannot have the same name with static member in parent class or interfaces
}

func main(){
    var i = Child()
    if (i.foo(Int16(1)) != Int64(2)) {
        return 1
    }
    return 0
}
