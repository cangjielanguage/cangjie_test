// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-not core dumped
interface I{
	
}

func main() {
  var b = R<Int64>(6)
  b.c(7)
  return b.a - 7
}

record R<T> <: I{
  R(var a: T){

  }

  mut public func c(b : T) {
	  this() //EXPECTED: regex invalid calling 'this' outside the constructor

	  let f1 = { => 
      let f2 = { => 
        a //EXPECTED: regex 'a' cannot be captured in the mutable function 'c'

      }
	  }
	  return
	}
}

