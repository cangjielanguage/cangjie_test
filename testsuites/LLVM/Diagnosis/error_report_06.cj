// EXEC-PIPE-1:%compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A {

func main():Int64 {
    A()
    return 0
}   // EXPECTED: regex expected '}'