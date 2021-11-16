// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

func main(): Int64 {
    var a = C<Int32>() // EXPECTED: regex error.*?instantiation 'C<Int32>' causes ambiguous functions named 'foo' between declaration 'C<Int32>' and declaration 'B<Int32>'
    return 0
}

interface B<T> {
    func foo(x:Int32){return 1}
}

class C<T> <: B<T>{
    func foo(x:T){return 2}
}