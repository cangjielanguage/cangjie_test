// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan main:fileline_10019.cj 9




func main(){
    var x : (String*Int64) = (sourceFile(),sourceLine())
    print("main:${x[0]} ${x[1]}\n")
    return 0
}