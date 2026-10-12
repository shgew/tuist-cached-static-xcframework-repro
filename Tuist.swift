import ProjectDescription

let tuist = Tuist(
    project: .tuist(
        cacheOptions: .options(
            keepSourceTargets: true,
            profiles: .profiles(["external": .profile(.onlyExternal)], default: .custom("external"))
        )
    )
)
