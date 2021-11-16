// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A {
    private var value: Int64=0
    prop var i: Int64{
        get(){
            value
        }
        set(v){
            value=v
        }
    }
}
func main(){
    var x= A()
    print("${x.i}") // ok
    x.i=1 // ok
}
