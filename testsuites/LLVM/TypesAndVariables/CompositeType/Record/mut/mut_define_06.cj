// EXEC-PIPE-1: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-not core dumped

enum A{
  aaa | mut | ccc //EXPECTED: regex 'mut' is keyword not identifier, you can use '`mut`' instead

  private mut  static func a(){ //EXPECTED: regex 'mut' modifier is illegal for function declaration in enum body
  }	
}
