// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

func main(): Int64 {
    return 0
}

class B<T> {
    func foo(x:Int32){return 1}
    func foo(x:T){return 2}
}

class C<T> where T<: B<Int32>{} // EXPECTED: regex error.*?instantiation 'B<Int32>' causes ambiguous functions named 'foo' in declaration 'B<Int32>'