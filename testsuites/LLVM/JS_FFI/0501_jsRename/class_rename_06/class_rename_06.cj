// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsRename["Int64"]
foreign class B {
    func equals(numA:C):Bool
}

@JsRename["Int64"]
foreign class C {
	  func equals(numA:C):Bool
}

@JsMember["./momentMember"]
foreign func getB(): B

@JsMember["./momentMember"]
foreign func getC(): C

func main() {
	  if(getB().equals(getC()) && getC().equals(getC())) {
        return 0;
    }
    return 1;
}