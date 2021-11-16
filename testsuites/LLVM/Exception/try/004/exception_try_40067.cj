// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Exception{}

func main(){
    spawn{try {throw A()} finally{}}
    return 0
}