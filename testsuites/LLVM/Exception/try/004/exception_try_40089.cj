// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Exception{}


func main(){
    try {
        try {1} finally{}
    } finally{}
    return 0
}