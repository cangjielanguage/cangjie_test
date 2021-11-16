// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsRename["Math.sign"]
foreign func CangjieJoin(num:Int32): Bool

func main() {
    if(CangjieJoin(3)) {
        return 0
    }
    return 1
}