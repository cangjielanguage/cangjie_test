// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped

enum B<X>{a(X)}

enum A<X>{a(X)}

func main():Int64{
    var j = a<Int64>(1) // EXPECTED: regex find multiple constructor 'a' of enum declaration
    var res_j : Int64 = match (j) {
        case _ : A<Int64> => 0
        case _ => 1
    }
    return res_j
}
