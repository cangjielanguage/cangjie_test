// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var a = None<Bool>
    var b = false
    var c = false
    var d = true
    var res = Some(a ?? b||c) ?? d
    if (res){
        return 1
    }
    return 0
}
