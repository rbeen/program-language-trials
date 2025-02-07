const std = @import("std");

export fn fizzbuzz(n: usize) ?[*:0]const u8 {
    if (n % 5 == 0) {
        if (n % 3 == 0) {
            return "fizzbuzz";
        } else {
            return "fizz";
        }
    } else if (n % 3 == 0) {
        return "buzz";
    }
    return null;
}

// Example function to check if a string contains a substring
fn stringContains(haystack: []const u8, needle: []const u8) bool {
    const needle_len = needle.len;
    if (needle_len == 0) return true;
    const haystack_len = haystack.len;

    var i: usize = 0;
    while (i <= haystack_len - needle_len) : (i += 1) {
        if (std.mem.eql(u8, haystack[i..][0..needle_len], needle)) {
            return true;
        }
    }
    return false;
}

test "check the fizzbuzz protocolio" {
    for (0..100) |n| {
        if (n % 5 == 0 and n % 3 == 0) {
            try std.testing.expectEqual("fizzbuzz", fizzbuzz(n));
        } else if (n % 5 == 0) {
            try std.testing.expectEqual("fizz", fizzbuzz(n));
        } else if (n % 3 == 0) {
            try std.testing.expectEqual("buzz", fizzbuzz(n));
        } else {
            try std.testing.expectEqual(null, fizzbuzz(n));
        }
    }
}
