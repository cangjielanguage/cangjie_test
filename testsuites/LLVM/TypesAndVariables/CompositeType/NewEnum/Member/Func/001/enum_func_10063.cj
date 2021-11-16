// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface C{
    func f():Int64
}
// should failed, not supported
enum A<T> <: C{ // EXPECTED: regex 'A' does not implement abstract function 'f'
    a(T)
}

func main(): Int64 {
    return 0
}
