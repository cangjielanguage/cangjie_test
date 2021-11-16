// EXEC-PIPE-1:%compiler %cmp_opt %f -o %output 2>&1 | compare %f


record A {}    // EXPECTED: regex 'A' is previously declared here
interface A {Day}    // EXPECTED: regex 'A' is previously declared here
class A {}

func main():Int64 {
    return 0
}