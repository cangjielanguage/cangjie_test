// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

let a = b()
func main(){}
class b {
    init() {
        i.ac[8] // EXPECTED: regex used before initialization
    }
}
record i {
    static let ac : List<Bool> = []
}
