// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E{
    e(Int64) | e(Int64,Int64) | e(Int64,Int64,Int64)
}


func main(): Int64 {
    var a : E = e(1)
    match (a){
        case e(v1) | e(v1,_) | e(v1,_,_) => v1 - 1
    }
}
