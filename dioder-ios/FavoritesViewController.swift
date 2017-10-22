import UIKit

class FavoritesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var favoritesCollectionView: UICollectionView!
    
    let colours:[String] = ["ff0000", "00ff00", "0000ff", "ffff00", "ff00ff", "0000ff"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let itemSize = UIScreen.main.bounds.width / 3 - 3
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(20, 0, 10, 0)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumInteritemSpacing = 3;
        layout.minimumLineSpacing = 3
        
        favoritesCollectionView.collectionViewLayout = layout
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colours.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let favorite = collectionView.dequeueReusableCell(withReuseIdentifier: "Favorite", for: indexPath) as! Favorite
        favorite.colourView.backgroundColor = UIColor(red:1.00, green:0.00, blue:0.00, alpha:1.0)
        return favorite
    }
}

