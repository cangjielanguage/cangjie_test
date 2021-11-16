// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

var a:Coo = Coo()
let b:Coo = Coo()
var c:Roo = Roo()
let d:Roo = Roo()
let n:Int32 = 1

var foo01 = {x:()->Int32=> a.b = x() + 2;a.b} // EXPECTED: regex error.*?cannot assign to value which is an initialized 'let' constant

var foo02 = {x:()->Int32=> n = 2 } EXPECTED: regex error.*?cannot assign to value which is an initialized 'let' constant

func case02(){
    return {x:()->Int32=>a.b = x() + 2;a.b} // EXPECTED: regex error.*?cannot assign to value which is an initialized 'let' constant
}

func case03(){
    return {x:()->Int32=>b.b = x() + 2;b.b} // EXPECTED: regex error.*?cannot assign to value which is an initialized 'let' constant
}

func case04(){
    return {x:()->Int32=>c.b = x() + 2;c.b} // EXPECTED: regex error.*?cannot assign to value which is an initialized 'let' constant
}

func case06(){
    return {x:()->Int32=>d.a = x() + 2;d.a} // EXPECTED: regex error.*?cannot assign to value which is an initialized 'let' constant
}

func case07(){
    return {x:()->Int32=>d.b = x() + 2;d.b} // EXPECTED: regex error.*?cannot assign to value which is an initialized 'let' constant
}

class Coo{
    var a: Int32 = 1
    let b: Int32 = 2
}

record Roo{
    var a: Int32 = 1
    let b: Int32 = 2
}