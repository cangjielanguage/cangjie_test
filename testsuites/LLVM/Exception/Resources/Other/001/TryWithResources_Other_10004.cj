// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan xxx

class A <: Resource {
    func isClosed(){print("A!");true}
    func close(){}
}

func main() {
    var a : Int64 = try (a : A = A())
    {
        0
    } catch (_){true}
    finally {true}
    print("success!\n")
    return a
}
