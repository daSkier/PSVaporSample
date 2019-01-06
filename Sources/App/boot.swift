import Vapor
import CCurl

/// Called after your application has initialized.
public func boot(_ app: Application) throws {
    // your code here
    
    var configuration = SessionConfiguration()
    configuration.host = "ftp://ftp.fisski.com:21"
    let session = Session(configuration: configuration)
    print("starting download")
    session.download("/Software/Files/Fislist/ALFP919F.zip") {
        (fileURL, error) -> Void in
        print("Download file with result:\n\(String(describing: fileURL)), error: \(String(describing: error))\n\n")
    }
    print("setting up curl objects")
    curl_global_init(Int(CURL_GLOBAL_DEFAULT))
    var curl = curl_easy_init()
    guard (curl != nil) else {
        print("failed to generage curl object")
        return
    }
    print("done setting up curl object")
//    curl_easy_setopt(curl, CURLOPT_URL, "ftp://ftp.fisski.com/Software/Files/Fislist/ALFP919F.zip")
    curlHelperSetOptString(curl, CURLOPT_URL, UnsafePointer("ftp://ftp.fisski.com/Software/Files/Fislist/ALFP919F.zip".cString(using: .utf8)))
    print("creating data object")
    let data = Data()
    var data2 = NSMutableData()
    print("created data object")
    
    withUnsafeMutablePointer(to: &data2) { ptr in
        print("created unsafeMutablePointer")
        curlHelperSetOptWriteFunc(curl, ptr) { (buf: UnsafeMutablePointer<Int8>?, size: Int, nMemb: Int, privateData: UnsafeMutableRawPointer?) -> Int in
            print("attempting to save buffer to mutable data")
            let p = privateData?.assumingMemoryBound(to: NSMutableData.self).pointee
            p?.append((UnsafeRawPointer(buf)?.assumingMemoryBound(to: UInt8.self))!, length: size*nMemb)
            print("attempted to save buffer to mutable data")
            print("lenght of mutable data: \(p?.length)")
            return size*nMemb
        }
    }
    
    let res = curl_easy_perform(curl)
    
    if res != CURLE_OK {
        print("there was an issue with the curl request: curl_easy_perform() error: \(curl_easy_strerror(res))")
    }else {
        print("apparently this was a success and mutableData.length = \(data2.length)")
    }
    
    curl_easy_cleanup(curl)
    
    if #available(OSX 10.12, *) {
        data2.write(to: FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("curlData.zip"), atomically: true)
    } else {
        // Fallback on earlier versions
    }
    
//    curlHelperSetOptWriteFunc(curl, ptr) { (buf: UnsafeMutablePointer<Int8>?, size: Int, nMemb: Int, privateData: UnsafeMutableRawPointer?) -> Int in
//
//        let p = privateData?.assumingMemoryBound(to: CurlInvokerDelegate.self).pointee
//        return (p?.curlWriteCallback(buf!, size: size*nMemb))!
//        data.append(UnsafeRawPointer(buf)?.assumingMemoryBound(to: UInt8.self), len)
//        data2.append(UnsafeRawPointer(buf)?.assumingMemoryBound(to: UInt8.self), length: size*nMemb)
//    }
    
//    curlHelperSetOptWriteFunc(curl, <#T##userData: UnsafeMutableRawPointer!##UnsafeMutableRawPointer!#>, <#T##write_cb: ((UnsafeMutablePointer<Int8>?, Int, Int, UnsafeMutableRawPointer?) -> Int)!##((UnsafeMutablePointer<Int8>?, Int, Int, UnsafeMutableRawPointer?) -> Int)!##(UnsafeMutablePointer<Int8>?, Int, Int, UnsafeMutableRawPointer?) -> Int#>)
    
//    let handle: UnsafeMutableRawPointer? =
}
