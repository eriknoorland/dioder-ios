import UIKit
import SocketIO
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {
    
    let socket: SocketIOClient = SocketIOClient(socketURL: URL(string: "http://pdc.local:8080")!)
    var session: WCSession?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        socket.connect()
        
        session = WCSession.default
        session?.delegate = self
        session?.activate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
//        print("session ios")
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
//        print("sessionDidBecomeInactive")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
//        print("sessionDidDeactivate")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        guard let colour = message["colourChangeRequest"] as? String else {
            replyHandler([:])
            return;
        }
        
        socket.emit("colourChangeRequest", [ "colour": colour ])
        replyHandler([:])
    }
    
    @IBAction func setColourRed(_ sender: UIButton) {
        socket.emit("colourChangeRequest", [ "colour": "ff0000" ])
    }
    
    @IBAction func setColourGreen(_ sender: UIButton) {
        socket.emit("colourChangeRequest", [ "colour": "00ff00" ])
    }
    
    @IBAction func setColourBlue(_ sender: UIButton) {
        socket.emit("colourChangeRequest", [ "colour": "0000ff" ])
    }
}
