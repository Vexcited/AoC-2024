export const run = (input: string): number => {
  const lines = input.split('\n');
  const as: number[] = [], bs: number[] = [];
  
  for (const line of lines) {
    const [a, b] = line.split(' ').filter(a => a !== "").map(Number);
    as.push(a);
    bs.push(b);
  }
  
  const appearencesInListB = new Map<number, number>();
  let total = 0;
  
  for (const a of Array.from(new Set(as))) {
    for (const b of bs) {
      if (a === b) {
        appearencesInListB.set(a, (appearencesInListB.get(a) || 0) + 1);
      }
    }
  }

  for (const number of as) {
    const appearence = appearencesInListB.get(number) || 0;
    total += number * appearence;
  }
  
  return total;
}

if (require.main === module) {
  const { stdin } = await import("../shared");
  const total = run(stdin);
  console.log(total);
}
