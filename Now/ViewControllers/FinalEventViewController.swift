//
//  FinalEvent.swift
//  Now
//
//  Created by Дэвид Бердников on 13.02.2022.
//

import UIKit

class FinalEventViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    private var result: Result?
    private var imageURL: Image?
    private var url1 = "https://kudago.com/public-api/v1.4/events/?lang=ru&fields=dates,title,short_title,slug,place,description,body_text,price,images,site_url&expand=images&location=msk&actual_since= 1644761128"
    private var url2 = "https://newsapi.org/v2/everything?q=Apple&from=2022-02-06&sortBy=popularity&apiKey=d522f4ce80244e79b06425239a10ce0c"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    


