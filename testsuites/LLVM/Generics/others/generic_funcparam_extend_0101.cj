// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

func main(): Int64 {
    var a = B<Int32>() // EXPECTED: regex error.*?instantiation 'B<Int32>' causes ambiguous functions named 'foo' in declaration 'B<Int32>'
    return 0
}

class B<T> {}

extend B<T> {
    func foo(x:Int32){return 1}
}

extend B<T> {
    func foo(x:T){return 2}
}
