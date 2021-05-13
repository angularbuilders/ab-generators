echo "🚧 global prepare";
npm i -g @angular/cli@latest
npm i -g @nrwl/cli@latest
npm i -g json
echo "🏠 global prepare";
echo "🚧 init nx-workspace";
npm init nx-workspace research --appName=init --defaultBase=main --interactive=false --linter=eslint --nxCloud=false --npmScope=rsrch --preset=angular --style=css
cd research
nx migrate latest
echo "🚧 app intitial configuration ";
