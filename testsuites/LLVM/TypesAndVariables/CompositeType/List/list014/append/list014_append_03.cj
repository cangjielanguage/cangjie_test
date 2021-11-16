// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT : scan extra argument given for call with parameter list: (Generics-T)
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


func main(){
    var a:List<Int64> = [1,2,3]
    a.append(1,2)
    return 0
}