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
    var res = match (m) {
        case 2 => ifoo2 // EXPECTED: regex-auto ifoo2 captured a mutable variable directly, ifoo2 cannot be used as a expression 
        case 3 => ifoo3 // EXPECTED: regex-auto ifoo3 captured a mutable variable directly, ifoo3 cannot be used as a expression
        case _ => return ifoo5
    }
    return res
}

func hoo(m:Int32){
    var a: Int32 = 1
    let b: Int32 = 2
    func ifoo1(x!:Int32=a){return x}
    func ifoo4(x!:Int32=b){return x}
    var res = match (m) {
        case 1 => ifoo1 // EXPECTED: regex-auto ifoo1 captured a mutable variable directly, ifoo1 cannot be used as a expression
        case _ => return ifoo4 // EXPECTED: regex-not error
    }
    return res
}
