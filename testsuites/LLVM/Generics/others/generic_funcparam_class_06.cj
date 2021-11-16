// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

func main(): Int64 {
    var a = match (1){
        case x:B<Int32> => 1 // EXPECTED: regex error.*instantiation 'B<Int32>' causes ambiguous functions named 'foo' in declaration 'B<Int32>'
        case _ => 2
    }
    return 0
}

class B<T> where T<:Int32 {
    func foo(x:Int32){return 1}
    func foo(x:T){return 2}
}
