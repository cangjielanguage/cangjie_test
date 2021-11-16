// EXEC: %compiler %cmp_opt %f -o %output
interface I1{
    let test : Int64 = 1
    let lambda = (i: Int64): Int64 => {test - i}
}

func main(): Int64 {
    return 1
}
