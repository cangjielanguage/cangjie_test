// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan '123' doesn't exist

from std import io.*

func main(): Int64 {
    FileStream(FileInfo("123"))
    return 0
}
