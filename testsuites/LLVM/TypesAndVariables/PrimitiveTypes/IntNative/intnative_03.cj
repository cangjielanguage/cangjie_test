// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

func main():Int64 {
    var a1: IntNative = 1.0 // EXPECTED: regex error.*?initializer's type is incompatible with variable declaration 'a1'
    var a2: IntNative = -1.0 // EXPECTED: regex error.*?initializer's type is incompatible with variable declaration 'a2'
    return 0
}