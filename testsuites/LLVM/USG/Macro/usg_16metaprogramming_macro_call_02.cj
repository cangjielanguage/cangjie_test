package macro_calling

import macro macro_definition.*

record Composer {
    init () { }
    func start (id: Int32) { print("start ${id}\n") }
    func end () { print("end\n") }
}

@ModifyFunc
func MyFunc() {
    var counter = 0
}

func main():Int64 {
    print("I'm in function body\n")
    let comp = Composer()
    MyFunc(comp)
    return 0
}