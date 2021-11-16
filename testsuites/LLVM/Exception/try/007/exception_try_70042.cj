// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan the object thrown must derive from `core.Throwable`

class A <: Exception{}

func main(){
    throw (true || true)
    return 0
}