// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func main() {
	  if(A.getB().equals(A.getB())) {
        return 0;
    }
    return 1;
}

foreign class A{
    @JsMember["./momentMember"]
    static func getB(): B
}

foreign {
	@JsRename["Int64"]
	class B {
      func equals(numA:B):Bool
  }
}