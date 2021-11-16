// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case01() != 0 ) {
        return 1
    }
    if ( case02() != 0 ) {
        return 1
    }
    var a = foo1()
    if ( a == ()) {
        print("Unit")
    }else if ( a == () ){
        print("Int64")
    }else {
        print("other")

    }
    return 0
}

func case01(){
    var r1 = match ((())) {
        case a:Int64 => 2
        case a:Unit => 0
        case _ => 1
    }
    r1
}

func case02(){
    var a = 1
    var r1 = match ((a++))  {
        case a:Int64 => 2
        case a:Unit => 0
        case _ => 1
    }
    r1
}

func foo1(){
    if(true){
        return
    }
}
