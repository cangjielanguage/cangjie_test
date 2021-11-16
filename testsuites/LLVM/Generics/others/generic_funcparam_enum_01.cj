// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

func main(): Int64 {
    var a = B<Int32>.Day // EXPECTED: regex error.*?instantiation 'B<Int32>' causes ambiguous functions named 'foo' in declaration 'B<Int32>'
    return 0
}

enum B<T> {
    Year | Day
    func foo(x:Int32){return 1}
    func foo(x:T){return 2}
}
