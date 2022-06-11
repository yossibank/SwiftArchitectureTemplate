import Data

public struct SampleMapper {
    func convert(response: [SampleResponse]) -> [SampleEntity] {
        response.map { response in
            SampleEntity(
                userId: response.userId,
                id: response.id,
                title: response.title,
                body: response.body
            )
        }
    }
}
