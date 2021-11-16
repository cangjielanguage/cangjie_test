// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Exception{}

var (a,b) = (try{throw A()}
catch (_) {}
finally{},try{throw A()}
catch (_) {}
finally{})

func main(){
    a
    b
    return 0
}