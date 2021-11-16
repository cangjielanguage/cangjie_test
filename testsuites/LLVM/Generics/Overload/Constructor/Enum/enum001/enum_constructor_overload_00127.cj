// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped

interface C{}
interface D{}

class Child <: C & D{}


enum B{a(C)}

enum A{a(D)}

func main():Int64{
    var j = a(Child()) // EXPECTED: regex find multiple constructor 'a' of enum declaration
    return 1
}
