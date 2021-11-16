// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

var a = {
    var a: Int32
    let b:Int32
    func foo1(x!:Int32=a+b){return x} // EXPECTED: regex error.*?variable 'a' is used before initialization
    func foo2(){var x = a+b;return x}  // EXPECTED: regex error.*?variable 'a' is used before initialization
}
