// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func add(p1: Int64, p2: Int64): Int64 {
    p1 + p2
}
let f: (Int64, Int64)->Int64 = add

func identity<T>(a: T) { // identity is a generic function
    a
}

var c = identity<Int32> // ok: Int32 is given as a type argument

func main(){
    if(f(2,3)==5 && c(5)==5){
        return 0
    }else{
        return 1
    }
}
