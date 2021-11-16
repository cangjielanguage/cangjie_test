// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class A{}

func g<T>(a:T){

    do{
        break
        continue
    } while (false)

    while (false) {
        break
        continue
    }

    return 0
}

func main(){
    return g<A>(A())
}