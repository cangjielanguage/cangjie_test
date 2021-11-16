// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var b = Boo()
    b.m = 1
    if ( b.a != 2 ){
        return 1
    }
    b.a = 3
    if ( b.a != 3 ){
        return 1
    }
    return 0
}

record Boo{
    var a: Int32 = 1
    prop var m:Int32 {
        get(){
             return a
        }
        set(input){
             a = input + 1
        }
    }

    prop let n:Int32 {
        get(){
             return a
        }
    }
}

