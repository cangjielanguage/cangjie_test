// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan fileline_50003.cj13

var a =  {x:String=>x}
var b =  {x:Int64=>x}

func main(){
    var A : ?((String)->String) = a
    var B = A?(sourceFile())
    print(B??"")
    var C : ?((Int64)->Int64) = b
    var D = C?(sourceLine())
    print("${D??1}")
    return 0
}