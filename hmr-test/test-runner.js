// Test runner: starts Vite dev server, runs Cypress, then cleans up
import { spawn } from 'child_process';
import { resolve, dirname } from 'path';
import { fileURLToPath } from 'url';
import fs from 'fs';

const __dirname = dirname(fileURLToPath(import.meta.url));

// Snapshot App.elm so we can restore it after tests
const appElmPath = resolve(__dirname, 'App.elm');
const originalContent = fs.readFileSync(appElmPath, 'utf-8');

function cleanup(viteProcess) {
  // Restore App.elm
  try {
    fs.writeFileSync(appElmPath, originalContent);
  } catch (e) {
    console.error('Failed to restore App.elm:', e.message);
  }
  // Kill Vite
  if (viteProcess && !viteProcess.killed) {
    viteProcess.kill('SIGTERM');
  }
}

// Handle unexpected exits
process.on('SIGINT', () => { cleanup(vite); process.exit(1); });
process.on('SIGTERM', () => { cleanup(vite); process.exit(1); });

console.log('Starting Vite dev server...');

const vite = spawn('npx', ['vite', '--port', '5173', '--strictPort'], {
  cwd: __dirname,
  stdio: ['pipe', 'pipe', 'pipe'],
  env: { ...process.env, FORCE_COLOR: '0' },
});

let viteOutput = '';

vite.stdout.on('data', (data) => {
  viteOutput += data.toString();
});

vite.stderr.on('data', (data) => {
  viteOutput += data.toString();
});

// Wait for Vite to be ready
function waitForVite(timeout = 120000) {
  return new Promise((resolve, reject) => {
    const start = Date.now();

    vite.on('close', (code) => {
      reject(new Error(`Vite exited with code ${code}\nOutput:\n${viteOutput}`));
    });

    const check = () => {
      if (viteOutput.includes('Local:') || viteOutput.includes('ready in')) {
        resolve();
      } else if (Date.now() - start > timeout) {
        reject(new Error('Vite did not start in time.\nOutput:\n' + viteOutput));
      } else {
        setTimeout(check, 500);
      }
    };
    check();
  });
}

try {
  await waitForVite();
  console.log('Vite is ready. Running Cypress...');

  const cypress = spawn('npx', ['cypress', 'run', '--browser', 'chrome'], {
    cwd: __dirname,
    stdio: 'inherit',
    env: { ...process.env },
  });

  const exitCode = await new Promise((resolve) => {
    cypress.on('close', resolve);
  });

  cleanup(vite);
  process.exit(exitCode);
} catch (err) {
  console.error(err.message);
  cleanup(vite);
  process.exit(1);
}
