// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

//catelog:# 泛型--1
func main(): Int64 {
    var a<T> = [1,2] //EXPECTED: regex error.*variable declaration 'a' need at least one of type and initializer
    return 0
}
