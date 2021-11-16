external class AssertionError <: RuntimeException {
    private var message : String = ""
    init() {
        super();
        print("AssertionError" )
    }
    init(message: String) {
        super(message);
        this.message = message ;
        print("AssertionError: " + message)
    }
}

external enum Assert{
    AssertEquals | AssertNotEqual | AssertTrue | AssertFalse
}

// wait for list support ToString
// class CaseRunner<T> where T <: Equatable, T <: ToString{
external class CaseRunner<T> where T <: Equatable<T>{
    var passCnt: Int64
    var failCnt: Int64

    init(){
        this.passCnt = 0
        this.failCnt = 0
    }

    public static func fail(message: String) {
        // print(message);
        throw AssertionError(message)
        false
    }

    // public func runCases(casesAndExpected: List<T*T>, description!: String = "", checktype!: Assert = Assert.AssertEquals) {
    public func runCases(casesAndExpected: List<T*T>, description!: String = "", checktype!: String = "AssertEquals") {
        print("==============Test Case ${description} Start==============\n")
        match (checktype){
            case "AssertNotEqual" => for (i in 0..casesAndExpected.size()){
                match (assertNotEqual(casesAndExpected[i][0], casesAndExpected[i][1], "test failed at ${i} \n")) {
                    case Ok(num) => passCnt++
                    case Err(_) => failCnt++
                }
            }
            case "AssertEquals" => for (i in 0..casesAndExpected.size()){
                match (assertEquals(casesAndExpected[i][0], casesAndExpected[i][1], "test failed at ${i} \n")) {
                    case Ok(num) => passCnt++
                    case Err(_) => failCnt++
                }
            }
            case _ => for (i in 0..casesAndExpected.size()){
                match (assertEquals(casesAndExpected[i][0], casesAndExpected[i][1], "test failed at ${i} \n")) {
                    case Ok(num) => passCnt++
                    case Err(_) => failCnt++
                }

            }
        }
        
        print("-------------Test Result------------------------------\nPASS: ${passCnt}\nFAIL: ${failCnt}\nTOTAL: ${failCnt+passCnt}\n==============Test End=================================\n\n")
    }

    public func runCases(casesAndExpected: List<Float32*Float32*Float32>, description!: String = "") {
        print("==============Test Case ${description} Start==============\n")
        for (i in 0..casesAndExpected.size()){
            match (assertInaccuracy(casesAndExpected[i][0], casesAndExpected[i][1], casesAndExpected[i][2], "test failed at ${i} \n")) {
                case Ok(num) => passCnt++
                case Err(_) => failCnt++
            }
        }
        
        print("-------------Test Result------------------------------\nPASS: ${passCnt}\nFAIL: ${failCnt}\nTOTAL: ${failCnt+passCnt}\n==============Test End=================================\n\n")
    }

    public func runCases(casesAndExpected: List<Float16*Float16*Float16>, description!: String = "") {
        print("==============Test Case ${description} Start==============\n")
        for (i in 0..casesAndExpected.size()){
            match (assertInaccuracy(casesAndExpected[i][0], casesAndExpected[i][1], casesAndExpected[i][2], "test failed at ${i} \n")) {
                case Ok(num) => passCnt++
                case Err(_) => failCnt++
            }
        }
        
        print("-------------Test Result------------------------------\nPASS: ${passCnt}\nFAIL: ${failCnt}\nTOTAL: ${failCnt+passCnt}\n==============Test End=================================\n\n")
    }

    public func runCases(casesAndExpected: List<Float64*Float64*Float64>, description!: String = "") {
        print("==============Test Case ${description} Start==============\n")
        for (i in 0..casesAndExpected.size()){
            match (assertInaccuracy(casesAndExpected[i][0], casesAndExpected[i][1], casesAndExpected[i][2], "test failed at ${i} \n")) {
                case Ok(num) => passCnt++
                case Err(_) => failCnt++
            }
        }
        
        print("-------------Test Result------------------------------\nPASS: ${passCnt}\nFAIL: ${failCnt}\nTOTAL: ${failCnt+passCnt}\n==============Test End=================================\n\n")
    }

    public func runCasesTrue(casesAndExpected: List<Bool>, description!: String = "", checktype!: String = "AssertTrue") {
        print("==============Test Case ${description} Start==============\n")

        match (checktype){
            case "AssertTrue" => for (i in 0..casesAndExpected.size()){
                match (assertTrue(casesAndExpected[i], "test failed at ${i} \n")) {
                    case Ok(num) => passCnt++
                    case Err(_) => failCnt++
                }
            }
            case "AssertFalse" => for (i in 0..casesAndExpected.size()){
                match (assertFalse(casesAndExpected[i], "test failed at ${i} \n")) {
                    case Ok(num) => passCnt++
                    case Err(_) => failCnt++
                }
            }
            case _ => for (i in 0..casesAndExpected.size()){
                match (assertTrue(casesAndExpected[i], "test failed at ${i} \n")) {
                    case Ok(num) => passCnt++
                    case Err(_) => failCnt++
                }

            }
        }
        
        print("-------------Test Result------------------------------\nPASS: ${passCnt}\nFAIL: ${failCnt}\nTOTAL: ${failCnt+passCnt}\n==============Test End=================================\n\n")
    }

    public static func assertEquals(actual: T, expected: T, message: String) {
        if(actual == expected){
            Result<Bool>.Ok(true)
        } else {
            Result<Bool>.Err(AssertionError(message))
        }
    }

    public static func assertInaccuracy(actual: Float16, expected: Float16, inaccuracy: Float16, message: String) {
        if(actual >= (expected - inaccuracy) && actual <= (expected + inaccuracy) ){
            Result<Bool>.Ok(true)
        } else {
            Result<Bool>.Err(AssertionError(message))
        }
    }

    public static func assertInaccuracy(actual: Float32, expected: Float32, inaccuracy: Float32, message: String) {
        if(actual >= (expected - inaccuracy) && actual <= (expected + inaccuracy) ){
            Result<Bool>.Ok(true)
        } else {
            Result<Bool>.Err(AssertionError(message))
        }
    }

    public static func assertInaccuracy(actual: Float64, expected: Float64, inaccuracy: Float64, message: String) {
        if(actual >= (expected - inaccuracy) && actual <= (expected + inaccuracy) ){
            Result<Bool>.Ok(true)
        } else {
            Result<Bool>.Err(AssertionError(message))
        }
    }

    public static func assertNotEqual(actual: T, expected: T, message: String) {
        if(actual != expected){
            Result<Bool>.Ok(true)
        } else {
            Result<Bool>.Err(AssertionError(message))
        }
    }

    public static func assertTrue(actual: Bool, message: String) {
        if(actual){
            Result<Bool>.Ok(true)
        } else {
            Result<Bool>.Err(AssertionError(message))
        }
    }

    public static func assertFalse(actual: Bool, message: String) {
        if(!actual){
            Result<Bool>.Ok(true)
        } else {
            Result<Bool>.Err(AssertionError(message))
        }
    }

}
external func foo(x:Option<Int64>):Int64{
    let num:Int64 = match (x){
        case Some(x) => x
        case _ => -1
    }
    return num
}

//Define general inf
external let inf16=1.0/f16(1.0)
external let inf32=1.0/f32(1.0)
external let inf64=1.0/f64(1.0)
//Define general nan
external let nan16=0.0/f16(1.0)
external let nan32=0.0/f32(1.0)
external let nan64=0.0/f64(1.0)

func f16(i: Float16):Float16{
    return 0.0
}
func f32(i: Float32):Float32{
    return 0.0
}
func f64(i: Float64):Float64{
    return 0.0
}