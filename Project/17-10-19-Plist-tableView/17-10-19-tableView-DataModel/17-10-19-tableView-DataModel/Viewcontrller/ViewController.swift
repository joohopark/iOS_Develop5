//
//  ViewController.swift
//  17-10-19-tableView-DataModel
//
//  Created by MIN JUN JU on 2017. 10. 19..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artlistLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    // 이게 뭔지는 모르겠지만 추가됨.
    var albumModel: AlbumModel?
    var songList:[SongData]? {
        
        return albumModel?.songList
    }
    
    
    func creatAlbumDataToModel() {
        
        self.albumModel = AlbumModel(dataDic: album)
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //실행을 하면, 값이 들어감.
        creatAlbumDataToModel()
        
        // 타이틀 값을 넣기 위해서 
        firstLabel.text = self.albumModel?.albumInfo.albumTitle
        secondLabel.text = self.albumModel?.albumInfo.artist
        thirdLabel.text = self.albumModel?.albumInfo.genre
        
        //데이터 소스를 넣기위해
        
        tableView.dataSource = self
        
        //register 등록 -> register 등록을 storyboard 자체에서 할수도 있음..! 하는 방법 기억 하고 적어놓자.
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
    }
    
    //row 개수 표시
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // 실패하면 0.
        return songList?.count ?? 0
    }
    
    
    // cell을 만들어 주어야함
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // 테이블뷰의 각 row별로 타이블 제목을 지정해줄수 있다.
        cell.textLabel?.text = songList![indexPath.row].songTitle
        
        
        return cell
    }

    


}

