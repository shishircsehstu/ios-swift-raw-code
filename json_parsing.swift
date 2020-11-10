struct details: Decodable {
    var name: String
    var description: String
    var courses: [allItems]
}
struct allItems: Decodable {
    var id : Int
    var imageUrl: String
    var link: String
    var name: String 
}
class ViewController: UIViewController {
    @IBOutlet weak var imageViewOut: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let urlStr = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        let session = URLSession.shared
        guard let url = URL(string: urlStr) else {
            return
        }
        session.dataTask(with: url) {
            (data, response, err) in
            guard let data = data else{
                return
            }
            print(data.base64EncodedData())
            do{
                //                let jsonn  = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
                //
                //                guard let newJson = jsonn else{
                return
            }
            //                let items = allItems(json: newJson )
            let json  =  try JSONDecoder().decode(details.self, from: data)
            print(json.name)
            print(json.description)
            print(json.courses.count)
            for newJson in json.courses
            {
                print(newJson.id)
                print(newJson.imageUrl)
                print(newJson.link)
                print(newJson.name)
                print("=================================\n")
                let url = URL(string: newJson.imageUrl)
                let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async() {
                    self.imageViewOut.image = UIImage(data: data!)
                }
            }
            //                print(json.id)
            //                print(json.imageUrl)
            //                print(json.link)
            //                print(json.name)
        }
        catch let jeerr
        {
            print(jeerr.localizedDescription)
        }
    }
    .resume()
    }

}
