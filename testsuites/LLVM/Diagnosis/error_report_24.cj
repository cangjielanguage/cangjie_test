// EXEC-PIPE-1:%compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface I {
    func foo():Unit // EXPECTED: regex note.*unimplemented abstract function
}

class A <: I {}

func main():Int64 {
    return 0
}
