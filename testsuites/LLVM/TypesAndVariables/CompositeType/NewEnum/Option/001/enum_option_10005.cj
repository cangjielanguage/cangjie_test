// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan newlines are not allowed between '?' and the type followed it

func main(): Int64 {
    var a : ?
    Int64 = 100
    match (a) {
        case _ : Option<Int64> => 0
        case _ => 1
    }
}
