// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface Father{
    func foo(a:Int8):Int64
    
}

abstract class Child <: Father{
    static func foo(a:Int16):Int64{return 1} // EXPECTED: regex static member 'foo' cannot have the same name with non-static member in parent class or interfaces
}

func main(){
    return 0
}
