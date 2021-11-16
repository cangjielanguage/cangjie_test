// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Exception{}

var a = try{throw A()}
catch (_) {}
finally{}

func main(){
    a
    return 0
}