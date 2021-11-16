// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success127



func main(){
    var f = spawn @overflowSaturating{
            var x : Int8 = 100
            var y : Int8 = 100
            return x+y
    }
    var res = f.getResult()
    print("success")
    match (res){
        case Ok(v) => print("${v}\n")
        case Err(_) => print("failed\n")
    }
    return 0
}
