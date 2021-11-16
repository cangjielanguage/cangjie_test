// EXEC-PIPE-1:%compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

interface I {
    prop let a  // EXPECTED: regex abstract property must have type
}

class A <: I {
    prop let a:Int64 {
        get() {
            return 0
        }
    }
}

func main(): Int64 {
    return 0
}

