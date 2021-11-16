// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


class Data {
    var a: Int64 = 1
    var b: Unit
    init(x: Int64, y!:Unit=(x+=1)){ // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
        a += x
        b = y
    }
    func foo() {
        this.a **= 2
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
    if (Data.bar(3) == 8 && data.a == 16 && data.b == ()){
        return 0
    }
    return 1
}