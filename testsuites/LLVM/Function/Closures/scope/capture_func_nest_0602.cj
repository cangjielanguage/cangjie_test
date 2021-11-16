// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

func goo(m:Int32){
    var a: Int32 = 1
    let b: Int32 = 2
    func ifoo2(){var x = a;return x}
    func ifoo3(){return a}
    func ifoo5(){var x = b;return x}
    var res1 = ifoo2 // EXPECTED: regex error.*?ifoo2 captured a mutable variable directly, ifoo2 cannot be assigned to a variable
    var res2 = ifoo3 // EXPECTED: regex error.*?ifoo3 captured a mutable variable directly, ifoo3 cannot be assigned to a variable
    return 0
}

func hoo(m:Int32){
    var a: Int32 = 1
    let b: Int32 = 2
    func ifoo1(x!:Int32=a){return x}
    func ifoo4(x!:Int32=b){return x}
    var res1 = ifoo1 // EXPECTED: regex error.*?ifoo1 captured a mutable variable directly, ifoo1 cannot be assigned to a variable
    return 0
}