// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f
// ASSERT: regex reference to overloaded function 'T' could not be resolved

func main(): Int64 {
    if ( A<String>().b != 0 ){
        return 1
    }
    return 0
}

class A<T>  {
    prop let a:Int64{
        get(){
            return 1
        }
    }
    var b = match (T) {
        case x:Data => 0
        case _ => 5
    }
}

class T{}

enum Data{
    T | V
}
