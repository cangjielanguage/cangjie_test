// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class A <: Equatable<A>{
    var a:Int64
    var b:Bool
    init(a:Int64,b:Bool){
        this.a=a
        this.b=b
    }
        operator func ==(that: A) : Bool {
        if(this.a == that.a && this.b == that.b){
          return true
        } else{
          return false
        }
    }

    operator func !=(that: A) : Bool {
      return !(this == that)
    }
}

func main() {
    var arr1 : Array<A> = Array<A>([A( 1, true)])
    var arr2 : Array<A> = Array<A>([A(0, true)])

    if(arr1!=arr2){
        return 0
    }
    return 1
}