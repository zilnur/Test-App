import Foundation
import Combine

class NetworkManager {
    
    enum Paths: String {
        case categories = "/v3/058729bd-1402-4578-88de-265481fd7d54"
        case dishes = "/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b"
    }
    
    func decoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
    
    func url(path: Paths) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "run.mocky.io"
        components.path = path.rawValue
        return components.url!
    }
    
    func makeCategoriesRequest<T: Decodable>(model: T.Type, path: Paths) -> AnyPublisher<T, Error> {
        let request = URLRequest(url: url(path: path))
        let session = URLSession.shared.dataTaskPublisher(for: request)
            .map {$0.data}
            .decode(type: T.self, decoder: decoder())
            .eraseToAnyPublisher()
        return session
    }
}
