package pkg1

external  class Base { // EXPECTED: regex super class 'Base' is not inheritable, use 'open' modifier instead
    func get() : Int32 {// EXPECTED: regex overridden function 'get' should have 'open' modifier
        return  1
    }
}

