//
//  CollectionViewController.swift
//  Test Collection View
//
//  Created by Saad Platini on 11.10.18.
//  Copyright © 2018 Saad Platini. All rights reserved.
//

import UIKit



class CollectionViewController: UICollectionViewController {
    
    
    var plantDataItems = [DataItem]()
    var animalDataItems = [DataItem]()
    var allItems = [[DataItem]]()
    var edit = false
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
        let item = DataItem(title: "New Item", kind: .Animal, imageName: "default.jpeg")
        let index = allItems[0].count
        allItems[0].append(item)
        let indexPath = IndexPath(item: index, section: 0)
        collectionView?.insertItems(at: [indexPath])
        
    }
    
    
  
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        let width = collectionView!.frame.width / 3
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        
        for i in 1...12 {
           
            if i > 9 {
                
                plantDataItems.append(DataItem(title: "Title #\(i)", kind: Kind.Plant, imageName: "img\(i).jpg"))
            
            } else {
                
                plantDataItems.append(DataItem(title: "Title #0\(i)", kind: Kind.Plant, imageName: "img0\(i).jpg"))
            
            }
        
        }
        
        for i in 1...12 {
            if i > 9 {
                animalDataItems.append(DataItem(title: "Another Title #\(i)", kind: Kind.Animal, imageName: "anim\(i).jpg"))
            } else {
                animalDataItems.append(DataItem(title: "Another Title #0\(i)", kind: Kind.Animal, imageName: "anim0\(i).jpg"))
            }
        }
        
        allItems.append(plantDataItems)
        allItems.append(animalDataItems)

    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return allItems.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allItems[section].count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DataItemCell
        let dataItem = allItems[indexPath.section][indexPath.item]
        cell.dataItem = dataItem
        
        
        
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as! DataItemHeader
        var title = ""
        if let kind = Kind(rawValue: indexPath.section) {
            title = kind.description()
        }
        
        sectionHeader.title = title
        
        return sectionHeader
    }

    
    
    //Delete operation
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let alert = UIAlertController(title: "Delete this picture? ", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Yes", style: .default) { (action) in
            
        
            if indexPath.row >= 0 {
                
                self.allItems[indexPath.section].remove(at: indexPath.row)
                self.collectionView?.deleteItems(at: [indexPath])
                print("Deleted \(indexPath)")
                
            }
            
        
        }
        
        let del_action = UIAlertAction(title: "No", style: .default) { (action) in
            
            
            
        }
        alert.addAction(action)
        alert.addAction(del_action)
        
        present(alert, animated : true, completion: nil)
    
    }
    
    
 

    // MARK: UICollectionViewDelegate


    // Uncomment this method to specify if the specified item should be highlighted during tracking
  /*
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }



    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }

*/


// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item

/*
func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return true
    }

*/

    /*
 override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    } */



}
