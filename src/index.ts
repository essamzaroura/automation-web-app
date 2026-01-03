import dotenv from 'dotenv';

dotenv.config();

const serverType = process.env.SERVER || 'EXPRESS';

console.log(`Starting server: ${serverType}`);

switch (serverType) {
  case 'EXPRESS':
  default:
    await import('./servers/express/index.js');
    break;
}
