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
    func f1 (){ this } // EXPECTED: regex 'this' cannot be captured in the mutable function 'c'

    func f2 (){ this.a = 2 } // EXPECTED: regex 'this' cannot be captured in the mutable function 'c'

    func f3 (){ this.a } // EXPECTED: regex 'this' cannot be captured in the mutable function 'c'

    func f4 (){ a } // EXPECTED: regex 'a' cannot be captured in the mutable function 'c'

    func f5 (){ super() } // EXPECTED: regex 'super' can only be used in class

    func f6 ( a6: T ){  a6 }

    f6(a) // EXPECTED: regex-not error

    return this // EXPECTED: regex 'this' cannot be used as an expression in the mutable function 'c'
  }
}

