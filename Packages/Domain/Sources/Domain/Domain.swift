import Data

public struct EmptyRepository {}

public struct Domain {

    public struct Usecase {

        public static func FetchSample(
            useTestData: Bool = false
        ) -> UsecaseImpl<Repos.Sample.Get, SampleMapper> {
            .init(
                repository: Repos.Sample.Get(),
                mapper: SampleMapper(),
                useTestData: useTestData
            )
        }
    }
}
