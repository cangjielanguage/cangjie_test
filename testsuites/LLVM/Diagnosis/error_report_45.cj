// EXEC-PIPE-1:%compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

open class A<T> {
    init<T>(){}     // EXPECTED: regex generic constructor 'init' is not supported
}

func main(): Int64 {
    return 0
}


