// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): int64ÿ
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

