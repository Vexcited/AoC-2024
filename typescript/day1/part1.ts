export const run = (input: string): number => {
  const lines = input.split('\n');
  const as: number[] = [], bs: number[] = [];
  
  for (const line of lines) {
    const [a, b] = line.split(' ').filter(a => a !== "").map(Number);
    as.push(a);
    bs.push(b);
  }
  
  as.sort((a, b) => a - b);
  bs.sort((a, b) => a - b);
  
  let total = 0;
  for (let i = 0; i < lines.length; i++) {
    const distance = Math.abs(as[i] - bs[i]);
    total += distance;
  }
  
  return total;
}

if (require.main === module) {
  const { stdin } = await import("../shared");
  const total = run(stdin);
  console.log(total);
}
