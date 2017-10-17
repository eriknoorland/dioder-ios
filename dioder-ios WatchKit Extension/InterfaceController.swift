import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate {

    var session: WCSession?
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        session = WCSession.default
        session?.delegate = self
        session?.activate()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
//        print("session watchos")
    }
    @IBAction func setColourRed() {
        session?.sendMessage(["colourChangeRequest": "ff0000"], replyHandler: { response in
//            print("received reply from iPhone\n\(response)")
        }, errorHandler: { error in
//            print("error sending message\n\(error)")
        })
    }
    @IBAction func setColourGreen() {
        session?.sendMessage(["colourChangeRequest": "00ff00"], replyHandler: { response in
//            print("received reply from iPhone\n\(response)")
        }, errorHandler: { error in
//            print("error sending message\n\(error)")
        })
    }
    @IBAction func setColourBlue() {
        session?.sendMessage(["colourChangeRequest": "0000ff"], replyHandler: { response in
//            print("received reply from iPhone\n\(response)")
        }, errorHandler: { error in
//            print("error sending message\n\(error)")
        })
    }
}
