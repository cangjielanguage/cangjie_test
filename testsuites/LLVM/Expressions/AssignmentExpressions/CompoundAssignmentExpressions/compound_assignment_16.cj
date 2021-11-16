// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

var a: Int32 = 2
a **= 3 // EXPECTED: regex illegal object in toplevel, toplevel must consist of declaration or definition

func main(): Int64 {
    if (a==8){
        return 0
    }
    return 1
}