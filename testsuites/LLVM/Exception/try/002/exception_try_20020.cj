// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    return try
    {Int64(0)}
    catch (_) {Int64(1)}
    finally{}
}