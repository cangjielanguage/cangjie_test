// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class GrandFather{ open func foo(a:Int8):Int64{return 1} }
open class Father <: GrandFather{
    override func foo(a:Int8):Int64{return 1}
    
}

class Child <: Father{
    static func foo(a:Int16):Int64{return 2} // EXPECTED: regex static member 'foo' cannot have the same name with non-static member in parent class or interfaces
}

func main(){
    var i = Child()
    if (Child.foo(Int16(1)) != Int64(2)) {
        return 1
    }
    return 0
}
