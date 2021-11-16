// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let val1 = {
                    func Add<T>(a: T, b: T): T {
                        var res = a
                        return res
                    }
                    Add(3,3)
                }

    var pattern1 = match val1 {
        case _ : Int64 => 1
        case _ => 0
    }

    if val1 != 3 || pattern1 != 1 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace