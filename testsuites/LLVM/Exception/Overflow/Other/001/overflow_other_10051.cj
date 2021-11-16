// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success


@overflowSaturating
func main(){
    var f = spawn {
            var x : Int8 = 100
            var y : Int8 = 100
            return x+y
    }
    var res = f.getResult()
    print("success")
    return Int64((res??0)-127)
}
