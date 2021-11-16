// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

let a:Int32 = 1
var foo01 = {x:()->Int32=>x() + a; a = 2} // EXPECTED: regex error.*?cannot assign to value which is an initialized 'let' constant

func case02(){
    let a: Int32 = 3
    return {x:()->Int32=>x() + a; a = 2} // EXPECTED: regex error.*?cannot assign to value which is an initialized 'let' constant
}