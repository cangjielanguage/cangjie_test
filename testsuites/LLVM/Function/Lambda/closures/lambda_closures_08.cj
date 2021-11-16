// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

var a1 = {
    var a: Int32 = 1
    let b: Int32 = 2
    var x1 = {a} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be assigned to a variable
    var x2 = {b} // EXPECTED: regex-not error
}

var a2 = {
    var a: Int32 = 1
    let b: Int32 = 2
    var x1 = foo({a}) // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a param
    var x2 = foo({b}) // EXPECTED: regex-not error
}

var a3 = {
    var a: Int32 = 1
    let b: Int32 = 2
    if ( a == 2 ){
        return {a} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a return value
    }else {
        return foo({a}) // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a param
    }
    if ( a == 2 ){
        return {b} // EXPECTED: regex-not error
    }else {
        return foo({b}) // EXPECTED: regex-not error
    }
}

var a4 = {
    var a: Int32 = 1
    if ( a == 2 ){
        return {a} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a return value
    }else {
        return foo({a}) // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a param
    }
}

func foo(x:()->Int32){return x}
func goo(x:Int32){return x}
