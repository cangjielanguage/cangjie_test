// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: scan success

class A <: Throwable{}

var a = try{
    throw A();1
} catch (a:A){
    print("success");2
}

func main() {
    return a-2
}
