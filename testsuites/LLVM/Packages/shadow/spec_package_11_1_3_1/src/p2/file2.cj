package p2

func Bar() {
    var obj2 = C() // OK, the imported class C is visible to all files of current package.
    1.add(2) // OK, the imported extend declaration is visible to all files of current package.
    2.minus(1) // OK, the extend declaration is visible to all files of current package.
}

external var b2 = Bar()