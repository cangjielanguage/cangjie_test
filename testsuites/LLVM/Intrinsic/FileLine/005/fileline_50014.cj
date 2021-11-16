// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan fileline_50014.cj20


interface A<T>{
    operator func ()():T
}

extend String <:A<String>{
    operator func ()():String{this}
}

extend Int64 <:A<Int64>{
    operator func ()():Int64{this}
}

func main(){
    print("${sourceFile()()}")
    print("${sourceLine()()}")
    return 0
}