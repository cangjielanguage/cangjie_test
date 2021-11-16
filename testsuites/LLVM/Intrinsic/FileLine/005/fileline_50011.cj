// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan fileline_50011.cj,18



func foo(x:()->String){
    return x()
}


func bar(x:()->Int64){
    return x()
}

func main(){
    var a = foo{sourceFile()}
    var b = bar{sourceLine()}
    print("${a},${b}")
    return 0
}