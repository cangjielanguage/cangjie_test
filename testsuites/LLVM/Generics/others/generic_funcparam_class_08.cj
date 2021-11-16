// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

func main(): Int64 {
    goo<Int32>(B<Int32>()) // EXPECTED: regex error.*instantiation 'B<Int32>' causes ambiguous functions named 'foo' in declaration 'B<Int32>'
    return 0
}

class B<T> where T<:Int32 {
    func foo(x:Int32){return 1}
    func foo(x:T){return 2}
}


func goo<T>(x:B<T>) where T<:Int32 {}