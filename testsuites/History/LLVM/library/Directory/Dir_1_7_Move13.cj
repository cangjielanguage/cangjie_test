// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from os import os.*
from io import io.*


// create A TEST DIR TO TEST FOR PLATFORM ADAPTION
var pwd_path: String = Directory.getWorkingDirectory().getCanonicalPath()
var test_path0 = pwd_path + "/test0"
var nameCnt: Int64 = 0;
var testPathBaseLength = pwd_path.size() + 5
let nameCntLimit = 15;
let maxPathLength = 512

func tryNewName() {
    if ("${nameCnt}".size() < nameCntLimit) {
        test_path0 = test_path0.substring(0, testPathBaseLength) + "_${nameCnt}"
        nameCnt = nameCnt + 1
        return
    }
    nameCnt = 0
    testPathBaseLength = testPathBaseLength + nameCntLimit
    return
}

func createAndGetTestDirInPwd(): String {
    // TO AVOID THERE existS SAME-NAME FILE IN THE CURRENT WORKING DIRECTORY
    while (Directory.exist(test_path0) && test_path0.size() < maxPathLength) {
        tryNewName()
    }
    if (test_path0.size() >= maxPathLength) {
        return ""
    }
    var test_path1 = test_path0 + "/test1"
    var test_path2 = test_path1 + "/test2"
    var test_path3 = test_path2 + "/test3"
    var test_path_tmp = test_path3 + "/tmp"

    if (!Directory.create(test_path0)) { return "" }
    if (!Directory.create(test_path1)) { return "" }
    if (!Directory.create(test_path2)) { return "" }
    if (!Directory.create(test_path3)) { return "" }
    if (!Directory.create(test_path_tmp)) { return "" }
    return test_path3
}

func deleteTestDirInPwd(): Bool {
    if (!Directory.delete(test_path0, true)) { return false }
    if (Directory.exist(test_path0)) { return false }
    return true
}


func main(): Int64{

    var test_dir: String = createAndGetTestDirInPwd()
    if (test_dir.size() <= 0) {
        if (test_path0.size() >= maxPathLength) {
            return 1
        }
        if (Directory.exist(test_path0)) {
            deleteTestDirInPwd()
        }
        return 1
    }
	
    if (!Directory.create(test_dir + "/" + "/tmp/src1")) {
        return 1
    }

    if (Directory.move(test_dir + "/" + "/tmp/src1", test_dir + "/" + "/root/des1")) {
        return 1
    }

    Directory.delete(test_dir + "/" + "/tmp/src1", true)
	if (!deleteTestDirInPwd()) {
		return 1 
	}
    return 0
}