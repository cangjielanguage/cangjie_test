// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if (foo1() != 2) {return 1}
    return 0
}

func foo(){
    let a = 2
    var b = 1
    if (false){
        1
    }else{
        var res: Int64 = match {
            case _ => 2
        }
        b = res
        return b
    }
}

// 不包含match表达式是OK的
func foo1(){
    let a = 2
    var b = 1
    if (false){
        1
    }else{
        b = 2
        return b
    }
}

func foo2(){
    let a = 2
    var b = 1
    if (false){
        1
    }else{
        var res: Int64 = match {
            case _ => 2
        }
        b = res
        return b
    }
    b // if-else后加返回b，是OK的
}

func foo3(){
    let a = 2
    var b = 1
    if (false){
        1
    }else{
        var res: Int64 = match (a) { // 有selector的match是OK的
            case _ => 2
        }
        b = res
        return b
    }
}
