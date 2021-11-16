// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

enum B{a(Int32)}

enum A{a(Int64)}

func main():Int64{
    var j = a(1) // EXPECTED: regex find multiple constructor 'a' of enum declaration
    var res_j : Int64 = match (j) {
        case _ : A => 0
        case _ => 1
    }
    return res_j
}