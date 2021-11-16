// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let val1 = {
                    func returnAdd(a: Int64, b: Int64):(Int64, Int64)->Int64 {
                        return { a: Int64, b: Int64 => a + b}
                    }
                    var sum = returnAdd(2,3)
                    sum
                }(2,3)

    var pattern1 = match val1 {
        case _ : Int64 => 1
        case _ => 0
    }

    if val1!= 5 || pattern1 != 1 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace