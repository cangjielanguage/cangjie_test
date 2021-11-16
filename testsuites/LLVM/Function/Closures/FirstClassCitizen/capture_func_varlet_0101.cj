// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

//brief:变量赋值为lambda(捕获var变量)，编译报错

func main():Int64 {
    return 0
}

func case01(){
    var a: Int32 = 1
    var a2 = {var x = a;return x} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be assigned to a variable
    var a3 = {return a} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be assigned to a variable
    var a4 = {a} // EEXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be assigned to a variable
    var a5 = {a;return 1} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be assigned to a variable
    return 0
}
