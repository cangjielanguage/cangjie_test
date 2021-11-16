// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface Father{
    func foo(a:Int8):Int64
    
}

interface Child <: Father{
    static func foo(a:Int16):Int64{return 1} // EXPECTED: regex static member 'foo' cannot have the same name with non-static member in parent class or interfaces
}

func main(){
    return 0
}
