// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if (case02()()[2][0] != 1) {
        return 1
    }

    return 0
}

func case01(){
    let a = (1,2,(1,2,3))
    return a
}
func case02(){
    return case01
}
func case03(a:Int32,b:Int32):(Int32,Int32)->Int32{
    return {a, b =>  a + b }
}
