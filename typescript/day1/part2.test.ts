import { test, expect } from "bun:test";
import { run } from "./part2";

test("day1#part2: sample input", () => {
  const input = `3   4
4   3
2   5
1   3
3   9
3   3`.trim();

  expect(run(input)).toBe(31);
});
