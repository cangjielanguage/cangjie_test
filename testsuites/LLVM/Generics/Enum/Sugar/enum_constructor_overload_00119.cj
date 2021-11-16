// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped

enum B<X>{a(X)}

enum A<X>{a(X)}

func main():Int64{
    var j : A = a(1) // EXPECTED: regex-auto generic type should be used with type argument
    var res_j : Int64 = match (j) {
        case _ : A<Int64> => 0
        case _ => 1
    }
    return res_j
}
