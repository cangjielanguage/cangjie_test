// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

func main(): Int64 {
    var a:B<Int32> // EXPECTED: regex-auto instantiation 'B<Int32>' causes ambiguous functions named '+' in declaration 'B<Int32>'
    return 0
}

class B<T> {
    operator func +(x:Int32){return 1}
    operator func +(x:T){return 2}
}
