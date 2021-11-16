// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if (case01()(1) != 1) {
        return 1
    }
    if (case02()() != 1) {
        return 2
    }
    if (case03()() != 1) {
        return 3
    }
    if (case04()() != 1) {
        return 4
    }
    if (case05()() != 1) {
        return 5
    }
    return 0
}

func case01(){
    let a: Int32 = 1
    func foo1(x!:Int32=a){return x}
    var a1 = foo1
    return a1
}

func case02(){
    let a: Int32 = 1
    func foo2(){var x = a;return x}
    var a2 = foo2
    return a2
}

func case03(){
    let a: Int32 = 1
    func foo3(){return a}
    var a3 = foo3
    return a3
}

func case04(){
    let a: Int32 = 1
    func foo4(){a}
    var a4 = foo4
    return a4
}

func case05(){
    let a: Int32 = 1
    func foo5(){a;return 1}
    var a5 = foo5
    return a5
}