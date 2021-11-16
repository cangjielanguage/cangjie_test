// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum B{a}

enum A<T>{a}

func main():Int64{
    var i = a<Int64> // EXPECTED: regex-not error
    var res_i : Int64 = match (i) {
        case _ : A<Int64> => 0
        case _ => 1
    }
    var j = a // EXPECTED: regex find multiple constructor 'a' of enum declaration
    var res_j : Int64 = match (j) {
        case _ : B => 0
        case _ => 1
    }
    return res_i + res_j
}