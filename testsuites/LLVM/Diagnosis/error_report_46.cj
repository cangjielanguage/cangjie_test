// EXEC-PIPE-1:%compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

class C {
    @differentiable[include:[this]]
    static func a(x:Int64) {} // EXPECTED: regex 'this' is not found in parameter list
}

class D {
    @differentiable[except:[this]]
    static func a(x:Int64) {} // EXPECTED: regex 'this' is not found in parameter list
}


func main(): Int64 {
    return 0
}


