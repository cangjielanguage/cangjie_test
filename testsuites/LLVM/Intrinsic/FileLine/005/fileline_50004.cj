// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 9

var a =  [0,1,2,3,4,5,6,7,8,9,10]

func main(){
    var A : ?List<Int64> = a
    var B = A?[sourceLine()]
    print("${B??1}")
    return 0
}