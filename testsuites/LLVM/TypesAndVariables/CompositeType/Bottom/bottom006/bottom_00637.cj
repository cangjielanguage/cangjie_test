// EXE-1: %compiler %cmp_opt %f -o %output
// DEPRECATED ?:
func test() : Bool {(return true) ? (return false):(return false)}

func main(): Int64 {
    if (test()) { // true
        return 0
    }
    return 1
}
