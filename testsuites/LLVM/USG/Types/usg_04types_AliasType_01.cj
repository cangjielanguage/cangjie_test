// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

type UserId = Int64

func main(): Int64 {
    type UserId = Int64 // EXPECTED:regex error.*? type must be declared on toplevel
    return 0
}
