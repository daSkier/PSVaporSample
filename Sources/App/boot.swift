import Vapor

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
}
