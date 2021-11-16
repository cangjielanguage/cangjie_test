// EXEC-PIPE-1:%compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

interface I {
    func add() :Unit // EXPECTED: regex note.*unimplemented abstract function
}
extend Int32 <: I {
}

func main() {
    return 0
}
