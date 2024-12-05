export let stdin = "";

// @ts-expect-error : bun stream type is not correct...
for await (const chunk of Bun.stdin.stream()) {
  // chunk is Uint8Array
  // this converts it to text (assumes ASCII encoding)
  stdin += Buffer.from(chunk).toString();
}
