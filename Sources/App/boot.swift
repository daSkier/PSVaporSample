import Vapor
import CCurl

/// Called after your application has initialized.
public func boot(_ app: Application) throws {
    // your code here
    
    let logger = try app.make(Logger.self)
    logger.info("testing the logging system")
    
//    print("setting up curl objects")
//    curl_global_init(Int(CURL_GLOBAL_DEFAULT))
//    var curl = curl_easy_init()
//    guard (curl != nil) else {
//        print("failed to generage curl object")
//        return
//    }
//    logger.info("done setting up curl object")
////    curl_easy_setopt(curl, CURLOPT_URL, "ftp://ftp.fisski.com/Software/Files/Fislist/ALFP919F.zip")
//    curlHelperSetOptString(curl, CURLOPT_URL, UnsafePointer("ftp://ftp.fisski.com/Software/Files/Fislist/ALFP919F.zip".cString(using: .utf8)))
//    
//    
//    logger.info("creating data object")
//    var data2 = NSMutableData()
////    logger.info("created data object")
//    
//    withUnsafeMutablePointer(to: &data2) { ptr in
////        logger.info("created unsafeMutablePointer")
//        curlHelperSetOptWriteFunc(curl, ptr) { (buf: UnsafeMutablePointer<Int8>?, size: Int, nMemb: Int, privateData: UnsafeMutableRawPointer?) -> Int in
////            logger.info("attempting to save buffer to mutable data")
//            
//            ///NSMutableData implementation
//            let p = privateData?.assumingMemoryBound(to: NSMutableData.self).pointee
//            p?.append((UnsafeRawPointer(buf)?.assumingMemoryBound(to: UInt8.self))!, length: size*nMemb)
////            logger.info("attempted to save buffer to mutable data")
////            logger.info("lenght of mutable data: \(p?.length)")
//            
//            return size*nMemb
//        }
//    }
//    
//    let res = curl_easy_perform(curl)
//    
//    if res != CURLE_OK {
//        logger.info("there was an issue with the curl request: curl_easy_perform() error: \(curl_easy_strerror(res))")
//    }else {
//        logger.info("apparently this was a success and mutableData.length = \(data2.length)")
//    }
//    
//    curl_easy_cleanup(curl)
//    logger.info("finished curl cleanup")
    

}
