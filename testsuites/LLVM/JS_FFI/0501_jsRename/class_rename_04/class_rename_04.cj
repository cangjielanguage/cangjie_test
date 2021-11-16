// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsRename["Int64"]
foreign class B {
    func equals(numA:B):Bool
}

@JsMember["./momentMember"]
foreign func isMoment(): B

func main() {
	  if(isMoment().equals(isMoment())) {
        return 0;
    }
    return 1;
}