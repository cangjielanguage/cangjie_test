// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan fileline_50009.cj15



func foo():Result<String>{
    var a : Result<String> = Result<String>.Ok(sourceFile())
    print("${a!}")
    return a
}


func bar():Result<Int64>{
    var a : Result<Int64> = Result<Int64>.Ok(sourceLine())
    print("${a!}")
    return a
}

func main(){
    foo()
    bar()
    return 0
}