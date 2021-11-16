// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a : Int64 = try
    {0}
    catch (_) {1}
    finally{}
    return a
}