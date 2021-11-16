// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

internal var a1=1
internal var a2=a1

func main(): Int64 {
    
    if(a2==1){
        return 0
    }else{
        return 1
    }
}
