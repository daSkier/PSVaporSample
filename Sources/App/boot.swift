import Vapor

/// Called after your application has initialized.
public func boot(_ app: Application) throws {
    // your code here
    
    let logger = try app.make(Logger.self)
    logger.info("testing the logging system")
    
    let fisURLString = "ftp://ftp.fisski.com/Software/Files/Fislist/ALFP919F.zip"
    if let fisURL = URL(string: fisURLString) {
        /// Download file via FTP
        let data = try Data(contentsOf: fisURL)
        if #available(OSX 10.12, *) {
            try data.write(to: FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("vaporTestDownload.zip"))
            logger.info("finished writing ftp download to disk")
        } else {
            // Fallback on earlier versions
            logger.info("FileManager.default.homeDirectoryForCurrentUser not available on this platform")
        }
        
        logger.info("download complete")
    }
}
