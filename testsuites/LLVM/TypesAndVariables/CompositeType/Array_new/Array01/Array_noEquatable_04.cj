// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A <: Equatable<A>{
    A(var ra!: Int64 = 0, let rb!: Int64 = 0){}

        operator func ==(that: A) : Bool {
        if(this.ra == that.ra && this.rb == that.rb){
          return true
        } else{
          return false
        }
    }

    operator func !=(that: A) : Bool {
        if(this.ra != that.ra || this.rb != that.rb){
          return true
        } else{
          return false
        }
    }
}

func main() {
    var arr1 : Array<A> = Array<A>([A(ra: 0, rb: 1)])
    var arr2 : Array<A> = Array<A>([A(ra: 0, rb: 0)])

    if(arr1!=arr2){
        return 0
    }
    return 1
}