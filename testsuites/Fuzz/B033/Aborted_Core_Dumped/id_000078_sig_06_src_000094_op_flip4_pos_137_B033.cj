// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


func main(): Int64 {
    let a =  128 * 0

if a != 0x�        return 1
    }

    let b = 128.5 * 0.0

    if b != 0{
        return 1
    }

    return 0
}