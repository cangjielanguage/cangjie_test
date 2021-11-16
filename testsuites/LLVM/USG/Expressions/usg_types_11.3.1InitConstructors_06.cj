// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

record Data {
    var width: Int64
    let length: Int64
    init(w: Int64, l: Int64) {
        width = w
        length = l
        let locVar:Int64 = 2
        locVar = 3 // EXPECTED: regex error.*?cannot assign to value which is an initialized 'let' constant
    }
}

func main(){
    return 0
}

