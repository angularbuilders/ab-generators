echo "🚧 global prepare";
npm i -g @angular/cli@latest
npm i -g @nrwl/cli@latest
npm i -g json
echo "🏠 global prepare";
echo "🚧 init nx-workspace";
npm init nx-workspace research --appName=www --defaultBase=main e2eTestRunner=none --interactive=false --nxCloud=false --npmScope=rsrch --preset=angular --skipTests=true --style=css --strict=true --unitTestRunner=none
cd research
nx migrate latest
echo "🚧 app intitial configuration ";
