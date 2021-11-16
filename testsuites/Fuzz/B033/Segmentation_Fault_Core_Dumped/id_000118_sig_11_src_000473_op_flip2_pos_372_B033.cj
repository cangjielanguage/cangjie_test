// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    let val1 = {
                    func add(a: Int64, b: Int64):Int64 {
                       return a+b
                    }

                    func returnAdd(a: Int64, b: Int64):(Int64, Int64)->Int64 {
                        return add
                    }
#                   returnAdd(2,3)
                }(2,3)

    var pattern1 = match val1 {
        case _ : Int64 => 1
        case _ => 0
    }

    if val1 != 5 || pattern1 != 1 {
        return 1
    }

    return 0
}

