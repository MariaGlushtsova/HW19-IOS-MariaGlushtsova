import Foundation
import CryptoKit

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

// MARK: - Задание со звездочкой

func MD5(string: String) -> String {
    let digest = Insecure.MD5.hash(data: Data(string.utf8))

    return digest.map {
        String(format: "%02hhx", $0)
    }.joined()
}

MD5(string: "1ac631c7950814dd154df38478204f4363aaa13dd17f5b878ef1fe2f49a005a90a9967aa9")

// Ошибка в имени домена
getData(urlRequest: "https://gateway.mavel.com/v1/public/characters/1009229?ts=1&apikey=17f5b878ef1fe2f49a005a90a9967aa9&hash=fa3a74f0e4fcd5aecc20f1516bc66ed4")

// Ввела верный API
getData(urlRequest: "https://gateway.marvel.com/v1/public/characters/1009229?ts=1&apikey=17f5b878ef1fe2f49a005a90a9967aa9&hash=fa3a74f0e4fcd5aecc20f1516bc66ed4")
