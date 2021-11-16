// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( case01() != 0 ){
        return 1
    }
    if ( case02() != 0 ){
        return 1
    }
    return 0
}

func case01(){
    var a = (1,2,3)
    if ( "${a[1]}" != "2") {
        return 1
    }
    return 0
}

func case02(){
    var l : Int64 = 10
    func x(input:Int64):String{"Iam${input}"}
    var a : ArrayList<String> = ArrayList<String>(l,x)

    if ( "${a[1]}" != "Iam1") {
        return 1
    }
    return 0
}

