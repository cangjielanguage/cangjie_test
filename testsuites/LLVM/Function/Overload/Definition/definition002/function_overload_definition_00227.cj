// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class Father{
    static func foo(a:Int8):Int64{return 1} // EXPECTED: regex static and non-static function 'foo' cannot be overloaded
    open func foo(a:Int16):Int64{return 1}
}

class Child <: Father{
    override func foo(a:Int16):Int64{return 2}
}

func main(){
    var i = Child()
    if (i.foo(Int16(1)) != Int64(2)) {
        return 1
    }
    return 0
}
