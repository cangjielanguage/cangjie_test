// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

internal record  Aoo{
    var b:Int64*Float64 = (18,19.0)
}

external var a = Aoo().b

func main(): Int64 {
    if(Float64(a[0])-a[1]==-1.0){
        return 0
    }else{
        return 1
    }
}
