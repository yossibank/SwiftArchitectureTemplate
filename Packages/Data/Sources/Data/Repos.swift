public enum Repos {
    public enum Sample {
        public typealias Get = Repository<SampleGetRequest>
        public typealias Post = Repository<SamplePostRequest>
        public typealias Put = Repository<SamplePutRequest>
        public typealias Delete = Repository<SampleDeleteRequest>
    }

    public enum Onboarding {
        public typealias GetIsFinished = Repository<GetOnboardingFinishedRequest>
        public typealias SetIsFinished = Repository<SetOnboardingFinishedRequest>
    }
}
