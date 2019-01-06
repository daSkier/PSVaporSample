import Vapor
//import CCurl

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
    
    router.get("updatedLists") { req -> Future<View> in
        
        let logger = try req.make(Logger.self)
        logger.info("testing the logging system")
        
        return try req.view().render("hello", ["name": req.parameters.next(String.self)
            ])
    }
}
