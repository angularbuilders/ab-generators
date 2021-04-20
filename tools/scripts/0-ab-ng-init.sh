echo "🚧 global prepare";
npm i -g @angular/cli@latest
npm i -g @nrwl/cli@latest
npm install -g json
echo "🏠 global prepare";
echo "🚧 init nx-workspace";
npm init nx-workspace REPOSITORY --appName=www --defaultBase=main --interactive=false --linter=eslint --nxCloud=false --npmScope=ORGANIZATION --preset=angular --style=css
cd REPOSITORY
echo "🏠 init nx-workspace";
