import Vapor
import CCurl

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // "It works" page
    router.get { req in
        return try req.view().render("welcome")
    }
    
    // Says hello
    router.get("hello", String.parameter) { req -> Future<View> in
        return try req.view().render("hello", [
            "name": req.parameters.next(String.self)
        ])
    }
    
//    router.get("updatedLists") { req -> Future<Int> in
//        
//        let logger = try req.make(Logger.self)
//        logger.info("testing the logging system")
//        
//        let fisURLString = "ftp://ftp.fisski.com/Software/Files/Fislist/ALFP919F.zip"
//        if let fisURL = URL(string: fisURLString) {
//         return try
//        }
//        return try
//    }
}
