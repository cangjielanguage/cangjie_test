// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan case pass

from std import net.*
var mime1 = MimeHeader ()
func main(): Int64 {
    try
    {
        var buffer1 =  mime1.getAll("&ab-Abc")
        ()
    }
    catch(e:NoneValueException)
    {
        print("case pass")
    }
    return 0
}