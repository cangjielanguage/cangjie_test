// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A {
    prop let i: Int64 {
        get() {
            return 0
        }
    }
}

record B {
    prop let i: Int64 {
        get() {
            return 0
        }
    }
}

enum C {
    Date
    prop let i: Int64 {
        get() {
            return 0
        }
    }
}

extend A {
    prop let s: String {
        get() {
            return ""
        }
    }
}

func main() {
    return 0
}
