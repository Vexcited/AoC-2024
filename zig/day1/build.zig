const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const part1 = b.addExecutable(.{
        .name = "part1",
        .root_source_file = b.path("src/part1.zig"),
        .target = target,
        .optimize = optimize,
    });

    // const part2 = b.addExecutable(.{
    //     .name = "part2",
    //     .root_source_file = b.path("src/part2.zig"),
    //     .target = target,
    //     .optimize = optimize,
    // });

    b.installArtifact(part1);
    // b.installArtifact(part2);

    const part1_cmd = b.addRunArtifact(part1);
    part1_cmd.step.dependOn(b.getInstallStep());

    // const part2_cmd = b.addRunArtifact(part2);
    // part2_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        part1_cmd.addArgs(args);
        // part2_cmd.addArgs(args);
    }

    const run_part1 = b.step("p1", "Run the part 1");
    run_part1.dependOn(&part1_cmd.step);

    // const run_part2 = b.step("p2", "Run the part 2");
    // run_part2.dependOn(&part2_cmd.step);
}
