// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

record Data {
    var width: Int64
    let length: Int64
    init(w: Int64, l: Int64) {
        width = w
        length = l
        func f() {
            length = 4 // EXPECTED: regex error.*?'this' is not allowed to be captured in constructor of record
            return 0
        }
        f()
    }
}

func main(){
    return 0
}

