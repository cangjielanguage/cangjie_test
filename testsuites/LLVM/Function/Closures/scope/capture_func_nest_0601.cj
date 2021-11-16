// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

func goo(m:Int32){
    var a: Int32 = 1
    let b: Int32 = 2
    func ifoo5(){var x = b;return x}
    var res = match (m) {
        case 2 => {var x = a;return x} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a expression
        case 3 => {return a} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a expression
        case _ => {return Int32(1)}
    }
    return res
}
