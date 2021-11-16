// EXEC-PIPE-1: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-not core dumped

enum A{
  aaa | bbb(Int32)
  mut func a(){} //EXPECTED: regex 'mut' modifier is illegal for function declaration in enum body

  mut prop let b: Int32 { //EXPECTED: regex 'mut' modifier is illegal for property declaration in enum body
    mut get(){ //EXPECTED: regex modifier is not allowed here
      return Int32(1)
    }
  }
}
