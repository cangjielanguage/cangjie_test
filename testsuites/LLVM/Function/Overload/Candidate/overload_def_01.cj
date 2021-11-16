// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    if ( foo(1) != 5 ){ // EXPECTED: regex 
        return 1
    }
    if ( C().foo(1) != 1) {
        return 1
    }
    if ( R().foo(1) != 2) {
        return 1
    }
    return 0
}

enum TimeUnit {
    foo(Int32)
}
class C{
    func foo(x:Int32){return x}
}
record R{
    func foo(x:Int32){return x+1}
}
interface I{
    func foo(x:Int32){return x+2}
}
func foo(x:Int32){
    func foo(x:Int32){return x+3}
    return foo(x)+1
}
