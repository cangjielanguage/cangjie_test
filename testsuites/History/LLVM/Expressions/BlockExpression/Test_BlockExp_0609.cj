// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let a = 1

    func f1(): Int64{
        let a = 2
        func f2(): Int64 {
            if {a} != 2{
                return 1
            }
            let a = 3
            return 0
        }
        f2()
    }
    f1()
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace