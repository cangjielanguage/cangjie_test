// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    var a = Coo(1)
    return 0
}

class Coo{
    init(
        a:Int64, 
    ){ // EXPECTED: regex expected identifier here

    }
}
