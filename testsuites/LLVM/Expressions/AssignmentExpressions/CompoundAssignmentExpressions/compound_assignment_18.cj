// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


record Data {
    let a: Int64 = 1
    let b: Unit
    init(x: Int64, y!:Unit=(x+=1)){ // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
        a += x
        b = y
    }
    func foo() {
        var a = 2
        a += 2
        a
    }
    static func bar(x: Int64, y!:Unit=(x+=1)){ // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
        var a = 2
        a **= 3
        a
    }
}

func main(): Int64 {
    var data = Data(3)
    data.foo()
    if (Data.bar(1) == 8 && data.foo() == 4 && data.a == 4 && data.b == ()){
        return 0
    }
    return 1
}