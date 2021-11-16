// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsRename["Int64"]
foreign class B {

}

@JsMember["./momentMember"]
foreign func isMoment(a: B, b: B): Bool

@JsMember["./momentMember"]
foreign func getB(): B

func main() {
	  if(isMoment(getB(), getB())) {
        return 0;
    }
    return 1;
}