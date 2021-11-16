// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func main() {
    if(B.sqrt(4) != 2) {
        return 1;
    }
    return 0;
}

@JsRename["Math"]
foreign class B {
    static func sqrt(numA:Int64):Int64
}