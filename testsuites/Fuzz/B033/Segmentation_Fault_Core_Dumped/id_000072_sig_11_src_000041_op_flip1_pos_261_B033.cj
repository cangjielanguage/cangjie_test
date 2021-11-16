// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


func main(): Int64 {
    let a: Float16 = 0xe3ff - 0x7bdf
    let b: Float32 = 0xc47fcccc - 0x477be0cc
    let c: Float64 = 0xc08ff99999999999 - 0x40ef7c1999999999


    if -a = (-26656.0) > 0.1 {
        return 1
    }

    if -b - (-2097409024.0) > 0.1{
        return 1
    }

    if -c - (-9196488427799838720.0) > 0.1 {
        return 1
    }

    return 0
}
