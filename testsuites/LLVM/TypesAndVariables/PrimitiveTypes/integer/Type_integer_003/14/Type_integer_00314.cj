// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected function name after 'func'

func main(): Int64
{
    var int16_One: Int16 = func
}
