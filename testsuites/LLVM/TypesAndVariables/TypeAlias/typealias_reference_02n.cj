// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

type Type1 = Type3 // EXPECTED: regex type cycle detected: 'Type1-\>Type3-\>Type2-\>Type1'
type Type2 = Type1
type Type3 = Type2

func main(): Int64 {
    print("do nothing")
    return 0
}