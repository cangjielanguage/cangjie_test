// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class GenRec<T,V>{
    var a: T
    let b: T
    init(x: T, y:V){
        this.a = x
        this.b = this.a
        this.c = y
    }
    var c: V

}

func main():Int64{
    var data= GenRec<Int64,Int32>(3, 4)
    if (data.a == 3 && data.b == 3 && data.c == 4) {
        return 0
    }
    return 1
}