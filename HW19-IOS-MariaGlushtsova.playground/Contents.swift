import Foundation

func getData(urlRequest: String) {
    let urlRequest = URL(string: urlRequest)
    guard let url = urlRequest else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
        if error != nil {
            if let error = error as NSError? {
                print("Код ошибки \(error.code): \(error.localizedDescription)")
            }
        } else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
            guard let data = data else { return }
            let dataAsString = String(data: data, encoding: .utf8)
            print("Код ответа: \(response.statusCode)")
            print("Данные: \(String(describing: dataAsString))")
        }
    }.resume()
}

// Ошибка в имени домена
getData(urlRequest: "https://www.fruivice.com/api/fruit/Kiwi")

// Ввела верный API
getData(urlRequest: "https://www.fruityvice.com/api/fruit/Kiwi")
