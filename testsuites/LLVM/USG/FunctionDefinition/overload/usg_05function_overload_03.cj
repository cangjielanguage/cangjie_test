// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class C {
    var a: Int64
    var b: Float64

    init(a: Int64, b: Float64) {
        this.a = a
        this.b = b
    }

    init(a: Int64) {
        b = 0.0
        this.a = a
    }
}


func main():Int64{
    if(C(1,1.0).a==1 && C(1,1.0).b==1.0 && C(2).a==2 && C(5).b==0.0){
        return 0
    }else{
        return 1
    }
}