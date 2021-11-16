// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

var b: Int32 = 1
var c = if(true){
    var a: Int32 = 1

    func goo2(){
        var a = {var x = a;return x} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be assigned to a variable
        return a
    }
    func goo3(){
        var a = {return a} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be assigned to a variable
        return a
    }
    func goo4(){
        var a = { a ; return Int32(1)} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be assigned to a variable
        return a
    }
    func goo5(){
        var a = { a } // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be assigned to a variable
        return a
    }
    func goo7(){
        var a = { b } // EXPECTED: regex-not error
        return a
    }
}
