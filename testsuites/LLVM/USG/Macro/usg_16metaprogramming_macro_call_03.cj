package macro_calling

import macro macro_definition.*

var a : Int64 = @Foo[1+](2+3)

// @Foo[[miss one](2+3)
// @Foo[[matched]](2+3)
// @Foo[](2+3)
// @Foo[\[](2+3)

@Foo[external]
record Data {
    var count: Int64 = 100
}

func main():Int64 {
    print("I'm in function body\n")
    if (a == 6) {
        return 0
    }
    return 1
}
