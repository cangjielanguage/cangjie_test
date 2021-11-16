// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// TODO: 
class A {
  A(var a!:Int64 = 0){

  }
}

extend A <: AddInt64<A> & Comparable<A> & Equatable<A>{
	  func addInt64(right: Int64): A {
        A(a:(this.a + right))
    }

    operator func > (that : A) : Bool{
    	  this.a > that.a
    }
    operator func < (that : A) : Bool{
    	  this.a < that.a
    }
    operator func >= (that : A) : Bool{
    	  this.a >= that.a
    }
    operator func <= (that : A) : Bool{
    	  this.a <= that.a
    }
    operator func == (that : A) : Bool{
    	this.a == that.a
    }
    operator func != (that : A) : Bool{
      this.a != that.a
    }
}

func main(): Int64 {
    let a: Range<A> 
    return 0;
}
