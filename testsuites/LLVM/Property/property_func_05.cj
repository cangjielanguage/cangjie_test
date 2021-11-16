// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

class Coo {
    public prop var a: Int64 {
        get() {
            return 0
        }
        set(v){}
    }
    a = 1 // EXPECTED: regex error.*?illegal class member in class block
}
func main():Int64 {
    return 0
}
