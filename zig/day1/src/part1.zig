const std = @import("std");

pub fn main() !void {
    const stdinFile = std.io.getStdIn();
    var stdinBuffer = std.io.bufferedReader(stdinFile.reader());
    const stdin = stdinBuffer.reader();

    const stdoutFile = std.io.getStdOut();
    var stdoutBuffer = std.io.bufferedWriter(stdoutFile.writer());
    const stdout = stdoutBuffer.writer();

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer _ = gpa.deinit();

    var as = std.ArrayList(isize).init(allocator);
    defer as.deinit();

    var bs = std.ArrayList(isize).init(allocator);
    defer bs.deinit();

    while (try stdin.readUntilDelimiterOrEofAlloc(gpa.allocator(), '\n', 4096)) |line| {
        defer allocator.free(line);

        var iterator = std.mem.split(u8, line, " ");
        var a: isize = -1;
        var b: isize = -1;

        while (iterator.next()) |ch| {
            if (ch.len == 0) continue;

            if (a == -1) {
                a = try std.fmt.parseInt(isize, ch, 10);
            } else if (b == -1) {
                b = try std.fmt.parseInt(isize, ch, 10);
            }
        }

        try as.append(@intCast(a));
        try bs.append(@intCast(b));
    }

    std.mem.sort(isize, as.items, {}, comptime std.sort.asc(isize));
    std.mem.sort(isize, bs.items, {}, comptime std.sort.asc(isize));

    var total: usize = 0;

    for (as.items, 0..) |a, i| {
        const b = bs.items[i];
        const distance = @abs(a - b);
        total += distance;
    }

    try stdout.print("{}\n", .{total});
    try stdoutBuffer.flush();
}
