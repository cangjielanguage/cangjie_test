// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

func main(): Int64 {
    B<Int32>.foo(1) // EXPECTED: regex error.*ambiguous match for function call 'foo'
    return 0
}

class B<T> where T<:Int32 {
    static func foo(x:Int32){return 1}  // EXPECTED: regex note.*found candidate
    static func foo(x:T){return 2} // EXPECTED: regex note.*found candidate
}
