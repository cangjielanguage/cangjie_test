// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

class Coo {
    prop var a: Int64 {
        get() {
            return b
        }
        set(v){}
    }
    prop var b: Int64 {
        get() {
            return a
        }
        set(v){}
    }
}
func main():Int64 {
    Coo() // if visit Coo().b will runtime segmentation fault
    return 0
}
