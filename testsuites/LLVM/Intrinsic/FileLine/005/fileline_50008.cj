// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan fileline_50008.cj,14



func foo(){
    var a : Result<String> = Result<String>.Ok(sourceFile())
    return a
}


func bar(){
    var a : Result<Int64> = Result<Int64>.Ok(sourceLine())
    return a
}

func main(){
    print("${foo().getOrThrow()},${bar().getOrThrow()}")
    return 0
}