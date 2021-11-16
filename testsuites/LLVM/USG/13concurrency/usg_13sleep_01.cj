// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan Hello\nWorld\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
    print("Hello\n")
    sleep(1000*1000*1000) // sleep for 1s.
    print("World\n")
    return 0
}
