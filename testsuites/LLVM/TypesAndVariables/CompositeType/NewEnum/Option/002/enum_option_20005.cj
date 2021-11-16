// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A{
    a(?Int64)
}

func main(): Int64 {
    var x = 1
    var res = match (x) {
        case x : A => x
        case _ => A.a(Some<Int64>(0))
    }
    match (res) {
        case b(v) => v - 1 // EXPECTED: regex undeclared identifier 'b'
        case _ => 1
    }
}
