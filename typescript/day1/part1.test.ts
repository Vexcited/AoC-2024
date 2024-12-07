import { test, expect } from "bun:test";
import { run } from "./part1";

test("day1#part1: sample input", () => {
  const input = `3   4
4   3
2   5
1   3
3   9
3   3`.trim();

  expect(run(input)).toBe(11);
});
