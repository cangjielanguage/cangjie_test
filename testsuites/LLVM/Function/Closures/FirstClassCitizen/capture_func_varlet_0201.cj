// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if (case01()() != 1) {
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
    var a1 = {return a}
    return a1
}

func case02(){
    let a: Int32 = 1
    var a2 = {var x = a;return x}
    return a2
}

func case03(){
    let a: Int32 = 1
    var a3 = {return a}
    return a3
}

func case04(){
    let a: Int32 = 1
    var a4 = {a}
    return a4
}

func case05(){
    let a: Int32 = 1
    var a5 = {a;return 1}
    return a5
}