// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

var str:List<String> = ["a","b","c"]
var r1:Buffer<String> = Buffer<String>(str)

func test(x:Buffer<String>,y:String):Buffer<String>
{
     x.add(y)
     return x
}

func main(): Int64 {
    test(r1,"d")
    test(r1,"e")
    test(r1,"f")
    if (r1.size()!=6)
    {
        return 1
    }
    if (r1[0]!="a")
    {
        return 2
    }
    if (r1[1]!="b")
    {
        return 3
    }
    if (r1[2]!="c")
    {
        return 4
    }
    if (r1[3]!="d")
    {
        return 5
    }
    if (r1[4]!="e")
    {
        return 6
    }
    if (r1[5]!="f")
    {
        return 7
    }
    return 0
}
