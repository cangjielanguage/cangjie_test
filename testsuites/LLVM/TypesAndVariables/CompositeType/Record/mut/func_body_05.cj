// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-not core dumped

func main() {
  var b = R(a: 6)
  b.c(7)
  return Int64(b.a - 7)
}

record R{
  var a : Int32 = 8

  public func c(b : Int32) : Int32{
	  mut func cc(){ //EXPECTED: regex 'mut' modifier is illegal for function declaration in function body
      a = b
    }
	  return 0
	}
}

