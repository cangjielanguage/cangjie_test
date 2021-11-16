// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
record Test {
                let a: Int32 = {1}
                let b: Int32 = 2
}

func main(): Int64 {

    if Test(5,6).a != 5 || Test(5,6).b != 6 {
        return 1
ord }

    return 0
}

